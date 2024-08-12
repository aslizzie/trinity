VERSION 5.00
Begin VB.Form frmBook 
   BackColor       =   &H80000016&
   Caption         =   "Form1"
   ClientHeight    =   3540
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   7875
   LinkTopic       =   "Form1"
   ScaleHeight     =   3540
   ScaleWidth      =   7875
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtGenre 
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   2400
      Width           =   2775
   End
   Begin VB.TextBox txtYear 
      Height          =   375
      Left            =   4920
      TabIndex        =   9
      Top             =   1440
      Width           =   2775
   End
   Begin VB.TextBox txtEditorial 
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   1440
      Width           =   4500
   End
   Begin VB.TextBox txtAuthor 
      Height          =   375
      Left            =   4920
      TabIndex        =   5
      Top             =   480
      Width           =   2775
   End
   Begin VB.TextBox txtTitle 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   480
      Width           =   4500
   End
   Begin VB.CommandButton btnCancel 
      BackColor       =   &H80000010&
      Caption         =   "Cancel"
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
      Left            =   6720
      TabIndex        =   1
      Top             =   3000
      Width           =   975
   End
   Begin VB.CommandButton btnSaveBook 
      Caption         =   "Save"
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
      Left            =   5640
      TabIndex        =   0
      Top             =   3000
      Width           =   975
   End
   Begin VB.Label lblGenre 
      BackStyle       =   0  'Transparent
      Caption         =   "Genre"
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
      Left            =   120
      TabIndex        =   11
      Top             =   2040
      Width           =   1215
   End
   Begin VB.Label lblYear 
      BackStyle       =   0  'Transparent
      Caption         =   "Year of publication"
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
      Left            =   4920
      TabIndex        =   8
      Top             =   1080
      Width           =   1575
   End
   Begin VB.Label lblEditorial 
      BackStyle       =   0  'Transparent
      Caption         =   "Editorial"
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1080
      Width           =   1215
   End
   Begin VB.Label lblAuthor 
      BackStyle       =   0  'Transparent
      Caption         =   "Author"
      BeginProperty Font 
         Name            =   "Franklin Gothic Medium"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   4920
      TabIndex        =   4
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label lblTitle 
      BackStyle       =   0  'Transparent
      Caption         =   "Title"
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
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   855
   End
End
Attribute VB_Name = "frmBook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnCancel_Click()
    Unload Me
    
    Dim mainForm As frmMain
    
    Set mainForm = New frmMain
    mainForm.Show
End Sub

Public Sub btnSaveBook_Click()
    Dim conexion As ADODB.Connection
    Dim cmd As ADODB.Command
    Dim sql As String
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set cmd = New ADODB.Command
    cmd.ActiveConnection = conection
    
    sql = "INSERT INTO books (title, author, editorial, publication_year, genre) VALUES ("
    sql = sql & "'" & txtTitle.Text & "', "
    sql = sql & "'" & txtAuthor.Text & "', "
    sql = sql & "'" & txtEditorial.Text & "', "
    sql = sql & txtYear.Text & ", "
    sql = sql & "'" & txtGenre.Text & "'" & ")"
    
    cmd.CommandText = sql
    
    cmd.Execute
    
    MsgBox "Book added successfully", vbInformation
    
    txtTitle.Text = ""
    txtAuthor.Text = ""
    txtEditorial.Text = ""
    txtYear.Text = ""
    txtGenre.Text = ""
    
    conection.Close
End Sub

