using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace finalyearproject
{
    public partial class NewPublished : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page Load Logic (if any)
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (!fileBookPhoto.HasFile)
                {
                    ShowAlert("Please upload a photo of the book.");
                    return;
                }


                // Get the image as a byte array
                byte[] imageBytes = null;
                using (var binaryReader = new BinaryReader(fileBookPhoto.PostedFile.InputStream))
                {
                    imageBytes = binaryReader.ReadBytes(fileBookPhoto.PostedFile.ContentLength);
                }

                // Save the book and the image to the database
                SaveBookToDatabase(imageBytes);

                // Success message
                Response.Write("<script>alert('Book added successfully!'); </script>");
                ClearForm();
            }
            catch (Exception ex)
            {
                ShowAlert("Error: " + ex.Message);
            }
        }

        private void SaveBookToDatabase(byte[] imageBytes)
        {
            // Database connection string (use your actual connection string)
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"INSERT INTO addbooks 
                                 ( bookname, authorname, publishername, bookdescription, cost, publishdate, bookphoto, stocks, genre, category)
                                 VALUES 
                                 ( @BookName, @AuthorName, @PublisherName, @BookDescription, @Cost, @PublishDate, @BookPhoto, @stocks, @Genre, @category)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@BookName", txtBookName.Text.Trim());
                    command.Parameters.AddWithValue("@AuthorName", txtAuthorName.Text.Trim());
                    command.Parameters.AddWithValue("@PublisherName", txtPublisherName.Text.Trim());
                    command.Parameters.AddWithValue("@BookDescription", txtBookDescription.Text.Trim()); // New parameter
                    command.Parameters.AddWithValue("@Cost", decimal.Parse(txtCost.Text.Trim()));
                    command.Parameters.AddWithValue("@PublishDate", DateTime.Parse(txtPublishDate.Text.Trim()));
                    command.Parameters.AddWithValue("@BookPhoto", imageBytes); // Store the image as binary data
                    command.Parameters.AddWithValue("@stocks", int.Parse(txtstocks.Text.Trim()));
                    command.Parameters.AddWithValue("@Genre", ddlGenre.SelectedValue); // Get selected genre
                    command.Parameters.AddWithValue("@category", "useradded");
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void ShowAlert(string message)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }

        private void ClearForm()
        {
            txtBookName.Text = "";
            txtAuthorName.Text = "";
            txtPublisherName.Text = "";
            txtBookDescription.Text = ""; // Clear the book description field
            txtCost.Text = "";
            txtPublishDate.Text = "";
            txtstocks.Text = "";
        }


    }
}