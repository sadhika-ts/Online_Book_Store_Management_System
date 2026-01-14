using System;
using System.Data;
using System.Data.SqlClient;

namespace finalyearadmin
{
    public partial class DeliveryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblDate.Text = DateTime.Now.ToString("dd MMM yyyy");
                LoadOutForDeliveryOrders();
                LoadDeliveredOrders();
            }
        }

        private void LoadOutForDeliveryOrders()
        {
            string connStr = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Update all today's "Shipped" orders to "Out for Delivery"
                string updateQuery = @"
                    UPDATE orderdetails
                    SET orderstatus = 'Out of Delivery'
                    WHERE CONVERT(VARCHAR(10), deliverydate, 120) = CONVERT(VARCHAR(10), GETDATE(), 120)
                      AND orderstatus = 'Shipped'";

                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                {
                    updateCmd.ExecuteNonQuery();
                }

                // Fetch orders with status = 'Out for Delivery'
                string fetchQuery = @"
                    SELECT od.orderid, oi.orderitemid, oi.bookname, oi.quantity,
                           od.orderdate, od.deliverydate, od.deliveryaddress, od.orderstatus
                    FROM orderdetails od
                    JOIN orderitemdetails oi ON od.orderid = oi.orderid
                    WHERE od.orderstatus = 'Out of Delivery'
                      AND CONVERT(VARCHAR(10), od.deliverydate, 120) = CONVERT(VARCHAR(10), GETDATE(), 120)
                    ORDER BY od.orderid DESC";

                using (SqlCommand cmd = new SqlCommand(fetchQuery, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptDelivery.DataSource = dt;
                    rptDelivery.DataBind();
                }
            }
        }

        private void LoadDeliveredOrders()
        {
            string connStr = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Fetch orders with status = 'Delivered'
                string fetchQuery = @"
                    SELECT od.orderid, oi.orderitemid, oi.bookname, oi.quantity,
                           od.orderdate, od.deliverydate, od.deliveryaddress, od.orderstatus
                    FROM orderdetails od
                    JOIN orderitemdetails oi ON od.orderid = oi.orderid
                    WHERE od.orderstatus = 'Delivered'
                    ORDER BY od.orderid DESC";

                using (SqlCommand cmd = new SqlCommand(fetchQuery, conn))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    rptDelivered.DataSource = dt;
                    rptDelivered.DataBind();
                }
            }
        }

        protected string GetStatusClass(string status)
        {
            switch (status.ToLower())
            {
                case "delivered":
                    return "btn btn-success btn-sm";
                case "shipped":
                    return "btn btn-info btn-sm";
                case "processing":
                    return "btn btn-warning btn-sm";
                case "out of delivery":
                    return "badge bg-danger";
                default:
                    return "badge bg-secondary";
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminhome.aspx");
        }
    }
}