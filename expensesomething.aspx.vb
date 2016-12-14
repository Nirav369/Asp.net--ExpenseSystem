Imports System.Data.SqlClient
Partial Class expensesomething
    Inherits System.Web.UI.Page

    Protected Sub btnInsert_Click(sender As Object, e As EventArgs) Handles btnInsert.Click
        Dim mysqlConnection As New SqlConnection
        Dim mysqlcommand As New SqlCommand
        Dim mysqlstring As String

        Try
            mysqlConnection.ConnectionString = "Data Source = SHUCSD.sacredheart.edu\SQL2012; Initial Catalog= CS557_SS16_pardiwalan; User Id=CS557_SS16_pardiwalan; Password=CS557_SS16_pardiwalan;"
            mysqlstring = "insert into expense (expense_date,amount,expense_category_desc) values('00/00/0000','9999','qwerty')"
            mysqlcommand.CommandType = Data.CommandType.StoredProcedure
            mysqlcommand.CommandText = mysqlstring
            mysqlcommand.Parameters.Add("@expense_date", Data.SqlDbType.DateTime).Value = txtDate.Text
            mysqlcommand.Parameters.Add("@amount", Data.SqlDbType.Int).Value = txtAmount.Text
            mysqlcommand.Parameters.Add("@expense_category_desc", Data.SqlDbType.VarChar).Value = ddlCategory.SelectedValue
            mysqlConnection.Open()
            mysqlcommand.Connection = mysqlConnection
            lblError.Text = mysqlcommand.ExecuteNonQuery().ToString & "Record Added !"
            mysqlConnection.Close()
            txtDate.Text = ""
            txtAmount.Text = ""
            ddlCategory.SelectedIndex = -1

        Catch ex As Exception
            Me.Master.MessageLabel.Text = ex.Message
        End Try
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Session("username") = "" Then
                Response.Redirect("Default.aspx")
            Else
                Me.Master.Mymenu = True
            End If
        Catch ex As Exception
            Me.Master.MessageLabel.Text = ex.Message
        End Try

    End Sub
End Class
