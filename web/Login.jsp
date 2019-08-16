<%-- 
    Document   : Login
    Created on : Apr 30, 2019, 9:01:17 AM
    Author     : Jira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Function can't click back -->
         <script type="text/javascript">
            function noBack(){
                window.history.forward();
            }
             
            noBack();
            window.onload = noBack;
            window.onpageshow = function(evt) { 
                if (evt.persisted){ 
                    noBack();
                } 
            };
            window.onunload = function() { 
                void (0); 
            };
        </script>
        <!------ Script ---------->
        
        <script type="text/javascript">
        </script>

        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="/script.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <!------ Meta ---------->

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <!------ Link ---------->

        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="style5.css">
        <link href="css/style5.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Roboto" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="/style.css">

        <!------ Title ---------->

        <title>Login</title>

        <!------ Style ---------->

      



        <style type="text/css">


            /* sign in FORM */
            #logreg-forms{
                width:412px;
                margin:10vh auto;
                background-color:#f3f3f3;
                box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
                transition: all 0.3s cubic-bezier(.25,.8,.25,1);
            }
            #logreg-forms form {
                width: 100%;
                max-width: 410px;
                padding: 15px;
                margin: auto;
            }
            #logreg-forms .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            #logreg-forms .form-control:focus { z-index: 2; }
            #logreg-forms .form-signin input[type="email"] {
                margin-bottom: -1px;
                border-bottom-right-radius: 0;
                border-bottom-left-radius: 0;
            }
            #logreg-forms .form-signin input[type="password"] {
                border-top-left-radius: 0;
                border-top-right-radius: 0;
            }

            #logreg-forms .social-login{
                width:390px;
                margin:0 auto;
                margin-bottom: 14px;
            }
            #logreg-forms .social-btn{
                font-weight: 100;
                color:white;
                width:190px;
                font-size: 0.9rem;
            }

            #logreg-forms a{
                display: block;
                padding-top:10px;
                color:lightseagreen;
            }

            #logreg-form .lines{
                width:200px;
                border:1px solid red;
            }


            #logreg-forms button[type="submit"]{ margin-top:10px; }

            #logreg-forms .facebook-btn{  background-color:#3C589C; }

            #logreg-forms .google-btn{ background-color: #DF4B3B; }

            #logreg-forms .form-reset, #logreg-forms .form-signup{ display: none; }

            #logreg-forms .form-signup .social-btn{ width:210px; }

            #logreg-forms .form-signup input { margin-bottom: 2px;}

            .form-signup .social-login{
                width:210px !important;
                margin: 0 auto;
            }

            /* Mobile */

            @media screen and (max-width:500px){
                #logreg-forms{
                    width:300px;
                }

                #logreg-forms  .social-login{
                    width:200px;
                    margin:0 auto;
                    margin-bottom: 10px;
                }
                #logreg-forms  .social-btn{
                    font-size: 1.3rem;
                    font-weight: 100;
                    color:white;
                    width:200px;
                    height: 56px;

                }
                #logreg-forms .social-btn:nth-child(1){
                    margin-bottom: 5px;
                }
                #logreg-forms .social-btn span{
                    display: none;
                }
                #logreg-forms  .facebook-btn:after{
                    content:'Facebook';
                }

                #logreg-forms  .google-btn:after{
                    content:'Google+';
                }

            }
            .btn-cancel{

                background-color: white; 
                color: green;
                border: 2px solid #4CAF50;
                text-align: center;
            }
            .btn-cancel:hover{
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>

    <!------ Body ---------->

    <body>

        <!------ Topbar ---------->

        <div class="navbars">
            <img src="image/jpsLogo.png" class="imgLogoJps">
            <h4 class="navText">ERP for Manufacturing</h4>
        </div>

        <!------ Login_Form ---------->

        <br>
        <br>
        <br>
        <div id="logreg-forms">

            <!------ Login ---------->

            <form class="form-signin" method="post" action="LoginP.jsp">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Sign in</h1>
                <div class="social-login">
                </div>
                <br>
                <input type="text" name="username" class="form-control" placeholder="User ID" required="" autofocus="">
                <input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Password" required="">

                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Sign in</button>
                <button class="btn btn-cancel btn-block" type="submit" onclick="Login.jsp">&nbsp;&nbsp;&nbsp;&nbsp;Cancel</button>
                <a href="#" id="forgot_pswd">Forgot password?</a>
                <hr>
                <!-- <p>Don't have an account!</p>  -->
                <button class="btn btn-primary btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Sign up New Account</button>
            </form>

            <!------ reset_password ---------->

            <form action="/reset/password/" class="form-reset" >
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" autofocus="">
                <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>

            <!------ Sign in ---------->

            <form action="/signup/" class="form-signup">
                <div class="social-login">
                    <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign up with Facebook</span> </button>
                </div>
                <div class="social-login">
                    <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign up with Google+</span> </button>
                </div>

                <p style="text-align:center">OR</p>

                <input type="text" id="user-name" class="form-control" placeholder="Full name" required="" autofocus="">
                <input type="email" id="user-email" class="form-control" placeholder="Email address" required autofocus="">
                <input type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus="">
                <input type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus="">

                <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            <br>

        </div>

        <!------ Footer ---------->

        <div class="footer">
            <p align="center">2019 @Japan System(Thailand) Co.,Ltd.</p>
        </div>



    </body>
</html>
