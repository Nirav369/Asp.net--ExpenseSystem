<%@ Page Title="" Language="VB" MasterPageFile="~/expense.master" AutoEventWireup="false" CodeFile="report.aspx.vb" Inherits="report" %>
<%@ MasterType VirtualPath ="~/expense.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" DataSourceID="sdsCategory" DataTextField="expense_category_desc" DataValueField="expense_category_id" Width="190px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="sdsCategory" runat="server" ConnectionString="<%$ ConnectionStrings:CS557_SS16_pardiwalanConnectionString %>" SelectCommand="SELECT [expense_category_desc], [expense_category_id] FROM [expense_category]"></asp:SqlDataSource>
    <br />
    <asp:DataList ID="dlCategory" runat="server" DataKeyField="expense_category_id" DataSourceID="sdsCategoryList">
        <AlternatingItemStyle BackColor="#CCCCCC" />
        <ItemTemplate>
            expense_category_id:
            <asp:Label ID="expense_category_idLabel" runat="server" Text='<%# Eval("expense_category_id") %>' />
            <br />
            expense_category_desc:
            <asp:Label ID="expense_category_descLabel" runat="server" Text='<%# Eval("expense_category_desc") %>' />
            <br />
<br />
        </ItemTemplate>
        <SeparatorTemplate>
            ID:
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("expense_category_id", "{0:N}") %>'></asp:Label>
            <br />
            Category:
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("expense_category_desc", "{0}") %>'></asp:Label>
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="sdsCategoryList" runat="server" ConnectionString="<%$ ConnectionStrings:CS557_SS16_pardiwalanConnectionString %>" SelectCommand="SELECT [expense_category_id], [expense_category_desc] FROM [expense_category] WHERE ([expense_category_id] = @expense_category_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dlCategory" Name="expense_category_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

