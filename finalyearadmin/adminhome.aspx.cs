

using System;
using System.Data.SqlClient;

namespace finalyearadmin
{
    public partial class adminhome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialization code (if needed)
        }

        protected void btnUserDetails_Click(object sender, EventArgs e)
        {
            // Redirect to User Details Page
            Response.Redirect("UserDetails.aspx");
        }

        protected void btnBookDetails_Click(object sender, EventArgs e)
        {
            // Redirect to Book Details Page
            Response.Redirect("BookDetails.aspx");
        }

        protected void btnDeliveryDetails_Click(object sender, EventArgs e)
        {
            // Redirect to Delivery Details Page
            Response.Redirect("DeliveryDetails.aspx");
        }

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            // Redirect to Orders Page
            Response.Redirect("orders.aspx");
        }

        protected void btnPayments_Click(object sender, EventArgs e)
        {
            // Redirect to Payments Page
            Response.Redirect("paymentdetails.aspx");
        }

        protected void btnReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("report.aspx");
        }
    }
}