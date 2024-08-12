VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H80000003&
   Caption         =   "trinity"
   ClientHeight    =   4530
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   9885
   FillStyle       =   0  'Solid
   LinkTopic       =   "Form1"
   ScaleHeight     =   4530
   ScaleWidth      =   9885
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Delete 
      Caption         =   "Delete"
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
      TabIndex        =   6
      Top             =   960
      Width           =   975
   End
   Begin VB.CommandButton btnAdd 
      Caption         =   "New"
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
      Left            =   9000
      TabIndex        =   5
      Top             =   120
      Width           =   735
   End
   Begin MSComctlLib.ListView lvBooks 
      Height          =   3375
      Left            =   120
      TabIndex        =   3
      Top             =   960
      Width           =   8505
      _ExtentX        =   15002
      _ExtentY        =   5953
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
   Begin VB.TextBox txtSearch 
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
      Left            =   5600
      TabIndex        =   2
      Top             =   120
      Width           =   2000
   End
   Begin VB.CommandButton btnSearch 
      BackColor       =   &H80000003&
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
      Left            =   7680
      MaskColor       =   &H00FFC0FF&
      TabIndex        =   1
      Top             =   120
      Width           =   975
   End
   Begin VB.CommandButton btnLogout 
      BackColor       =   &H80000003&
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
      MaskColor       =   &H00FFC0FF&
      MousePointer    =   1  'Arrow
      TabIndex        =   0
      Top             =   3960
      Width           =   975
   End
   Begin VB.Label Label1 
      BackColor       =   &H80000003&
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
      TabIndex        =   4
      Top             =   120
      Width           =   1335
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public Username As String

Private Sub btnAdd_Click()
    Dim bookForm As frmBook
    Me.Hide
    
    Set bookForm = New frmBook
    bookForm.Show
End Sub

Private Sub btnLogout_Click()
    Unload Me
    
    Dim loginForm As frmLogin
    
    Set loginForm = New frmLogin
    loginForm.Show
End Sub

Private Sub btnSearch_Click()
    Dim conection As ADODB.Connection
    Dim rs As ADODB.Recordset
    Dim sql As String
    Dim item As ListItem
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set rs = New ADODB.Recordset
    
    sql = "SELECT * FROM books WHERE title LIKE '%" & txtSearch.Text & "%' OR author LIKE '%" & txtSearch.Text & "%' OR genre LIKE '%" & txtSearch.Text & "%'"
    
    rs.Open sql, conection, adOpenStatic, adLockReadOnly
    
    lvBooks.ListItems.Clear
    
    Do While Not rs.EOF
        Set item = lvBooks.ListItems.Add(, , rs.Fields("title").Value)
        item.SubItems(1) = rs.Fields("author").Value
        item.SubItems(2) = rs.Fields("editorial").Value
        item.SubItems(3) = rs.Fields("genre").Value
        item.SubItems(4) = rs.Fields("publication_year").Value
        
        rs.MoveNext
    Loop
    
    rs.Close
    conection.Close
End Sub

Private Sub Delete_Click()
    Dim conection As ADODB.Connection
    Dim sql As String
    Dim bookID As Integer
    
    If lvBooks.selectedItem Is Nothing Then
        MsgBox "Please select a book to remove from favorites.", vbExclamation
        Exit Sub
    End If
    
    bookID = lvBooks.selectedItem.Tag
    
    If MsgBox("Are you sure you want to delete this book?", vbYesNo + vbQuestion, "Delete it") = vbNo Then
        Exit Sub
    End If
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    sql = "DELETE FROM favorites WHERE book_id = " & bookID
    conection.Execute sql
    
    sql = "DELETE FROM books WHERE book_id = " & bookID
    conection.Execute sql

    conection.Close

    Set selectedItem = lvBooks.selectedItem
    
    lvBooks.ListItems.Remove selectedItem.Index
    
    MsgBox "The book has been deleted.", vbInformation
End Sub

Private Sub loadBooks()
    Dim conection As ADODB.Connection
    Dim rs As ADODB.Recordset
    
    Set conection = New ADODB.Connection
    conection.ConnectionString = "Driver={MySQL ODBC 8.0 ANSI Driver};Server=localhost;Database=trinity;User=root;Password=root;"
    conection.Open
    
    Set rs = New ADODB.Recordset
    
    rs.Open "SELECT * FROM books", conection
     
    lvBooks.ListItems.Clear
    
    Do While Not rs.EOF
        Set item = lvBooks.ListItems.Add(, , rs.Fields("title").Value)
        item.SubItems(1) = rs.Fields("author").Value
        item.SubItems(2) = rs.Fields("editorial").Value
        item.SubItems(3) = rs.Fields("genre").Value
        item.SubItems(4) = rs.Fields("publication_year").Value
        
        item.Tag = rs.Fields("book_id").Value
        
        rs.MoveNext
    Loop
    
    lvBooks.selectedItem = Nothing
    
    rs.Close
    conection.Close
    
End Sub

Private Sub Form_Load()
    With lvBooks
        .ColumnHeaders.Add , , "Title", 3000
        .ColumnHeaders.Add , , "Author", 1000
        .ColumnHeaders.Add , , "Editorial", 1500
        .ColumnHeaders.Add , , "Genre", 1500
        .ColumnHeaders.Add , , "Year of publication", 1505
    End With
    loadBooks
End Sub
