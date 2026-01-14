using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace finalyearproject
{
    public class GetBookImage : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            int bookId;
            if (int.TryParse(context.Request.QueryString["bookid"], out bookId))
            {
                string connectionString = "Data Source=SURUTHISADHIKA;Initial Catalog=bookstore;Integrated Security=True;TrustServerCertificate=True";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT BookPhoto FROM Books WHERE BookID = @BookID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@BookID", bookId);
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SequentialAccess))
                        {
                            if (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    byte[] imageData = (byte[])reader["BookPhoto"];
                                    context.Response.ContentType = "image/jpeg";
                                    context.Response.BinaryWrite(imageData);
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                context.Response.StatusCode = 404;
            }
        }

        public bool IsReusable => false;
    }
}