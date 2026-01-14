using System;
using System.Data;
using System.Data.SqlClient;

namespace finalyearadmin
{
    public partial class Stocks : System.Web.UI.Page
    {
        // Database connection string
        string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear the GridView on initial load
                gvBooks.DataSource = null;
                gvBooks.DataBind();
            }
        }

        protected void btnFetch_Click(object sender, EventArgs e)
        {
            string query = "";

            // Determine which radio button is selected
            if (rbDiscounts.Checked)
            {
                query = "SELECT bookid, bookname, cost, stocks FROM addbooks where  category = 'discounts'"; // Fetch from Discounts table
            }
            else if (rbNewArrivals.Checked)
            {
                query = "SELECT bookid, bookname, cost, stocks FROM addbooks where  category = 'newarrivals'"; // Fetch from NewArrivals table
            }
            else if (rbNormalBooks.Checked)
            {
                query = "SELECT bookid, bookname, cost, stocks FROM addbooks where  category = 'normalbook'"; // Fetch from Books table
            }

            if (!string.IsNullOrEmpty(query))
            {
                // Fetch data from the database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    // Bind data to the GridView
                    gvBooks.DataSource = dt;
                    gvBooks.DataBind();
                }
            }
            else
            {
                // Show error message if no option is selected
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select an option.');", true);
            }
        }




        protected void txtBookID_TextChanged(object sender, EventArgs e)
        {
            // Fetch and display book name and current stocks for the entered BookID
            string query = "";

            if (rbDiscounts.Checked)
            {
                query = "SELECT bookname, stocks FROM addbooks WHERE bookid = @BookID  and  category = 'discounts'";
            }
            else if (rbNewArrivals.Checked)
            {
                query = "SELECT bookname, stocks FROM addbooks WHERE bookid = @BookID  and  category = 'newarrivals'";
            }
            else if (rbNormalBooks.Checked)
            {
                query = "SELECT bookname, stocks FROM addbooks WHERE bookid = @BookID  and  category = 'normalbook'";
            }

            if (!string.IsNullOrEmpty(query))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@BookID", txtBookID.Text);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        txtBookName.Text = reader["bookname"].ToString();
                        txtCurrentStocks.Text = reader["stocks"].ToString();
                    }
                    else
                    {
                        // Clear fields if BookID is not found
                        txtBookName.Text = "";
                        txtCurrentStocks.Text = "";
                        txtTotalStocks.Text = "";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Book ID not found.');", true);
                    }
                    reader.Close();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // Validate BookID
            if (string.IsNullOrEmpty(txtBookID.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid Book ID.');", true);
                return;
            }

            // Validate NewStocks
            if (!int.TryParse(txtNewStocks.Text, out int newStocks) || newStocks < 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid non-negative number for New Stocks.');", true);
                return;
            }

            // Validate CurrentStocks
            if (!int.TryParse(txtCurrentStocks.Text, out int currentStocks) || currentStocks < 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Current Stocks value is invalid.');", true);
                return;
            }

            // Calculate TotalStocks
            int totalStocks = currentStocks + newStocks;

            string query = "";

            // Determine which radio button is selected
            if (rbDiscounts.Checked)
            {
                query = "UPDATE addbooks SET stocks = @TotalStocks WHERE bookid = @BookID and  category = 'discounts'";
            }
            else if (rbNewArrivals.Checked)
            {
                query = "UPDATE addbooks SET stocks = @TotalStocks WHERE bookid = @BookID and  category = 'newarrivals'";
            }
            else if (rbNormalBooks.Checked)
            {
                query = "UPDATE addbooks SET stocks = @TotalStocks WHERE bookid = @BookID and  category = 'normalbook'";
            }

            if (!string.IsNullOrEmpty(query))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@TotalStocks", totalStocks); // Use the calculated total stocks
                    command.Parameters.AddWithValue("@BookID", txtBookID.Text);
                    connection.Open();
                    command.ExecuteNonQuery();
                }

                // Show success message
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Stocks updated successfully!');", true);

                // Clear fields after update
                txtBookID.Text = "";
                txtBookName.Text = "";
                txtCurrentStocks.Text = "";
                txtNewStocks.Text = "";
                txtTotalStocks.Text = "";
            }
        }

        protected void txtTotalStocks_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnleave_Click(object sender, EventArgs e)
        {
            // Redirect to Book Details Page
            Response.Redirect("BookDetails.aspx");
        }
    }
}