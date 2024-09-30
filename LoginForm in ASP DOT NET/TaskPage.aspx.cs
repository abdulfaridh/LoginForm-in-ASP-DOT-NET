using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace LoginForm_in_ASP_DOT_NET
{
    public partial class TaskPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindResourceDropDown();
                BindTaskDropDown();
                Calendar1.SelectedDate = DateTime.Now;
                Calendar1.VisibleDate = DateTime.Now;

                DataTable dt = CreateDataTable();
                Session["TaskData"] = dt;
            }
        }

        private void BindResourceDropDown()
        {
            string connectionString = "Data Source=LAPTOP-SPTVSQVM\\SQLEXPRESS;Initial Catalog=asplogin;Integrated Security=True;TrustServerCertificate=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ResourceID, ResourceName FROM ResourceMaster";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlResourceName.DataSource = reader;
                ddlResourceName.DataTextField = "ResourceName";
                ddlResourceName.DataValueField = "ResourceID";
                ddlResourceName.DataBind();

                ddlResourceName.Items.Insert(0, new ListItem("Select Resource", "0"));

                reader.Close();
            }
        }

        private void BindTaskDropDown()
        {
            string connectionString = "Data Source=LAPTOP-SPTVSQVM\\SQLEXPRESS;Initial Catalog=asplogin;Integrated Security=True;TrustServerCertificate=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT TaskID, TaskName FROM TaskMaster";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                ddlTask.DataSource = reader;
                ddlTask.DataTextField = "TaskName";
                ddlTask.DataValueField = "TaskID";
                ddlTask.DataBind();

                ddlTask.Items.Insert(0, new ListItem("Select Task", ""));

                reader.Close();

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlResourceName.SelectedValue == "0" || ddlTask.SelectedValue == "" ||
           string.IsNullOrEmpty(txtStartDate.Text) || string.IsNullOrEmpty(txtEndDate.Text) ||
           string.IsNullOrEmpty(txtPlannedEffort.Text))
            {
                ShowAlert("Please fill in all required fields.");
                return;
            }

            if (!DateTime.TryParse(txtStartDate.Text, out DateTime startDate) ||
            !DateTime.TryParse(txtEndDate.Text, out DateTime endDate) ||
            endDate < startDate)
            {
                ShowAlert("Please enter valid start and end dates.");
                return;
            }

            DataTable dt = (DataTable)Session["TaskData"];
            DataRow dr = dt.NewRow();
            dr["ResourceName"] = ddlResourceName.SelectedItem.Text;
            dr["TaskName"] = ddlTask.SelectedItem.Text;
            dr["StartDate"] = startDate.ToShortDateString();
            dr["EndDate"] = endDate.ToShortDateString();
            dr["Efforts"] = txtPlannedEffort.Text;
            dr["Remarks"] = txtRemarks.Text;
            dt.Rows.Add(dr);

            SaveDataToDatabase();

            gvTaskData.DataSource = dt;
            gvTaskData.DataBind();
            gvTaskData.Visible = true;
            txtActualEffort.Text = string.Empty;
            ClearFormFields();
        }

        private void SaveDataToDatabase()
        {
            string connectionString = "Data Source=LAPTOP-SPTVSQVM\\SQLEXPRESS;Initial Catalog=asplogin;Integrated Security=True;TrustServerCertificate=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "INSERT INTO TaskPlanDetails (ResourceID, TaskID, StartDate, EndDate, Efforts, Remarks) " +
                               "VALUES (@ResourceID, @TaskID, @StartDate, @EndDate, @Efforts, @Remarks)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ResourceID", ddlResourceName.SelectedValue);
                cmd.Parameters.AddWithValue("@TaskID", ddlTask.SelectedValue);
                cmd.Parameters.AddWithValue("@StartDate", DateTime.Parse(txtStartDate.Text));
                cmd.Parameters.AddWithValue("@EndDate", DateTime.Parse(txtEndDate.Text));
                cmd.Parameters.AddWithValue("@Efforts", txtPlannedEffort.Text);
                cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                cmd.ExecuteNonQuery();
            }
        }

        private DataTable CreateDataTable()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ResourceName");
            dt.Columns.Add("TaskName");
            dt.Columns.Add("StartDate");
            dt.Columns.Add("EndDate");
            dt.Columns.Add("Efforts");
            dt.Columns.Add("Remarks");
            return dt;
        }

        private void ClearFormFields()
        {
            ddlResourceName.SelectedIndex = 0;
            ddlTask.SelectedIndex = 0;
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtPlannedEffort.Text = "";
            txtRemarks.Text = "";
        }

        private void ShowAlert(string message)
        {
            string script = $"alert('{message}');";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script, true);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
            ClientScript.RegisterStartupScript(this.GetType(), "HideCalendar", "toggleCalendar('calEndDates');", true);
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = Calendar2.SelectedDate.ToString("dd/MM/yyyy");
            ClientScript.RegisterStartupScript(this.GetType(), "HideCalendar", "toggleCalendar('calStartDates');", true);
        }

    }
}