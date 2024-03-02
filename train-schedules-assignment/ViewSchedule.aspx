<%@ Page Title="View Schedule" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSchedule.aspx.cs" Inherits="train_schedules_assignment.ViewSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title">View Train Schedule</h2>
        <h3>Check out the latest train schedules below.</h3>
        <asp:GridView ID="GridViewTrainSchedules" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTrainSchedules" CssClass="table">
            <Columns>
                <asp:BoundField DataField="TrainID" HeaderText="Train ID" ReadOnly="True" SortExpression="TrainID" />
                <asp:BoundField DataField="TrainName" HeaderText="Train Name" SortExpression="TrainName" />
                <asp:BoundField DataField="DepartureStation" HeaderText="Departure Station" SortExpression="DepartureStation" />
                <asp:BoundField DataField="ArrivalStation" HeaderText="Arrival Station" SortExpression="ArrivalStation" />
                <asp:BoundField DataField="DepartureTime" HeaderText="Departure Time" SortExpression="DepartureTime" />
                <asp:BoundField DataField="ArrivalTime" HeaderText="Arrival Time" SortExpression="ArrivalTime" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceTrainSchedules" runat="server" ConnectionString="<%$ ConnectionStrings:TrainSchedulesDb %>" 
            SelectCommand="SELECT * FROM [Trains] ORDER BY [DepartureTime]">
        </asp:SqlDataSource>
    </main>
</asp:Content>
