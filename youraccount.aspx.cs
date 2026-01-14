using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace finalyearproject
{
    public partial class youraccount : System.Web.UI.Page
    {
        string connString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
                LoadOrderDetails();
            }
        }

        private void LoadUserData()
        {
            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT * FROM logintable WHERE userid = @userid";

                    try
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@userid", userId);
                            SqlDataReader reader = cmd.ExecuteReader();

                            if (reader.Read())
                            {
                                txtUsername.Text = reader["username"].ToString();
                                txtPassword.Text = reader["password"].ToString();
                                txtEmail.Text = reader["email"].ToString();
                                txtPhone.Text = reader["phonenumber"].ToString();
                                txtAddress.Text = reader["address"].ToString();
                            }
                            reader.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('❌ Error: {ex.Message}');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('⚠️ Session expired or UserID not found. Please login again.'); window.location='login.aspx';</script>");
            }
        }
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadOrderDetails();
        }

        private void LoadOrderDetails()
        {
            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
                SELECT  od.orderid AS OrderID, 
                    ab.bookphoto AS BookImage,
                    ab.bookname AS BookName,
                    oi.quantity AS Quantity,
                    od.deliveryaddress AS AddressDetails,
                    od.orderdate AS OrderDate,
                    od.deliverydate AS DeliveryDate,
                    od.orderstatus AS OrderStatus
                FROM orderdetails od
                INNER JOIN orderitemdetails oi ON od.orderid = oi.orderid
                INNER JOIN addbooks ab ON oi.bookid = ab.bookid
                WHERE od.userid = @UserID";

                    try
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            dt.Columns.Add("BookImageUrl", typeof(string));
                            foreach (DataRow row in dt.Rows)
                            {
                                if (row["BookImage"] != DBNull.Value && row["BookImage"] is byte[] imageBytes)
                                {
                                    row["BookImageUrl"] = "data:image/jpeg;base64," + Convert.ToBase64String(imageBytes);
                                }
                                else
                                {
                                    row["BookImageUrl"] = "/images/default.png";
                                }
                            }

                            rptOrders.DataSource = dt;
                            rptOrders.DataBind();
                            lblNoOrders.Visible = dt.Rows.Count == 0;
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('❌ Error: {ex.Message}');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('⚠️ Session expired or UserID not found. Please login again.'); window.location='login.aspx';</script>");
            }
        }

        protected string GetStatusButtonClass(string status)
        {
            switch (status.ToLower())
            {
                case "delivered":
                    return "btn btn-success disabled"; // Optional: disable styling
                case "shipped":
                    return "btn btn-info";
                case "processing":
                    return "btn btn-warning";
                case "out of delivery":
                    return "btn btn-danger";
                default:
                    return "btn btn-secondary";
            }
        }
        protected void btnStatus_Command(object sender, CommandEventArgs e)
        {
            int orderId = Convert.ToInt32(e.CommandArgument);

            // Use ViewState to track click count for this order ID
            string viewStateKey = "ClickCount_" + orderId;

            int clickCount = ViewState[viewStateKey] != null ? (int)ViewState[viewStateKey] : 0;
            clickCount++;
            ViewState[viewStateKey] = clickCount;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string selectQuery = "SELECT orderstatus FROM orderdetails WHERE orderid = @orderid";
                using (SqlCommand selectCmd = new SqlCommand(selectQuery, conn))
                {
                    selectCmd.Parameters.AddWithValue("@orderid", orderId);
                    string currentStatus = Convert.ToString(selectCmd.ExecuteScalar());

                    if (currentStatus.Equals("Out of Delivery", StringComparison.OrdinalIgnoreCase))
                    {
                        if (clickCount == 2)
                        {
                            // Change status to Delivered
                            string updateQuery = "UPDATE orderdetails SET orderstatus = 'Delivered' WHERE orderid = @orderid";
                            using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                            {
                                updateCmd.Parameters.AddWithValue("@orderid", orderId);
                                updateCmd.ExecuteNonQuery();
                            }

                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('✅ Order Recieved Successfully🎉.');", true);
                            Response.Redirect("feedback.aspx");

                            // Reset the click count after status change
                            ViewState.Remove(viewStateKey);

                            LoadOrderDetails();

                        }
                    }
                    else
                    {
                        // If not "Out of Delivery", reset count and ignore click
                        ViewState.Remove(viewStateKey);
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('❌ Only orders with status \"Out of Delivery\" can be marked as Delivered.');", true);
                    }
                }
            }
        }


        protected void txtAddress_TextChanged(object sender, EventArgs e)
        {
            // Handle address text change if needed
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
            // Handle username text change if needed
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }
    }
}