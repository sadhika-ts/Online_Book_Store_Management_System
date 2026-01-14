using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace finalyearadmin
{
    public partial class AddDiscounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page Load Logic (if any)
        }

        protected void txtp_TextChanged(object sender, EventArgs e)
        {
            CalculateDiscount();
        }

        private void CalculateDiscount()
        {
            // Get the original price and discount percentage from the textboxes
            if (decimal.TryParse(txtop.Text.Trim(), out decimal originalPrice) &&
                decimal.TryParse(txtp.Text.Trim(), out decimal discountPercentage))
            {
                // Calculate the discount amount
              
                decimal discountAmount = originalPrice * (discountPercentage / 100);
                txtda.Text = discountAmount.ToString("0.00"); // Display discount amount

                // Calculate the final price
                decimal finalPrice = originalPrice - discountAmount;
                txtfp.Text = finalPrice.ToString("0.00"); // Display final price
            }
            else
            {
                // Clear the discount and final price if input is invalid
                txtda.Text = string.Empty;
                txtfp.Text = string.Empty;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate file upload
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

                // Save the discount book details to the database
                SaveDiscountBookToDatabase(imageBytes);

                // Success message
                Response.Write("<script>alert('Discount book added successfully!');</script>");
                ClearForm();
            }
            catch (Exception ex)
            {
                ShowAlert("Error: " + ex.Message);
            }
        }

        private void SaveDiscountBookToDatabase( byte[] imageBytes)
        {
            // Database connection string (use your actual connection string)
            string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL query to insert the discount book details
                string query = @"INSERT INTO addbooks 
                                 (bookname, authorname, publishername, bookdescription, originalprice, discountpercentage, discountamount, cost, publishdate, bookphoto, stocks, genre,category)
                                 VALUES 
                                 (@BookName, @AuthorName, @PublisherName, @BookDescription, @OriginalPrice, @DiscountPercentage, @DiscountAmount, @cost, @PublishDate, @BookPhoto, @Stocks, @Genre,@category)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Parameters // Use generated random book ID
                    command.Parameters.AddWithValue("@BookName", txtBookName.Text.Trim());
                    command.Parameters.AddWithValue("@AuthorName", txtAuthorName.Text.Trim());
                    command.Parameters.AddWithValue("@PublisherName", txtPublisherName.Text.Trim());
                    command.Parameters.AddWithValue("@BookDescription", txtBookDescription.Text.Trim());
                    command.Parameters.AddWithValue("@OriginalPrice", decimal.Parse(txtop.Text.Trim()));
                    command.Parameters.AddWithValue("@DiscountPercentage", decimal.Parse(txtp.Text.Trim()));
                    command.Parameters.AddWithValue("@DiscountAmount", decimal.Parse(txtda.Text.Trim()));
                    command.Parameters.AddWithValue("@cost", decimal.Parse(txtfp.Text.Trim()));
                    command.Parameters.AddWithValue("@PublishDate", DateTime.Parse(txtPublishDate.Text.Trim()));
                    command.Parameters.AddWithValue("@BookPhoto", imageBytes);
                    command.Parameters.AddWithValue("@Stocks", int.Parse(txtstocks.Text.Trim()));

                    command.Parameters.AddWithValue("@Genre", ddlGenre.SelectedValue); // Get selected genre
                    command.Parameters.AddWithValue("@category", "discounts");
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
            txtBookDescription.Text = "";
            txtop.Text = "";
            txtp.Text = "";
            txtda.Text = "";
            txtfp.Text = "";
            txtPublishDate.Text = "";
            txtstocks.Text = "";
        }

        protected void txtfp_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnleave_Click(object sender, EventArgs e)
        {

        }

        protected void txtBookDescription_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtfp_TextChanged1(object sender, EventArgs e)
        {

        }
    }
}