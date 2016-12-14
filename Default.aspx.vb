Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim mysqlConnection As New SqlConnection
        Dim mysqlcommand As New SqlCommand
        Dim mysqlstring As String
        Dim mysqldatareader As SqlDataReader
        Try
            mysqlConnection.ConnectionString = "Data Source = SHUCSD.sacredheart.edu\SQL2012; Initial Catalog= CS557_SS16_pardiwalan; User Id=CS557_SS16_pardiwalan; Password=CS557_SS16_pardiwalan;"
            mysqlstring = "SELECT * FROM expense_user WHERE expense_username = @username and expense_password = @password"
            mysqlcommand.CommandType = Data.CommandType.Text
            mysqlcommand.CommandText = mysqlstring
            mysqlcommand.Parameters.Add("@username", Data.SqlDbType.VarChar).Value = txtUsername.Text
            mysqlcommand.Parameters.Add("@password", Data.SqlDbType.VarChar).Value = txtPassword.Text
            mysqlConnection.Open()
            mysqlcommand.Connection = mysqlConnection
            mysqldatareader = mysqlcommand.ExecuteReader()
            If mysqldatareader.HasRows Then
                mysqldatareader.Read()
                Session("username") = mysqldatareader("expense_username")
                Session("password") = mysqldatareader("expense_password")
                Response.Redirect("main.aspx")
            Else
                Me.Master.MessageLabel.Text = "Not a user !"
            End If
        Catch ex As Exception
            Me.Master.MessageLabel.Text = ex.Message
        End Try
    End Sub
End Class
