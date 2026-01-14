using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalyearproject
{
    public partial class Checkout : System.Web.UI.Page
    {
        string connString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            if (Session["userid"] != null)
            {
                int userId = Convert.ToInt32(Session["userid"]);

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
                                TextBox1.Text = reader["username"].ToString();
                                TextBox2.Text = reader["email"].ToString();
                                TextBox3.Text = reader["phonenumber"].ToString();
                                TextBox4.Text = reader["address"].ToString();

                                Session["username"] = TextBox1.Text;
                                Session["address"] = TextBox4.Text;
                            }
                            reader.Close();
                        }
                    }
                    catch (Exception)
                    {
                        Response.Write("<script>alert('❌ Error: you have not registered yet........');</script>");
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Ensure address is updated in session
            Session["address"] = TextBox4.Text;
            Response.Redirect("payment.aspx");
        }
        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}
