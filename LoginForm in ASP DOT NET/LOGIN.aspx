<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="LoginForm_in_ASP_DOT_NET.LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <style>
        body{
            text-align:center;
            margin-top:15rem;
            font-size:1.5rem;
            font-style:inherit;
        }
        form{
            border:solid;
            margin-left:30%;
            margin-right:30%;
            padding-bottom:10px;
        }
        div{
            padding:6px;
        }
        .btn-login{
            margin-left: 5%;
        }

        .checkbox{
            margin-left: 15%;
            font-style : oblique;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="LOGIN FORM" ForeColor="#CC3399"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="User Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label3" type="password" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <input class ="checkbox" type="checkbox" onchange ="document.getElementById('TextBox2').type=this.checked? 'text' : 'password'" />Show Password
        <div>
            <asp:Button CssClass = "btn-login" ID="Button1" runat="server" Text="LOGIN" BackColor="#009933" BorderColor="#003300" ForeColor="Black" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="CLEAR" BackColor="#CC0000" BorderColor="#993300" ForeColor="Black" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
