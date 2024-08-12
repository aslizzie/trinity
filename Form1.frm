VERSION 5.00
Begin VB.Form frmLogin 
   BackColor       =   &H80000003&
   Caption         =   "trinity"
   ClientHeight    =   4530
   ClientLeft      =   3240
   ClientTop       =   0
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   4530
   ScaleWidth      =   9885
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton btnLogin 
      BackColor       =   &H80000003&
      Caption         =   "Log in"
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      MaskColor       =   &H00FFC0FF&
      MousePointer    =   1  'Arrow
      TabIndex        =   5
      Top             =   2880
      Width           =   1095
   End
   Begin VB.TextBox txtPassword 
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   4
      Top             =   2200
      Width           =   3945
   End
   Begin VB.TextBox txtUser 
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3000
      TabIndex        =   0
      Top             =   1400
      Width           =   3945
   End
   Begin VB.Label Label3 
      Caption         =   "Password"
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3000
      TabIndex        =   3
      Top             =   1900
      Width           =   1575
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Username"
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3000
      TabIndex        =   1
      Top             =   1100
      Width           =   2295
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Height          =   2500
      Left            =   2745
      TabIndex        =   2
      Top             =   900
      Width           =   4500
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnLogin_Click()
    logIn
End Sub

Private Sub logIn()
    Dim conexion As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim mainForm As frmMain
    Dim userForm As frmUser
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set rs = New ADODB.Recordset
    
    rs.Open "SELECT * FROM users WHERE username='" & txtUser.Text & "' AND password='" & txtPassword.Text & "'", conection

    If Not rs.EOF Then
        userID = rs.Fields("user_id").Value
       
        If rs.Fields("rol").Value = "admin" Then
            Set mainForm = New frmMain
            mainForm.Show
        Else
            Set userForm = New frmUser
            userForm.Show
        End If
        
        Me.Hide
    Else
        MsgBox "Incorrect username or password", vbExclamation
    End If
    
    rs.Close
    conection.Close
End Sub
