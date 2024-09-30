<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="LoginForm_in_ASP_DOT_NET.LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 1.5rem;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            display: flex;
            justify-content: center;
            align-items: flex-start; 
            height: 100vh;
            margin: 0;
        }

        form {
            width: 50%;
            max-width: 600px; 
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin-top: 80px; 
            text-align: left;
        }

        h2 {
            text-align: center; 
            color: #333; 
            margin-bottom: 40px; 
            font-weight: bold; 
            font-size: 2.5rem; 
            font-family: 'Montserrat', sans-serif; 
            color: #00796b; 
        }

        div {
            margin-bottom: 20px;
        }

        label {
            font-size: 1.1rem;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        input[type="submit"], input[type="button"] {
            width: 48%;
            padding: 10px;
            font-size: 1rem;
            background-color: #009688;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #00796b;
        }

        .checkbox {
            margin-left: 5px;
        }

     
        .button-container {
            display: flex;
            justify-content: space-between;
        }

        input[type="button"] {
            background-color: #CC0000; 
        }

         #loadingModal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            text-align: center;
            padding-top: 20%;
            z-index: 1000;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <h2>Login Form</h2> 
        <div>
            <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <input class="checkbox" type="checkbox" onchange="document.getElementById('TextBox2').type=this.checked ? 'text' : 'password'" />Show Password
        <div class="button-container">
            <asp:Button ID="Button1" runat="server" Text="LOGIN" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="CLEAR" OnClick="Button2_Click" />
        </div>
    </form>

</body>
</html>
