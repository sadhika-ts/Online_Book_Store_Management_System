using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalyearproject
{
    public partial class discount : Page
    {
        protected void page_load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBooks();
            }
        }

        private void BindBooks()
        {
            // Database connection string
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            // Query to fetch book details
            string query = "SELECT bookid, bookname, authorname, publishername, bookdescription, originalprice,discountpercentage,discountamount,cost, publishdate, bookphoto, stocks FROM addbooks where  category = 'discounts'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Bind data to the Repeater control
                    rptBooks.DataSource = reader;
                    rptBooks.DataBind();

                    reader.Close();
                }
            }
        }

        protected void rptBooks_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            

                if (e.CommandName == "AddToCart")
                {
                    int bookID = Convert.ToInt32(e.CommandArgument);

                    // Get UserID from session
                    if (Session["userid"] != null)
                    {
                        int userID = Convert.ToInt32(Session["userid"]);

                        string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
                        string bookName = "";

                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            // First, fetch the book name using bookID
                            string fetchBookQuery = "SELECT bookname FROM addbooks WHERE bookid = @BookID";
                            using (SqlCommand fetchCmd = new SqlCommand(fetchBookQuery, conn))
                            {
                                fetchCmd.Parameters.AddWithValue("@BookID", bookID);
                                conn.Open();
                                object result = fetchCmd.ExecuteScalar();
                                conn.Close();

                                if (result != null)
                                {
                                    bookName = result.ToString();
                                }
                            }

                            // Now insert into cart
                            if (!string.IsNullOrEmpty(bookName))
                            {
                                string insertQuery = "INSERT INTO cart (userid, bookid, bookname) VALUES (@UserID, @BookID, @BookName)";
                                using (SqlCommand insertCmd = new SqlCommand(insertQuery, conn))
                                {
                                    insertCmd.Parameters.AddWithValue("@UserID", userID);
                                    insertCmd.Parameters.AddWithValue("@BookID", bookID);
                                    insertCmd.Parameters.AddWithValue("@BookName", bookName);

                                    conn.Open();
                                    insertCmd.ExecuteNonQuery();
                                    conn.Close();
                                }

                                // Redirect to Cart page
                                Response.Redirect("Cart.aspx");
                            }
                            else
                            {
                                // Book not found
                                Response.Write("<script>alert('Book not found.');</script>");
                            }
                        }
                    }
                    else
                    {
                        // If user is not logged in, redirect to login
                        Response.Redirect("login.aspx");
                    }
                }





        }

        protected void lnkAppratings_Click(object sender, EventArgs e)
        {
            Response.Redirect("ratings.aspx");
        }

        protected void lnknewPublisher_Click(object sender, EventArgs e)
        {
            Response.Redirect("new_publisher.aspx");
        }

        protected void lnkaccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("account.aspx");
        }

        protected void lnksettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("settings.aspx");
        }


    }
}
