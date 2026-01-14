using System;
using System.Data.SqlClient;
using System.Web.Security; // For password hashing

namespace finalyearproject
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            
                string email = txtEmail.Text.Trim();
                string password = TextBox2.Text.Trim();

                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter both email and password');", true);
                    return;
                }

                string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();

                        // Query both userid and password for the given email
                        string query = "SELECT userid, password FROM logintable WHERE email = @email COLLATE SQL_Latin1_General_CP1_CS_AS";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@email", email);

                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    string storedPassword = reader["password"].ToString();
                                    int userId = Convert.ToInt32(reader["userid"]);

                                    if (password == storedPassword)
                                    {
                                        // ✅ Store userid in session instead of email
                                        Session["UserID"] = userId;

                                        // Redirect to homepage
                                        Response.Redirect("homepage.aspx");
                                    }
                                    else
                                    {
                                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid password');", true);
                                    }
                                }
                                else
                                {
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email not found');", true);
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message.Replace("'", "\\'")}');", true);
                    }
                }
            

        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}