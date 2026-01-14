using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalyearadmin
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddNewArrivals_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddNewArrivals.aspx");
        }

        protected void btnAddDiscounts_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDiscounts.aspx");
        }

        protected void btnUserAddedBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserAddedBooks.aspx");
        }

        protected void btnStocks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stocks.aspx");
        }

        protected void btnAddBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBooks.aspx");
        }

        protected void btnRemoveBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveBooks.aspx");
        }

        protected void btnleave_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminhome.aspx");
        }
    }
}