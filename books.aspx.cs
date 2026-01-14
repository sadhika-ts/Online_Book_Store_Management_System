using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalyearproject
{
    public partial class books : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBooks();
            }
        }

        private void BindBooks(string searchQuery = "")
        {
            // Database connection string
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            // Base query to fetch book details
            string query = "SELECT bookid, bookname, authorname, publishername, bookdescription, cost, publishdate, bookphoto, stocks " +
                           "FROM addbooks WHERE category = 'normalbook'";

            // Add a WHERE clause for search functionality if a search query is provided
            if (!string.IsNullOrWhiteSpace(searchQuery))
            {
                query += " AND bookname LIKE @SearchQuery";
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (!string.IsNullOrWhiteSpace(searchQuery))
                    {
                        command.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                    }

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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Get the search query from the search box
            string searchQuery = txtSearch.Text.Trim();

            // Reload books based on the search query
            BindBooks(searchQuery);
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            // Get the search query from the search box
            string searchQuery = txtSearch.Text.Trim();

            // Reload books based on the search query
            BindBooks(searchQuery);
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            // Get the selected genre from the dropdown
            string selectedGenre = ddlGenre.SelectedValue;

            // Call BindBooks with the selected genre as a filter
            FilterBooks(selectedGenre);
        }

        private void FilterBooks(string genre)
        {
            // Database connection string
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            // Base query to fetch book details
            string query = "SELECT bookid, bookname, authorname, publishername, bookdescription, cost, publishdate, bookphoto, stocks FROM addbooks WHERE category = 'normalbook'";

            // Add a WHERE clause if a genre is selected
            if (!string.IsNullOrWhiteSpace(genre))
            {
                query += " AND genre = @Genre";
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (!string.IsNullOrWhiteSpace(genre))
                    {
                        command.Parameters.AddWithValue("@Genre", genre);
                    }

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Bind data to the Repeater control
                    rptBooks.DataSource = reader;
                    rptBooks.DataBind();

                    reader.Close();
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