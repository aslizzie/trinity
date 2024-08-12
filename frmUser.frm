VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmUser 
   BackColor       =   &H80000003&
   Caption         =   "trinity"
   ClientHeight    =   4530
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   9885
   LinkTopic       =   "Form1"
   ScaleHeight     =   4530
   ScaleWidth      =   9885
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtSearchUser 
      Height          =   375
      Left            =   4650
      TabIndex        =   5
      Top             =   120
      Width           =   2000
   End
   Begin VB.CommandButton btnSearchUser 
      Caption         =   "Search"
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
      TabIndex        =   4
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton btnFavs 
      Caption         =   "My favorites"
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
      Left            =   8040
      TabIndex        =   3
      Top             =   600
      Width           =   1695
   End
   Begin VB.CommandButton btnAddFav 
      Caption         =   "Add to favorites"
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
      Left            =   8040
      TabIndex        =   2
      Top             =   120
      Width           =   1700
   End
   Begin VB.CommandButton btnLogoutUser 
      Caption         =   "Log out"
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
      Left            =   8760
      TabIndex        =   1
      Top             =   3960
      Width           =   975
   End
   Begin MSComctlLib.ListView lvBooksUser 
      Height          =   3135
      Left            =   120
      TabIndex        =   0
      Top             =   1200
      Width           =   8505
      _ExtentX        =   15002
      _ExtentY        =   5530
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "My library"
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
      TabIndex        =   6
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "frmUser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnAddFav_Click()
    Dim conection As ADODB.Connection
    Dim cmd As ADODB.Command
    Dim sql As String
    Dim bookID As Integer
    
    If Not lvBooksUser.selectedItem Is Nothing Then
        bookID = lvBooksUser.selectedItem.Tag
    Else
        MsgBox "Por favor, selecciona un libro de la lista.", vbExclamation
        Exit Sub
    End If
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set cmd = New ADODB.Command
    cmd.ActiveConnection = conection
    
    sql = "INSERT INTO favorites (user_id, book_id) VALUES (?, ?)"
    
    cmd.CommandText = sql
    cmd.Parameters.Append cmd.CreateParameter(, adInteger, adParamInput, , userID) ' ID del usuario global
    cmd.Parameters.Append cmd.CreateParameter(, adInteger, adParamInput, , bookID) ' ID del libro seleccionado

    cmd.Execute
    
    MsgBox "The book has been added to your favorites.", vbInformation
    
    conection.Close
End Sub

Private Sub btnFavs_Click()
    Dim favoritesForm As frmFavorites
    Me.Hide
    
    Set favoritesForm = New frmFavorites
    favoritesForm.Show
End Sub

Private Sub Form_Load()
    With lvBooksUser
        .ColumnHeaders.Add , , "Title", 3000
        .ColumnHeaders.Add , , "Author", 1000
        .ColumnHeaders.Add , , "Editorial", 1500
        .ColumnHeaders.Add , , "Genre", 1500
        .ColumnHeaders.Add , , "Year of publication", 1505
    End With
    
    loadBooks
End Sub

Private Sub loadBooks()
    Dim conection As ADODB.Connection
    Dim rs As ADODB.Recordset
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set rs = New ADODB.Recordset
    
    rs.Open "SELECT * FROM books", conection
     
    lvBooksUser.ListItems.Clear
    
    Do While Not rs.EOF
        Set item = lvBooksUser.ListItems.Add(, , rs.Fields("title").Value)
        item.SubItems(1) = rs.Fields("author").Value
        item.SubItems(2) = rs.Fields("editorial").Value
        item.SubItems(3) = rs.Fields("genre").Value
        item.SubItems(4) = rs.Fields("publication_year").Value
        
        item.Tag = rs.Fields("book_id").Value
        
        rs.MoveNext
    Loop
    
    Dim i As Integer
    For i = 1 To lvBooksUser.ListItems.Count
        lvBooksUser.ListItems(i).Selected = False
    Next i
    
    rs.Close
    conection.Close
    
End Sub
Private Sub btnLogoutUser_Click()
    Unload Me
    
    Dim loginForm As frmLogin
    
    Set loginForm = New frmLogin
    loginForm.Show
End Sub

Private Sub btnSearchUser_Click()
    Dim conection As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim item As ListItem
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set rs = New ADODB.Recordset
    
    sql = "SELECT * FROM books WHERE title LIKE '%" & txtSearchUser.Text & "%' OR author LIKE '%" & txtSearchUser.Text & "%' OR genre LIKE '%" & txtSearchUser.Text & "%'"
    
    rs.Open sql, conection, adOpenStatic, adLockReadOnly
    
    lvBooksUser.ListItems.Clear
    
    Do While Not rs.EOF
        Set item = lvBooksUser.ListItems.Add(, , rs.Fields("title").Value)
        item.SubItems(1) = rs.Fields("author").Value
        item.SubItems(2) = rs.Fields("editorial").Value
        item.SubItems(3) = rs.Fields("genre").Value
        item.SubItems(4) = rs.Fields("publication_year").Value
        
        rs.MoveNext
    Loop
    
    rs.Close
    conection.Close
End Sub
