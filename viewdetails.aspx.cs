using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

namespace finalyearproject
{
    public partial class viewdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Request.QueryString["bookid"] != null)
                    {
                        int bookId = Convert.ToInt32(Request.QueryString["bookid"]);
                        LoadBookDetails(bookId);
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception (log it or show a message)
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        private void LoadBookDetails(int bookId)
        {
            string connectionString = "Data Source=SURUTHISADHIKA; Initial Catalog=bookstore; Integrated Security=True; TrustServerCertificate=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"SELECT bookname, authorname, publishername, bookdescription, cost, publishdate, bookphoto, stocks 
                                 FROM addbooks WHERE bookid = @BookID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.Add("@BookID", System.Data.SqlDbType.Int).Value = bookId;

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblBookName.Text = reader["bookname"].ToString();
                        lblAuthorName.Text = reader["authorname"].ToString();
                        lblPublisherName.Text = reader["publishername"].ToString();
                        lblDescription.Text = reader["bookdescription"].ToString();
                        lblPrice.Text = "$" + Convert.ToDecimal(reader["cost"]).ToString("0.00");
                        lblPublishDate.Text = Convert.ToDateTime(reader["publishdate"]).ToString("MMM dd, yyyy");
                        lblStocks.Text = reader["stocks"].ToString();

                        // Convert varbinary to Base64 for displaying the image
                        if (reader["bookphoto"] != DBNull.Value)
                        {
                            byte[] imgBytes = (byte[])reader["bookphoto"];
                            string base64String = Convert.ToBase64String(imgBytes);
                            imgBook.ImageUrl = "data:image/png;base64," + base64String;
                        }
                        else
                        {
                            imgBook.ImageUrl = "~/images/no-image.png"; // Fallback image
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Book not found.";
                    }
                }
            }
        }
      

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("homepage.aspx");
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["bookid"] != null)
            {
                int bookId = Convert.ToInt32(Request.QueryString["bookid"]);
                LoadBookDetails(bookId);
            }
            else
            {
                lblMessage.Text = "Book ID is missing in the query string.";
            }
        }

    }
}
