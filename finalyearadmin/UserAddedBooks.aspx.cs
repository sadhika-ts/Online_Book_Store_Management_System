using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalyearadmin
{
    public partial class UserAddedBooks : System.Web.UI.Page
    {
        // Database connection string
        private string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the book IDs and book names in the dropdowns
                PopulateBookDropdowns();
            }
        }

        // Populate the book ID and book name dropdowns
        private void PopulateBookDropdowns()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT bookid, bookname FROM addbooks where  category = 'useradded'";
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ddlBookId.Items.Clear();
                ddlBookName.Items.Clear();

                ddlBookId.Items.Add(new ListItem("Select a Book ID", ""));
                ddlBookName.Items.Add(new ListItem("Select a Book Name", ""));

                while (reader.Read())
                {
                    int bookId = reader.GetInt32(0);
                    string bookName = reader.GetString(1);

                    ddlBookId.Items.Add(new ListItem(bookId.ToString(), bookId.ToString()));
                    ddlBookName.Items.Add(new ListItem(bookName, bookId.ToString()));
                }
            }
        }

        // Fetch and display the book details when a book ID is selected
        protected void ddlBookId_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBookId.SelectedIndex > 0)
            {
                int bookId = int.Parse(ddlBookId.SelectedValue);
                FetchBookDetails(bookId);

                // Synchronize the book name dropdown
                ddlBookName.SelectedValue = bookId.ToString();
            }
            else
            {
                ClearForm();
            }
        }

        // Fetch and display the book details when a book name is selected
        protected void ddlBookName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBookName.SelectedIndex > 0)
            {
                int bookId = int.Parse(ddlBookName.SelectedValue);
                FetchBookDetails(bookId);

                // Synchronize the book ID dropdown
                ddlBookId.SelectedValue = bookId.ToString();
            }
            else
            {
                ClearForm();
            }
        }

        // Clear the form when no book is selected
        private void ClearForm()
        {
            txtBookId.Text = "";
            txtBookName.Text = "";
            txtAuthorName.Text = "";
            txtPublisherName.Text = "";
            txtBookDescription.Text = ""; // Clear the book description field
            txtCost.Text = "";
            txtPublishDate.Text = "";
            imgBookPhoto.ImageUrl = "";
        }

        // Fetch book details from the database
        private void FetchBookDetails(int bookId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Updated query to include bookdescription
                string query = @"SELECT bookid, bookname, authorname, publishername, bookdescription, cost, publishdate, bookphoto 
                                 FROM addbooks 
                                 WHERE bookid = @BookID";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@BookID", bookId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    txtBookId.Text = reader["bookid"].ToString();
                    txtBookName.Text = reader["bookname"].ToString();
                    txtAuthorName.Text = reader["authorname"].ToString();
                    txtPublisherName.Text = reader["publishername"].ToString();
                    txtBookDescription.Text = reader["bookdescription"].ToString(); // Fetch book description
                    txtCost.Text = reader["cost"].ToString();
                    txtPublishDate.Text = Convert.ToDateTime(reader["publishdate"]).ToString("yyyy-MM-dd");

                    byte[] imageBytes = (byte[])reader["bookphoto"];
                    if (imageBytes != null && imageBytes.Length > 0)
                    {
                        imgBookPhoto.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(imageBytes);
                    }
                    else
                    {
                        imgBookPhoto.ImageUrl = "~/images/noimage.jpg"; // default image if no photo is available
                    }
                }
                else
                {
                    ShowAlert("No book found with the selected ID.");
                }
            }
        }

        // Show alert message
        private void ShowAlert(string message)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }

        // Button click to fetch details (can be removed since auto postback is enabled on dropdown)
        protected void btnFetchDetails_Click(object sender, EventArgs e)
        {
            if (ddlBookId.SelectedIndex > 0)
            {
                int bookId = int.Parse(ddlBookId.SelectedValue);
                FetchBookDetails(bookId);
            }
            else
            {
                ShowAlert("Please select a book ID.");
            }
        }

        protected void btnleave_Click(object sender, EventArgs e)
        {
            // Redirect to Book Details Page
            Response.Redirect("BookDetails.aspx");
        }
    }
}