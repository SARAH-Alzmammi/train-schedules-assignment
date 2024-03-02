<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="train_schedules_assignment.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Booked Tickets</h2>
    <asp:GridView ID="GridViewBookedTickets" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="SqlDataSourceBookedTickets">
        <Columns>
            <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
            <asp:BoundField DataField="TrainName" HeaderText="Train Name" />
            <asp:BoundField DataField="DepartureStation" HeaderText="Departure Station" />
            <asp:BoundField DataField="ArrivalStation" HeaderText="Arrival Station" />
            <asp:BoundField DataField="DepartureTime" HeaderText="Departure Time" />
            <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Time" />
            <asp:BoundField DataField="BookingDateTime" HeaderText="Booking Date" DataFormatString="{0:d}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceBookedTickets" runat="server" ConnectionString="<%$ ConnectionStrings:TrainSchedulesDb %>"
        SelectCommand="SELECT b.BookingID, t.TrainName, t.DepartureStation, t.ArrivalStation, t.DepartureTime, t.ArrivalTime, b.BookingDateTime FROM Booking b INNER JOIN Trains t ON b.TrainID = t.TrainID ORDER BY b.BookingDateTime DESC">
    </asp:SqlDataSource>
</asp:Content>
