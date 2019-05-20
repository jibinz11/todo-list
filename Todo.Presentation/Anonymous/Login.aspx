<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Todo.Presentation.Login" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login | To-Do</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Content/Site/main.min.css">
</head>

<body>

    <form runat="server" id="form1">
        <div class="app-wrapper">
            <div class="app-login__container">
                <div>
                    <h3 class="app-main-title mb-4">Things To Do</h3>
                    <h5 class="m-0">Hello there!</h5>
                    <h4 class="mb-5">Welcome Back</h4>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group app-login__form">
                                <asp:TextBox AutoCompleteType="None" autocomplete="off" ID="txtUserName"  class="form-control" placeholder="Username/Email" runat="server"></asp:TextBox>
                                <label for="">Username/Email</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group app-login__form">
                                <asp:TextBox AutoCompleteType="None" autocomplete="off" ID="txtPassword" class="form-control" placeholder="Password" type="password" runat="server"></asp:TextBox>
                                <label for="">Password</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group form-check text-right">
                                <asp:CheckBox Text="" CssClass="form-check-input" ID="rememberMeChkBox" ClientIDMode="Static" runat="server" />
                                <label class="form-check-label text-muted" for="rememberMeChkBox"><small>Remember Me</small></label>
                            </div>
                        </div>
                        <div class="col-12">
                            <asp:Button Text="Sign In" class="btn btn-primary btn-block mt-3" ID="btnLogin" runat="server" OnClick="btnLogin_Click" />
                        </div>
                        <div class="col-12">
                            <p class="mb-0 mt-2"><asp:Label ID="lblError" runat="server" visible="false" class="text-danger">Please check you Username/Email or Password!</asp:Label></p>
                        </div>
                        <div class="col-12">
                            <p class="text-center text-muted mt-5">
                                <small>Don't have and account? <a href="#"><strong>Register</strong></a></small>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="app-login__desc">
            </div>
        </div>
    </form>

</body>

</html>
