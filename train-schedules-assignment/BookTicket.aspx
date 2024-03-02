<%@ Page Title="Book Ticket" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookTicket.aspx.cs" Inherits="train_schedules_assignment.BookTicket" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title">Book Your Train Ticket</h2>
        <h3>Fill out the form below to book a ticket.</h3>

        <asp:Label ID="lblResult" runat="server" CssClass="result-message"></asp:Label>

        <div class="form-group">
            <asp:Label ID="lblTrain" runat="server" Text="Train:"></asp:Label>
            <asp:DropDownList ID="ddlTrains" runat="server" DataSourceID="SqlDataSourceTrains" DataTextField="TrainName" DataValueField="TrainID" AppendDataBoundItems="true">
                <asp:ListItem Text="Select a Train" Value=""></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvTrain" runat="server" ErrorMessage="Select a train" ControlToValidate="ddlTrains" InitialValue="" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
    <asp:Label ID="lblUser" runat="server" Text="User:"></asp:Label>
    <asp:DropDownList ID="ddlUsers" runat="server" DataSourceID="SqlDataSourceUsers" DataTextField="UserName" DataValueField="UserID" AppendDataBoundItems="true">
        <asp:ListItem Text="Select a User" Value=""></asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvUser" runat="server" ErrorMessage="Select a user" ControlToValidate="ddlUsers" InitialValue="" ForeColor="Red">*</asp:RequiredFieldValidator>
</div>
        <div class="form-group">
            <asp:Label ID="lblDate" runat="server" Text="Date:"></asp:Label>
            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="Select a date" ControlToValidate="txtDate" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Book Ticket" OnClick="btnSubmit_Click" CssClass="btn-submit" />

        <asp:SqlDataSource ID="SqlDataSourceTrains" runat="server" ConnectionString="<%$ ConnectionStrings:TrainSchedulesDb %>" 
            SelectCommand="SELECT TrainID, TrainName FROM Trains ORDER BY TrainName">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TrainSchedulesDb %>" 
    SelectCommand="SELECT UserID, UserName FROM Users ORDER BY UserName">
</asp:SqlDataSource>

    </main>
</asp:Content>
