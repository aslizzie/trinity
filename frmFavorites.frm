VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmFavorites 
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
   Begin MSComctlLib.ListView lvFavorites 
      Height          =   3135
      Left            =   120
      TabIndex        =   6
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
   Begin VB.CommandButton btnLogOutFav 
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
      TabIndex        =   5
      Top             =   3960
      Width           =   975
   End
   Begin VB.TextBox txtSearchFav 
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
      Left            =   4050
      TabIndex        =   4
      Top             =   120
      Width           =   2000
   End
   Begin VB.CommandButton btnGoBack 
      Caption         =   "Go back to home"
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
      Left            =   7440
      TabIndex        =   3
      Top             =   600
      Width           =   2300
   End
   Begin VB.CommandButton btnRemoveFav 
      Caption         =   "Remove from favorites"
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
      Left            =   7440
      TabIndex        =   2
      Top             =   120
      Width           =   2300
   End
   Begin VB.CommandButton btnSearchFavorites 
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
      Left            =   6120
      TabIndex        =   1
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "My library / My favorites"
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
      TabIndex        =   0
      Top             =   120
      Width           =   2175
   End
End
Attribute VB_Name = "frmFavorites"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnGoBack_Click()
    Unload Me
    
    Dim userForm As frmUser
    
    Set userForm = New frmUser
    userForm.Show
End Sub

Private Sub btnLogOutFav_Click()
    Unload Me
    
    Dim loginForm As frmLogin
    
    Set loginForm = New frmLogin
    loginForm.Show
End Sub

Private Sub btnRemoveFav_Click()
    Dim conection As ADODB.Connection
    Dim sql As String
    Dim bookID As Integer
    
    If lvFavorites.SelectedItem Is Nothing Then
        MsgBox "Please select a book to remove from favorites.", vbExclamation
        Exit Sub
    End If
    
    bookID = lvFavorites.SelectedItem.Tag
    
    If MsgBox("Are you sure you want to remove this book from your favorites?", vbYesNo + vbQuestion, "Remove from favorites") = vbNo Then
        Exit Sub
    End If
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    sql = "DELETE FROM favorites WHERE book_id = " & bookID & " AND user_id = " & userID

    conection.Execute sql

    conection.Close

    Set SelectedItem = lvFavorites.SelectedItem
    
    lvFavorites.ListItems.Remove SelectedItem.Index
    
    MsgBox "The book has been removed from your favorites.", vbInformation
End Sub

Private Sub btnSearchFavorites_Click()
    Dim conection As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim item As ListItem
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set rs = New ADODB.Recordset
    
    sql = "SELECT books.book_id, books.title, books.author, books.editorial, books.genre, books.publication_year " & _
          "FROM books " & _
          "INNER JOIN favorites ON books.book_id = favorites.book_id " & _
          "WHERE favorites.user_id = " & userID & _
          " AND (books.title LIKE '%" & txtSearchFav & "%' " & _
          "OR books.author LIKE '%" & txtSearchFav & "%' " & _
          "OR books.editorial LIKE '%" & txtSearchFav & "%' " & _
          "OR books.genre LIKE '%" & txtSearchFav & "%' " & _
          "OR books.publication_year LIKE '%" & txtSearchFav & "%')"
       
    rs.Open sql, conection, adOpenStatic, adLockReadOnly
    
    lvFavorites.ListItems.Clear
    
    Do While Not rs.EOF
        Set item = lvFavorites.ListItems.Add(, , rs.Fields("title").Value)
        item.SubItems(1) = rs.Fields("author").Value
        item.SubItems(2) = rs.Fields("editorial").Value
        item.SubItems(3) = rs.Fields("genre").Value
        item.SubItems(4) = rs.Fields("publication_year").Value
        
        item.Tag = rs.Fields("book_id").Value
        
        rs.MoveNext
    Loop
    
    rs.Close
    conection.Close
End Sub

Private Sub Form_Load()
     With lvFavorites
        .ColumnHeaders.Add , , "Title", 3000
        .ColumnHeaders.Add , , "Author", 1000
        .ColumnHeaders.Add , , "Editorial", 1500
        .ColumnHeaders.Add , , "Genre", 1500
        .ColumnHeaders.Add , , "Year of publication", 1505
    End With

    Dim conection As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim item As ListItem
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set rs = New ADODB.Recordset

    sql = "SELECT books.book_id, books.title, books.author, books.editorial, books.publication_year, books.genre " & _
          "FROM books " & _
          "INNER JOIN favorites ON books.book_id = favorites.book_id " & _
          "WHERE favorites.user_id = " & userID

    rs.Open sql, conection
    
    lvFavorites.ListItems.Clear
    
    Do While Not rs.EOF
        Set item = lvFavorites.ListItems.Add(, , rs.Fields("title").Value)
        item.SubItems(1) = rs.Fields("author").Value
        item.SubItems(2) = rs.Fields("editorial").Value
        item.SubItems(3) = rs.Fields("genre").Value
        item.SubItems(4) = rs.Fields("publication_year").Value
        
        item.Tag = rs.Fields("book_id").Value
        
        rs.MoveNext
    Loop
    
    Dim i As Integer
    For i = 1 To lvFavorites.ListItems.Count
        lvFavorites.ListItems(i).Selected = False
    Next i
    
    rs.Close
    conection.Close
End Sub
