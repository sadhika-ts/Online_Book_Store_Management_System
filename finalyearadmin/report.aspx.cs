using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace finalyearadmin
{
    public partial class report : System.Web.UI.Page
    {
        string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
        // Field to store total profit
        private decimal totalProfit = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfitLossTable();
                LoadCategoryProfitChart();
                LoadTopBooks();
            }
        }

      

        private void LoadTopBooks()
        {
            DataTable dt = GetTopBooksData();
            rptTopBooks.DataSource = dt;
            rptTopBooks.DataBind();
        }

        private void LoadCategoryProfitChart()
        {
            StringBuilder categoryData = new StringBuilder();
            StringBuilder categoryLabels = new StringBuilder();
            StringBuilder categoryColors = new StringBuilder();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                B.category AS 'Category',
                SUM(CASE 
                    WHEN B.category = 'discounts' THEN 100 * OI.quantity
                    WHEN B.category IN ('newarrivals', 'normalbook') THEN 200 * OI.quantity
                    ELSE 0 
                END) AS 'Profit'
            FROM orderitemdetails OI
            JOIN addbooks B ON OI.bookid = B.bookid
            WHERE B.category != 'useradded'
            GROUP BY B.category;";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string category = reader["Category"].ToString();
                    decimal profit = Convert.ToDecimal(reader["Profit"]);

                    // Append category and profit data
                    categoryLabels.Append($"'{category}',");
                    categoryData.Append($"{profit},");
                    categoryColors.Append($"'{GetCategoryColor(category)}',");
                }
                con.Close();
            }

            // Render JavaScript for the chart
            litCategoryProfitChart.Text = $@"
        <script>
            const ctxCategory = document.getElementById('categoryProfitChart').getContext('2d');
            new Chart(ctxCategory, {{
                type: 'pie',
                data: {{
                    labels: [{categoryLabels.ToString().TrimEnd(',')}],
                    datasets: [{{
                        data: [{categoryData.ToString().TrimEnd(',')}],
                        backgroundColor: [{categoryColors.ToString().TrimEnd(',')}],
                        borderColor: '#ffffff',
                        borderWidth: 2,
                        hoverOffset: 20
                    }}]
                }},
                options: {{
                    plugins: {{
                        legend: {{
                            position: 'bottom',
                            labels: {{
                                font: {{
                                    size: 14
                                }},
                                padding: 20
                            }}
                        }},
                        tooltip: {{
                            bodyFont: {{
                                size: 16
                            }}
                        }}
                    }}
                }}
            }});
        </script>";
        }

        private string GetCategoryColor(string category)
        {
            switch (category.ToLower())
            {
                case "discounts":
                    return "#FF6B6B"; // Red color for discounts
                case "newarrivals":
                    return "#4ECDC4"; // Teal color for new arrivals
                case "normalbook":
                    return "#3498DB"; // Blue color for normal books
                default:
                    return "#95A5A6"; // Gray for any unexpected categories
            }
        }

        private DataTable GetProfitLossData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT 
                B.bookid AS 'Book ID', 
                B.bookname AS 'Book Name', 
                B.category AS 'Category', 
                OI.quantity AS 'Quantity',
                -- Assign Profit Per Unit based on the category
                CASE 
                    WHEN B.category = 'discounts' THEN 100
                    WHEN B.category IN ('newarrivals', 'normalbook') THEN 200
                    ELSE 0 -- Default value if category doesn't match
                END AS 'Profit Per Unit',
                -- Calculate Profit as Profit Per Unit * Quantity
                (CASE 
                    WHEN B.category = 'discounts' THEN 100
                    WHEN B.category IN ('newarrivals', 'normalbook') THEN 200
                    ELSE 0
                END * OI.quantity) AS 'Profit'
            FROM orderitemdetails OI
            JOIN addbooks B ON OI.bookid = B.bookid
            WHERE B.category != 'useradded';";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);
            }
            return dt;
        }

        private DataTable GetTopBooksData()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 10 B.bookid, B.bookname, SUM(OI.quantity) AS TotalSold " +
                               "FROM orderitemdetails OI JOIN addbooks B ON OI.bookid = B.bookid " +
                               "GROUP BY B.bookid, B.bookname ORDER BY TotalSold DESC;";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(dt);
            }
            return dt;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminhome.aspx");
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
        private void LoadProfitLossTable()
        {
            DataTable dt = GetProfitLossData();
            rptProfitLossTable.DataSource = dt;
            rptProfitLossTable.DataBind();

            // Calculate total profit
            totalProfit = 0;
            foreach (DataRow row in dt.Rows)
            {
                if (decimal.TryParse(row["Profit"].ToString(), out decimal profit))
                {
                    totalProfit += profit;
                }
            }

            // Store total profit in ViewState to use it in the FooterTemplate
            ViewState["TotalProfit"] = totalProfit;
        }
     
       
        protected void rptProfitLossTable_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Assuming your data has a "Profit" field
                decimal profit = Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "Profit"));
                totalProfit += profit;
            }
            else if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lblTotal = (Label)e.Item.FindControl("lblTotalProfit");
                lblTotal.Text = totalProfit.ToString("F2");
            }
        }

    }
}