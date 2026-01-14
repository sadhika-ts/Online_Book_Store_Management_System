using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace finalyearadmin
{
    public partial class UserDetails : System.Web.UI.Page
    {
        string connString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserDetails();
            }
        }

        private void BindUserDetails()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT userid, username, password, email, phonenumber, address FROM logintable";

                try
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvUserDetails.DataSource = dt;
                    gvUserDetails.DataKeyNames = new string[] { "userid" }; // ✅ Use userid as DataKey
                    gvUserDetails.DataBind();
                }
                catch (Exception ex)
                {
                    ShowError($"Error loading user data: {ex.Message}");
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearch.Text.Trim();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT userid, username, password, email, phonenumber, address FROM logintable " +
                               "WHERE username LIKE @search OR email LIKE @search";

                try
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    da.SelectCommand.Parameters.AddWithValue("@search", $"%{searchTerm}%");
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvUserDetails.DataSource = dt;
                    gvUserDetails.DataKeyNames = new string[] { "userid" }; // ✅ Ensure DataKey is set
                    gvUserDetails.DataBind();
                }
                catch (Exception ex)
                {
                    ShowError($"Error searching users: {ex.Message}");
                }
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";
            BindUserDetails();
        }

        protected void gvUserDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteUser")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int userid = Convert.ToInt32(gvUserDetails.DataKeys[rowIndex].Value);
                DeleteUser(userid);
            }

        }

        private void DeleteUser(int userid)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "DELETE FROM logintable WHERE userid = @userid";

                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ShowSuccess($"User ID '{userid}' deleted successfully");
                        BindUserDetails();
                    }
                    else
                    {
                        ShowError("User not found or could not be deleted");
                    }
                }
                catch (Exception ex)
                {
                    ShowError($"Error deleting user: {ex.Message}");
                }
            }
        }

        protected void gvUserDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUserDetails.PageIndex = e.NewPageIndex;
            BindUserDetails();
        }

        private void ShowError(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showError",
                $"alert('{message.Replace("'", "\\'")}');", true);
        }

        private void ShowSuccess(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showSuccess",
                $"alert('{message.Replace("'", "\\'")}');", true);
        }
    }
}
