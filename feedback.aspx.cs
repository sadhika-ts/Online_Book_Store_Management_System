using System;
using System.Data.SqlClient;

namespace finalyearproject
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["UserId"] == null)
            {
                // Redirect to login page if user is not logged in
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                LoadBookNames();
            }
        }

        private void LoadBookNames()
        {
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT bookname FROM addbooks";
                SqlCommand cmd = new SqlCommand(query, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                ddlBookName.Items.Clear(); // Clear existing items
                ddlBookName.Items.Add(new System.Web.UI.WebControls.ListItem("--Select a Book--", "")); // Default option

                while (reader.Read())
                {
                    string bookName = reader["bookname"].ToString();
                    ddlBookName.Items.Add(new System.Web.UI.WebControls.ListItem(bookName, bookName));
                }

                conn.Close();
            }
        }

        protected void SubmitFeedback_Click(object sender, EventArgs e)
        {
            string bookName = ddlBookName.SelectedValue; // Get selected book name
            string comments = txtComments.Text.Trim();
            int rating = 0;

            // Get the selected rating from radio buttons
            if (Request.Form["rating"] != null)
            {
                rating = int.Parse(Request.Form["rating"]);
            }

            if (!string.IsNullOrEmpty(bookName) && rating > 0)
            {
                // Get user ID from session
                int userId = Convert.ToInt32(Session["UserId"]);

                // Validate if user exists in logintable
                if (!IsUserValid(userId))
                {
                    Response.Write("Invalid User. Please log in again.");
                    Response.Redirect("login.aspx");
                    return;
                }

                // Get Book ID based on Book Name
                int bookId = GetBookId(bookName);

                if (bookId > 0)
                {
                    // Insert feedback into the database
                    string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO feedback (userid, bookid, rating, comments, feedbackdate) " +
                                       "VALUES (@UserId, @BookId, @Rating, @Comments, GETDATE())";

                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@BookId", bookId);
                        cmd.Parameters.AddWithValue("@Rating", rating);
                        cmd.Parameters.AddWithValue("@Comments", comments);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();

                        // Show success alert and redirect to homepage
                        string script = "alert('Feedback given successfully!'); window.location='homepage.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "FeedbackSuccess", script, true);
                    }
                }
                else
                {
                    Response.Write("Invalid Book Name!");
                }
            }
            else
            {
                Response.Write("Please fill in all fields!");
            }
        }

        private int GetBookId(string bookName)
        {
            int bookId = 0;
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT bookid FROM addbooks WHERE bookname = @BookName";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@BookName", bookName);

                conn.Open();
                object result = cmd.ExecuteScalar();
                conn.Close();

                if (result != null)
                {
                    bookId = Convert.ToInt32(result);
                }
            }
            return bookId;
        }

        private bool IsUserValid(int userId)
        {
            bool isValid = false;
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM logintable WHERE userid = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                int count = (int)cmd.ExecuteScalar();
                conn.Close();

                if (count > 0)
                {
                    isValid = true;
                }
            }
            return isValid;
        }

        protected void txtComments_TextChanged(object sender, EventArgs e)
        {
        }
    }
}