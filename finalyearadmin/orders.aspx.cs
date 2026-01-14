using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace finalyearadmin
{
    public partial class orders : System.Web.UI.Page
    {
        private static readonly Dictionary<int, int> clickCounter = new Dictionary<int, int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            string connStr = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";


            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query =  @"
SELECT 
    o.orderid,
    oi.orderitemid,
    oi.bookname,
    oi.quantity,
    o.orderdate AS OrderedDate,
    o.deliverydate AS DeliveryDate,
    o.deliveryaddress AS DeliveryAddress,
    o.orderstatus AS OrderStatus
FROM orderdetails o
INNER JOIN orderitemdetails oi ON o.orderid = oi.orderid
WHERE CONVERT(VARCHAR, o.orderdate, 101) = CONVERT(VARCHAR, GETDATE(), 101);";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptOrders.DataSource = dt;
                rptOrders.DataBind();
                // Display the total number of orders
                lblTotalOrders.Text = dt.Rows.Count.ToString();
            }
        }

        protected string GetOrderStatusClass(string status)
        {
            switch (status)
            {
                case "Processing":
                    return "btn-warning";
                case "Shipped":
                    return "btn-info";
                
                default:
                    return "btn-secondary";
            }
        }
        protected void btnSearchByDate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtOrderDate.Text))
            {
                DateTime selectedDate = Convert.ToDateTime(txtOrderDate.Text);
                FetchOrdersByDate(selectedDate);
            }
        }

        private void FetchOrdersByDate(DateTime date)
        {
            string connStr = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
            SELECT od.orderid, oi.orderitemid, oi.bookname, oi.quantity,
                   od.orderdate AS OrderedDate, od.deliverydate, od.deliveryaddress, od.orderstatus
            FROM orderdetails od
            JOIN orderitemdetails oi ON od.orderid = oi.orderid
            WHERE CONVERT(VARCHAR(10), od.orderdate, 120) = @selectedDate
            ORDER BY od.orderid DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@selectedDate", date.ToString("yyyy-MM-dd"));
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptOrders.DataSource = dt;
                    rptOrders.DataBind();

                    lblTotalOrders.Text = dt.Rows.Count.ToString();
                }
            }
        }


        protected void btnStatus_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            int orderId = Convert.ToInt32(button.CommandArgument);

            // Increment click count for the order
            if (!clickCounter.ContainsKey(orderId))
            {
                clickCounter[orderId] = 0;
            }
            clickCounter[orderId]++;

            // Change status to "Shipped" if clicked twice
            if (clickCounter[orderId] == 2)
            {
                UpdateOrderStatus(orderId, "Shipped");
                clickCounter[orderId] = 0; // Reset the counter after updating
            }
           
            // Reload orders to reflect changes
            LoadOrders();
        }

        private void UpdateOrderStatus(int orderId, string newStatus)
        {
            string connStr = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";


            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE orderdetails SET orderstatus = @OrderStatus WHERE orderid = @OrderID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@OrderStatus", newStatus);
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminhome.aspx");
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadOrders();
        }
    }
}