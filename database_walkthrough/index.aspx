<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="database_walkthrough.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <thead>
                    <tr>
                        <td>Username</td>
                        <td>First Name</td>
                        <td>Last Name</td>
                        <td> Email</td>
                    </tr>
                </thead>
            <asp:Repeater ID="repUsers" runat="server">
                <ItemTemplate>
                        <tr>
                            <td><asp:TextBox ID="usernameText" runat="server" Text='<%# Eval("username") %>'></asp:TextBox></td>
                            <td><asp:TextBox ID="firstNameText" runat="server" Text='<%# Eval("firstName") %>'></asp:TextBox></td>
                            <td><asp:TextBox ID="lastNameText" runat="server" Text='<%# Eval("lastName") %>'></asp:TextBox></td>
                            <td><asp:TextBox ID="emailText" runat="server" Text='<%# Eval("email") %>'></asp:TextBox></td>
                        </tr>
                </ItemTemplate>
            </asp:Repeater>
            </table>
        </div>
    </form>
    <asp:SqlDataSource ID="walkthroughConnection" runat="server" ConnectionString="<% $ConnectionStrings:walkthroughConnection %>"></asp:SqlDataSource>
</body>
</html>
