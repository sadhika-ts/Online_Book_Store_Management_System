

using System;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;
using System.Web.UI;

namespace finalyearproject
{
    public partial class signup : System.Web.UI.Page
    {
        // 🔧 Database Connection String
        string connString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e) { }

        // 📌 User Registration
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string address = txtAddress.Text.Trim();

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "INSERT INTO logintable (username, password, email, phonenumber, address) " +
                                   "VALUES (@username, @password, @email, @phone, @address); " +
                                   "SELECT SCOPE_IDENTITY();";

                    try
                    {
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@username", username);
                            cmd.Parameters.AddWithValue("@password", password);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@phone", phone);
                            cmd.Parameters.AddWithValue("@address", address);

                            object insertedId = cmd.ExecuteScalar();
                            if (insertedId != null)
                            {
                                int userid = Convert.ToInt32(insertedId);
                                Session["UserID"] = userid;
                                Response.Write("<script>alert('✅ 🎉Registration Successful! Redirecting to Homepage...'); window.location='homepage.aspx';</script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('❌ Registration Failed. Try Again.');</script>");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>alert('❌ Error: {ex.Message}');</script>");
                    }
                }
            

        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAddress_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAddress_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}