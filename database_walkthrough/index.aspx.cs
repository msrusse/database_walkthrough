using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace database_walkthrough
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<User> users = GetUsers();
            if (!IsPostBack)
            {
                repUsers.DataSource = users;
                repUsers.DataBind();
            }

        }

        private List<User> GetUsers()
        {
            List<User> users = new List<User>();
            SqlConnection getUsersConn = new SqlConnection(walkthroughConnection.ConnectionString);
            string query = "SELECT * FROM table1";
            SqlCommand getUsersCom = new SqlCommand(query, getUsersConn);
            getUsersConn.Open();
            SqlDataReader getUsersDataReader = getUsersCom.ExecuteReader();

            if (getUsersDataReader.HasRows)
            {
                while (getUsersDataReader.Read())
                {
                    users.Add(new database_walkthrough.User
                    {
                        username = getUsersDataReader["username"]?.ToString(),
                        firstName = getUsersDataReader["firstName"]?.ToString(),
                        lastName = getUsersDataReader["lastName"]?.ToString(),
                        email = getUsersDataReader["email"]?.ToString()
                    });
                }
            }
            getUsersConn.Close();
            return users;
        }
    }
}