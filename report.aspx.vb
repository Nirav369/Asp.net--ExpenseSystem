
Partial Class report
    Inherits System.Web.UI.Page

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
