<%@ Page Title="" Language="VB" MasterPageFile="~/expense.master" AutoEventWireup="false" CodeFile="expensesomething.aspx.vb" Inherits="expensesomething" %>
<%@ MasterType VirtualPath ="~/expense.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            width: 214px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Amount Of Expense:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label2" runat="server" Text="Date of Expense"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDate" runat="server" TextMode="DateTime"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label3" runat="server" Text="Category of Expense:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="sdsCategory" DataTextField="expense_category_desc" DataValueField="expense_category_id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:CS557_SS16_pardiwalanConnectionString %>" SelectCommand="SELECT [expense_category_id], [expense_category_desc] FROM [expense_category]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" />
            &nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <br />
<asp:LinkButton ID="lbtnHome" runat="server" PostBackUrl="~/main.aspx">Home</asp:LinkButton>
    <br />
</asp:Content>

