
Partial Class expense
    Inherits System.Web.UI.MasterPage

    Public Property MessageLabel() As Label
        Get
            Return lblMessage
        End Get
        Set(value As Label)
            lblMessage = value
        End Set
    End Property

    Public WriteOnly Property Mymenu As Boolean
        Set(value As Boolean)
            mainMenu.Visible = value
        End Set
    End Property
End Class

