using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace train_schedules_assignment
{
    public partial class BookTicket : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    int trainId = int.Parse(ddlTrains.SelectedValue);
                    if (!DateTime.TryParse(txtDate.Text, out DateTime bookingDate))
                    {
                        lblResult.Text = "Invalid date format.";
                        return;
                    }

                    // Generate a new GUID for the booking ID
                    string connectionString = ConfigurationManager.ConnectionStrings["TrainSchedulesDb"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Booking ( UserID, TrainID, BookingDateTime) VALUES ( @UserID, @TrainID, @BookingDateTime)";
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.Add(new SqlParameter("@UserID", SqlDbType.Int)).Value = GetUserId();
                            cmd.Parameters.Add(new SqlParameter("@TrainID", SqlDbType.Int)).Value = trainId;
                            cmd.Parameters.Add(new SqlParameter("@BookingDateTime", SqlDbType.Date)).Value = bookingDate.Date;

                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    lblResult.Text = "Booking successful!";
                }
                catch (SqlException ex)
                {
                    lblResult.Text = "A database error occurred.:"+ ex.Message;
                }
                catch (Exception ex)
                {
                    lblResult.Text = ex.Message;
                }
            }
            else
            {
                lblResult.Text = "Please ensure all fields are correctly filled out.";
            }
        }

        private int GetUserId()
        {
            return 1;
        }
    }
}
