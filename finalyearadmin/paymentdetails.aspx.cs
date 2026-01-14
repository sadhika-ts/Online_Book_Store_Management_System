
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace finalyearadmin
{
    public partial class paymentdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPaymentDetails();
            }
        }

        private void LoadPaymentDetails()
        {
            string connStr = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT od.orderid, lt.username, od.orderdate, od.paymentstatus, od.totalamount
                    FROM orderdetails od
                    JOIN logintable lt ON od.userid = lt.userid
                    WHERE od.paymentstatus = 'Paid'
                    ORDER BY od.orderdate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPayments.DataSource = dt;
                gvPayments.DataBind();

                // Calculate grand total
                decimal grandTotal = 0;
                foreach (DataRow row in dt.Rows)
                {
                    grandTotal += Convert.ToDecimal(row["totalamount"]);
                }

                lblGrandTotal.Text = grandTotal.ToString("F2");
                lblGrandTotalBottom.Text = grandTotal.ToString("F2");
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {

            LoadPaymentDetails();
        }

    }
}
