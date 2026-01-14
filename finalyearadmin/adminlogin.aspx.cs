




using System;
using System.Data.SqlClient;

namespace finalyearadmin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();

            // Database connection string
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM admin WHERE Username = @Username AND Password = @Password AND PhoneNumber = @PhoneNumber";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Username", username);
                command.Parameters.AddWithValue("@Password", password);
                command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                try
                {
                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        // Login successful
                        lblMessage.Text = "Login successful! Redirecting...";
                        Response.Write("<script>alert('✅ 🎉Registration Successful! Redirecting to Homepage...'); window.location='adminhome.aspx';</script>");
                    }
                    else
                    {
                        // Login failed
                        lblMessage.Text = "Invalid username, password, or phone number.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}