using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace finalyearproject
{
    public partial class payment : System.Web.UI.Page
    {
        string connString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["checkout_totalamount"] != null)
                {
                    // Format total with currency symbol
                    decimal total = Convert.ToDecimal(Session["checkout_totalamount"]);
                    txtNumber.Text = $"{total:0.00}";
                }
                else
                {
                    Response.Redirect("Cart.aspx"); // Redirect if no total
                }
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["userid"] != null && Session["checkout_totalamount"] != null && Session["address"] != null)
            {
                int userId = Convert.ToInt32(Session["userid"]);
                string address = Session["address"].ToString();
                DateTime orderDate = DateTime.Now;
                DateTime deliveryDate = orderDate.AddDays(3);
                decimal totalAmount = Convert.ToDecimal(Session["checkout_totalamount"]);
                string paymentStatus = "Paid";
                string orderStatus = "Processing";

                DataTable dtCart = Session["CartItems"] as DataTable;

                if (dtCart == null || dtCart.Rows.Count == 0)
                {
                    Response.Write("<script>alert('❌ Cart is empty. Please add items before submitting payment.');</script>");
                    return;
                }

                // Debug: Check Cart Data before Payment
                foreach (DataRow row in dtCart.Rows)
                {
                    Console.WriteLine($"Book: {row["bookname"]}, Quantity: {row["quantity"]}, Cost: {row["cost"]}, Total Price: {Convert.ToInt32(row["quantity"]) * Convert.ToDecimal(row["cost"])}");
                }

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    SqlTransaction transaction = conn.BeginTransaction();

                    try
                    {
                        // Insert into orderdetails and get the new order ID
                        string insertOrderQuery = @"
                            INSERT INTO orderdetails 
                            (userid, orderdate, deliverydate, totalamount, paymentstatus, deliveryaddress, orderstatus)
                            VALUES 
                            (@userid, @orderdate, @deliverydate, @totalamount, @paymentstatus, @deliveryaddress, @orderstatus);
                            SELECT CAST(SCOPE_IDENTITY() AS INT);";

                        using (SqlCommand cmd = new SqlCommand(insertOrderQuery, conn, transaction))
                        {
                            cmd.Parameters.AddWithValue("@userid", userId);
                            cmd.Parameters.AddWithValue("@orderdate", orderDate);
                            cmd.Parameters.AddWithValue("@deliverydate", deliveryDate);
                            cmd.Parameters.AddWithValue("@totalamount", totalAmount);
                            cmd.Parameters.AddWithValue("@paymentstatus", paymentStatus);
                            cmd.Parameters.AddWithValue("@deliveryaddress", address);
                            cmd.Parameters.AddWithValue("@orderstatus", orderStatus);

                            int insertedOrderId = Convert.ToInt32(cmd.ExecuteScalar());

                            // Debug: Check Order ID
                            Console.WriteLine($"Inserted Order ID: {insertedOrderId}");

                            // Insert each cart item into orderitemdetails
                            SqlCommand itemCmd = new SqlCommand(@"
                                INSERT INTO orderitemdetails 
                                (orderid, bookid, bookname, quantity, priceperunit, totalprice)
                                VALUES 
                                (@orderid, @bookid, @bookname, @quantity, @priceperunit, @totalprice)", conn, transaction);

                            itemCmd.Parameters.Add("@orderid", SqlDbType.Int).Value = insertedOrderId;
                            itemCmd.Parameters.Add("@bookid", SqlDbType.Int);
                            itemCmd.Parameters.Add("@bookname", SqlDbType.VarChar, 255);
                            itemCmd.Parameters.Add("@quantity", SqlDbType.Int);
                            itemCmd.Parameters.Add("@priceperunit", SqlDbType.Decimal);
                            itemCmd.Parameters.Add("@totalprice", SqlDbType.Decimal);

                            foreach (DataRow row in dtCart.Rows)
                            {
                                // Debug: Check Values before Insertion
                                Console.WriteLine($"Inserting Order Item: BookID={row["bookid"]}, Quantity={row["quantity"]}, TotalPrice={Convert.ToInt32(row["quantity"]) * Convert.ToDecimal(row["cost"])}");

                                itemCmd.Parameters["@bookid"].Value = Convert.ToInt32(row["bookid"]);
                                itemCmd.Parameters["@bookname"].Value = row["bookname"].ToString();
                                itemCmd.Parameters["@quantity"].Value = Convert.ToInt32(row["quantity"]);
                                itemCmd.Parameters["@priceperunit"].Value = Convert.ToDecimal(row["cost"]);
                                itemCmd.Parameters["@totalprice"].Value = Convert.ToInt32(row["quantity"]) * Convert.ToDecimal(row["cost"]);

                                itemCmd.ExecuteNonQuery();
                            }

                            // Update stock
                            if (!UpdateBookStock(conn, transaction, dtCart))
                            {
                                // If stock update failed, rollback
                                transaction.Rollback();
                                return;
                            }

                            // All done — commit the transaction
                            transaction.Commit();

                            // Clear cart and session data
                            Session["CartItems"] = null;
                            Session["checkout_totalamount"] = null;
                            string deleteCartQuery = "DELETE FROM cart WHERE userid = @userid";
                            using (SqlCommand deleteCmd = new SqlCommand(deleteCartQuery, conn))
                            {
                                deleteCmd.Parameters.AddWithValue("@userid", userId);
                                deleteCmd.ExecuteNonQuery();
                            }

                            string message = $"✔️ Payment successful! Order ID: {insertedOrderId}, Amount: ₹{totalAmount}";
                            
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}'); window.location='youraccount.aspx';", true);

                        }
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        Response.Write("<script>alert('❌ Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('❌ Session missing. Please log in and try again.');</script>");
            }
        }

        private bool UpdateBookStock(SqlConnection conn, SqlTransaction transaction, DataTable dtCart)
        {
            string updateStockQuery = @"
                UPDATE addbooks 
                SET stocks = stocks - @quantity
                WHERE bookid = @bookid AND stocks >= @quantity";

            try
            {
                foreach (DataRow row in dtCart.Rows)
                {
                    int bookid = Convert.ToInt32(row["bookid"]);
                    int quantity = Convert.ToInt32(row["quantity"]);

                    using (SqlCommand cmd = new SqlCommand(updateStockQuery, conn, transaction))
                    {
                        cmd.Parameters.AddWithValue("@quantity", quantity);
                        cmd.Parameters.AddWithValue("@bookid", bookid);

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected == 0)
                        {
                            Response.Write("<script>alert('❌ Not enough stock for book ID: " + bookid + "');</script>");
                            return false;
                        }
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('❌ Stock update error: {ex.Message}');</script>");
                return false;
            }
        }

        protected void txtNumber_TextChanged(object sender, EventArgs e)
        {
            // Not used but required for server event binding
        }
    }
}
