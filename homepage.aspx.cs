using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace finalyearproject
{
    public partial class homepage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CheckOrderStatus();
            }
        }
        private void CheckOrderStatus()
        {
            if (Session["UserID"] != null)
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                string connString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = @"
            SELECT COUNT(*) 
            FROM orderdetails 
            WHERE userid = @UserID AND orderstatus = 'Out of Delivery'";

                    try
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            int orderCount = (int)cmd.ExecuteScalar();

                            // Log the order count (for debugging)
                            System.Diagnostics.Debug.WriteLine($"Order Count: {orderCount}");

                            // If the user has any order with status "Out for Delivery"
                            if (orderCount > 0)
                            {
                                // Use ScriptManager if UpdatePanel is present

                                ClientScript.RegisterStartupScript(this.GetType(), "alertRedirect",
"alert('⚠️ Your order is out for delivery. If you have received it, please double-click the status in Your Account to mark it as Delivered.'); window.location='youraccount.aspx';", true);

                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine($"Error: {ex.Message}");
                        Response.Write($"<script>alert('❌ Error: {ex.Message}');</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('⚠️ Session expired or UserID not found. Please login again. If you are a new user go to signup page'); window.location='login.aspx';</script>");
            }
        }
        protected void btnNewArrivals_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("new_books.aspx");
        }

        protected void btnDiscount_Click(object sender, EventArgs e)
        {
            Response.Redirect("discount_books.aspx");
        }

        protected void lnkAppRatings_Click(object sender, EventArgs e)
        {
            Response.Redirect("ratings.aspx");
        }

        protected void lnkNewPublisher_Click(object sender, EventArgs e)
        {
            Response.Redirect("new_publisher.aspx");
        }

        protected void lnkYourAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("account.aspx");
        }

        protected void lnkHelpSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("settings.aspx");
        }

        protected void btnExplore_Click(object sender, EventArgs e)
        {
            Response.Redirect("new_books.aspx");

        }
    }
}
