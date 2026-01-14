using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web.Services;
using System.Web;
using System.Web.UI;

namespace finalyearproject
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userId = Session["userid"]?.ToString();

                if (string.IsNullOrEmpty(userId))
                {
                    Response.Redirect("login.aspx");
                    return;
                }

                if (Request.QueryString["BookID"] != null)
                {
                    int bookID;
                    if (int.TryParse(Request.QueryString["BookID"], out bookID))
                    {
                        // Optional: Add book to cart logic
                    }
                }

                LoadCartFromDatabase();
            }
            else
            {
                if (Session["CartItems"] != null)
                {
                    DataTable dtCart = Session["CartItems"] as DataTable;
                    BindCartItems(dtCart);
                }
            }
        }

        private void LoadCartFromDatabase()
        {
            string userid = Session["userid"]?.ToString();
            if (string.IsNullOrEmpty(userid))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string connStr = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT c.cartid, c.bookid, c.bookname, c.quantity, b.bookphoto, b.cost 
            FROM cart c
            JOIN addbooks b ON c.bookid = b.bookid
            WHERE c.userid = @UserID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userid);
                    conn.Open();

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (!dt.Columns.Contains("Base64Image"))
                        dt.Columns.Add("Base64Image", typeof(string));
                    if (!dt.Columns.Contains("quantity"))
                        dt.Columns.Add("quantity", typeof(int));

                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["bookphoto"] != DBNull.Value)
                        {
                            byte[] imgBytes = (byte[])row["bookphoto"];
                            row["Base64Image"] = "data:image/jpeg;base64," + Convert.ToBase64String(imgBytes);
                        }

                        if (row["quantity"] == DBNull.Value || Convert.ToInt32(row["quantity"]) == 0)
                        {
                            row["quantity"] = 1;
                        }
                    }

                    Session["CartItems"] = dt;
                    BindCartItems(dt);
                }
            }
        }

        private void BindCartItems(DataTable dtCart)
        {
            if (dtCart.Rows.Count > 0)
            {
                rptCart.DataSource = dtCart;
                rptCart.DataBind();
                pnlCartItems.Visible = true;
                pnlEmptyCart.Visible = false;

                UpdateTotalAmount(dtCart);
            }
            else
            {
                pnlCartItems.Visible = false;
                pnlEmptyCart.Visible = true;
            }
        }

        private void UpdateTotalAmount(DataTable dtCart)
        {
            decimal subtotal = 0;
            foreach (DataRow row in dtCart.Rows)
            {
                subtotal += Convert.ToDecimal(row["cost"]) * Convert.ToInt32(row["quantity"]);
            }

            string userId = Session["userid"]?.ToString();
            decimal shippingCharge = 0;

            // Check if it's the user's first order
            if (!string.IsNullOrEmpty(userId) && !IsFirstOrder(userId))
            {
                shippingCharge = 65; // Add ₹65 for non-first orders
            }

            decimal total = subtotal + shippingCharge;

            // Save total amount in the session for use during checkout
            Session["totalamount"] = total;
            
            // Update the hidden field for total amount (used by the frontend)
            hdnTotalAmount.Value = total.ToString("0.00");

            decimal totala = Convert.ToDecimal(Session["totalamount"]);
            // Update the frontend dynamically
            ScriptManager.RegisterStartupScript(this, GetType(), "UpdateCartSummary",
                $@"
        document.getElementById('subtotalAmount').innerText = '₹{subtotal.ToString("0.00")}';
        document.getElementById('shippingCharge').innerText = '{(shippingCharge > 0 ? "₹" + shippingCharge.ToString("0.00") : "Free")}';
        document.getElementById('totalAmount').innerText = '₹{totala.ToString("0.00")}';
        ", true);
        }

        private bool IsFirstOrder(string userId)
        {
            bool isFirstOrder = false;
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM orderdetails WHERE userid = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                int orderCount = (int)cmd.ExecuteScalar();
                conn.Close();

                isFirstOrder = (orderCount == 0); // True if no orders exist
            }

            return isFirstOrder;
        }
        [WebMethod]


        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveBook")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                RemoveCartItemFromDatabase(cartId);

                DataTable dtCart = Session["CartItems"] as DataTable;
                if (dtCart != null)
                {
                    DataRow rowToRemove = dtCart.AsEnumerable()
                        .FirstOrDefault(row => Convert.ToInt32(row["cartid"]) == cartId);
                    if (rowToRemove != null)
                        dtCart.Rows.Remove(rowToRemove);

                    BindCartItems(dtCart);
                }
            }



        }
    

        [WebMethod]
        public static string UpdateCartQuantity(int cartID, int newQuantity)
        {
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Open the connection
                    connection.Open();

                    // SQL query to update the quantity
                    string query = "UPDATE cart SET quantity = @Quantity WHERE cartid = @CartID";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Add parameters to the SQL query
                        command.Parameters.AddWithValue("@Quantity", newQuantity);
                        command.Parameters.AddWithValue("@CartID", cartID);

                        // Execute the query
                        int rowsAffected = command.ExecuteNonQuery();

                        // Check if the update was successful
                        if (rowsAffected > 0)
                        {
                            // Refresh the cart items from the database
                            HttpContext.Current.Session["CartItems"] = GetUpdatedCartItems();
                            return "Success";
                        }
                        else
                        {
                            return "Error: No rows affected. CartID may not exist.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log or handle the exception
                return "Error: " + ex.Message;
            }
        }

        private static DataTable GetUpdatedCartItems()
        {
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
            string userid = HttpContext.Current.Session["userid"]?.ToString();

            if (string.IsNullOrEmpty(userid))
            {
                throw new Exception("User is not logged in.");
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT c.cartid, c.bookid, c.bookname, b.bookphoto, b.cost, c.quantity
                    FROM cart c
                    JOIN addbooks b ON c.bookid = b.bookid
                    WHERE c.userid = @UserID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userid);

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (!dt.Columns.Contains("Base64Image"))
                        dt.Columns.Add("Base64Image", typeof(string));

                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["bookphoto"] != DBNull.Value)
                        {
                            byte[] imgBytes = (byte[])row["bookphoto"];
                            row["Base64Image"] = "data:image/jpeg;base64," + Convert.ToBase64String(imgBytes);
                        }
                    }

                    return dt;
                }
            }
        }

        // Example method to update the database



        private void RemoveCartItemFromDatabase(int cartId)
        {
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM cart WHERE cartid = @CartID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CartID", cartId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            DataTable dtCart = Session["CartItems"] as DataTable;

            if (dtCart != null)
            {
                for (int i = 0; i < dtCart.Rows.Count && i < 3; i++)
                {
                    Session[$"item{i + 1}_name"] = dtCart.Rows[i]["bookname"].ToString();
                    Session[$"item{i + 1}_quantity"] = Convert.ToInt32(dtCart.Rows[i]["quantity"]);
                }
            }

            if (Session["totalamount"] != null)
            {
                Session["checkout_totalamount"] = Session["totalamount"];
            }
            Response.Redirect("Checkout.aspx");
        }

        protected void hdnTotalAmount_ValueChanged(object sender, EventArgs e)
        {
            // Not used
        }

    }
}
