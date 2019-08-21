<%-- 
    Document   : Create_Customer
    Created on : May 9, 2019, 11:26:28 AM
    Author     : pakasit
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <!------ Script ---------->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>    
        <script src="js/dropdown.js" type="text/javascript"></script>
        <script>
            function mydrop1() {
                var x = document.getElementById("drop1");
                if (x.className.indexOf("w3-show") === -1) {
                    x.className += " w3-show";
                    x.previousElementSibling.className += " w3-light-blue";
                } else {
                    x.className = x.className.replace(" w3-show", "");
                    x.previousElementSibling.className =
                            x.previousElementSibling.className.replace(" w3-light-blue", "");
                }
            }
            function mydrop2() {
                var y = document.getElementById("drop2");
                if (y.className.indexOf("w3-show") === -1) {
                    y.className += " w3-show";
                    y.previousElementSibling.className += " w3-light-blue";
                } else {
                    y.className = y.className.replace(" w3-show", "");
                    y.previousElementSibling.className =
                            y.previousElementSibling.className.replace(" w3-light-blue", "");
                }
            }
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
            }

            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
            }

        </script>
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

        <!------ Meta ---------->

        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">

        <!------ Link ---------->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Roboto" rel="stylesheet">
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <%-- Dropdown --%>
        <link href="css/style5.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

        <!------ Title ---------->

        <title>Create Customer</title>

        <!------ Style ---------->

        <style>
            .image {

                padding: 30px;
                float: left;
            }
            .artigo_nome {
                border: 1px dotted blue;
                text-align: center;
                display: inline-block;
                max-width: 250px;
                padding: 10px;
                word-break: break-all; /* optional */
            }
            .artigo_nome1 {
                display: inline-block;
                word-break: break-all; /* optional */
            }
            .insert{
                height: auto;
                width: 100%;
                border: 1px solid;
                border-color: #5a5255;
                border-left: none;
                border-bottom: none;
                border-top: none;
                border-right: none;
                text-align: center;
            }
            .sidebar{
                border-color: #5a5255;
                border: 1px solid lightgray;
                border-top: none;
                border: 1px solid;
                height: 100%; /* 100% Full-height */
                width: 15%; /* 0 width - change this with JavaScript */
                position: fixed; /* Stay in place */
                top: 0;
                left: 0;
                overflow-x: hidden; /* Disable horizontal scroll */
                padding-top: 60px; /* Place content 60px from the top */
                transition: 0.5s; /* 0.5 second transition effect to slide in the sidebar */
            }


            .webname{
                font-size: 22px;
                font-weight: bold;
                float:left;
                text-align: center;
                /*    background-color: greenyellow;*/
                display:inline;
                width: 100%;
                height:54px;
                position: absolute;


            }
            .stylepic{
                width: 55px; height: 54px;

            }
            .styleloginname{
                /*    background-color: red;*/
                height:54px;
                width: 200px;
                text-align: center;
                padding-top: 20px;
                position: absolute;
                right: 0;
            }
            .mainpage{
                margin-left: 15%;
                width: 100%;
                text-align: left;
                border-left: none;
                border-bottom: none;
                border-top: none;
                border-right: none;
                padding-bottom: 10%;
            }
            #myTable{
                width: 100%;
            }
            .fullmain{
                width: 100%;max-width: 100%; height: 650px; min-height: 100%; margin: 57px auto auto auto;
            }
            input{
                width: 50%;
            }
            th{
                width: 20%;
            }


            @media screen and (max-width: 700px) {
                .sidebar {
                    display: none;
                }
                .styleloginname{
                    display: none;
                }
                .webname{
                    text-align: left;
                    width: 100%;
                    position: absolute;
                }
                .mainpage{
                    width: 100%;
                    margin: 0;
                    /*                    padding: 0;*/
                    padding-bottom: 20%;

                }
                .fullmain{
                    padding: 0;
                }
                input{
                    width: auto;
                }
                th{
                    width: auto;
                }
                .normal_form{
                    display: none !important;  
                }
                .responsive_form{
                    display: inherit !important;
                }
            }

            .tdw{

                width: 25%;
            }
            .tdws{

                width: 10%;
            }
            td,tr{
                padding: 5px;
            }

            .form-control{
                width: 75%;
            }
            #cancel{
                margin-left: 30px;
            }
            .normal_form{
                display: inherit;
                /*                display: none;*/
            }
            .responsive_form{
                /*                display:inherit;*/
                display: none;
            }





        </style>

    </head>

    <!------ Body ---------->

    <body>
        <!------ Set&Check Session ---------->

        <%
            //Session เป็นการดึงกันต่อๆมาเริ่มจากหน้า mainmenu
            String User = String.valueOf(session.getAttribute("sUser"));
            session.setAttribute("User", User);
            String username = String.valueOf(session.getAttribute("username_en"));
            session.setAttribute("username", username);
            String userid = String.valueOf(session.getAttribute("userid"));
            session.setAttribute("userid", userid);
            if (session.getAttribute("sUser") == null || session.getAttribute("userid") == null || session.getAttribute("username_en") == null) {
        %>
        <meta http-equiv= refresh content= 1;URL=Login.jsp>
        <%
        } else {
        %>

        <!------ Navbar ---------->

        <nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
            <a href="javascript:void(0)" onclick="w3_close()"
               class="w3-bar-item w3-button">Close Menu</a>
            <a class="w3-bar-item" style="font-size: 22px; font-weight: bold;">Sales Management</a>
            <ui>
                <li style=" list-style-type: none;"><a  class=" w3-button" href="Quotation.jsp" style="margin-left: 30px">Quotation</a></li>
                <li style=" list-style-type: none;"><a  class=" w3-button" href="Sales_Order.jsp" style="margin-left: 30px">Sales Order</a></li>   
                <li style=" list-style-type: none;"><a  class=" w3-button" href="#" style="margin-left: 30px">Delivery</a></li>
                <li style=" list-style-type: none;"><a  class=" w3-button" href="#" style="margin-left: 30px">Invoice</a></li> 
                <li style=" list-style-type: none;"><a  class=" w3-button" href="#" style="margin-left: 30px">Accounts Receivables</a></li>


            </ui>
            <a class="w3-bar-item" style="font-size: 22px; font-weight: bold;">Master Maintenance</a>
            <ui>
                <li style=" list-style-type: none;"><a  class=" w3-button" href="Customer_Master.jsp" style="margin-left: 30px">Customer Master</a></li>
                <li style=" list-style-type: none;"><a class=" w3-button" href="Product_Master.jsp" style="margin-left: 30px">Product Master</a></li>   

            </ui>
        </nav>
        <div class=" w3-top" style="max-width: 100%; width: 100%; ">
            <div class="navbars">
                <span class="w3-button w3-padding-16 w3-left" onclick="w3_open()" style=" margin: auto">☰</span>
                <span class="stylepic"><img src="image/jpsLogo.png" class="stylepic"></span>
                <span class="webname">ERP for Manufacturing</span>        
                <span class="styleloginname">
                    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                        <%
                            out.print(username);//username ดึงจากที่สร้างไว้ด้านบน
                        %> </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#" class="dropdown-item" onclick="open_Account()">My Account</a></li>
                        <li><a href="RemoveS.jsp" class="dropdown-item" onclick="logout()">Logout</a></li>    
                    </ul>
                </span>


            </div>
        </div>

        <!------ Main ---------->

        <div class="fullmain">
            
            <!------ Menu Left ---------->
            
            <div class="sidebar">             
                <button class="w3-button w3-block w3-left-align " onclick="mydrop1()"><b>Sales Management</b> <span class="fa fa-chevron-down" ></span></button>
                <div id="drop1" class="w3-bar-block w3-hide w3-white w3-card-4">
                    <a href="Quotation.jsp" class="w3-bar-item w3-button">Quotation</a>
                    <a href="Sales_Order.jsp" class="w3-bar-item w3-button">Sales Order</a>
                    <a href="Delivery.jsp" class="w3-bar-item w3-button">Delivery</a>
                    <a href="Invoice.jsp" class="w3-bar-item w3-button">Invoice</a>
                    <a href="Accounts_Receivables.jsp" class="w3-bar-item w3-button">Accounts Receivables</a>
                </div>
                <button class="w3-button w3-block w3-left-align" onclick="mydrop2()"><b>Master Maintenance</b> <span class="fa fa-chevron-down" aria-hidden="true"></span></button>
                <div id="drop2" class="w3-bar-block w3-hide w3-white w3-card-4">
                    <a href="Customer_Master.jsp" class="w3-bar-item w3-button">Customer Master</a>
                    <a href="Product_Master.jsp" class="w3-bar-item w3-button">Product Master</a>
                </div>
            </div>
            
            <!------ Main ---------->

            <div class="mainpage">
                <h2 style=" text-align: left ;padding-left: 5px">Create/Edit Customer</h2>
                
                <!------ Insert Data Web Form ---------->

                <form  method="post" action="Insert_Customer.jsp" class="normal_form">
                    <table>
                        <tr><th style="padding-left:40px;">Customer Code</th>
                            <td><input class=" form-control" maxlength="20" type="text" name="Cust_Code" required="" title="Please Enter Customer Code" /></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Customer Name English</th>
                            <td ><input class=" form-control" maxlength="50" type="text"  name="Cust_Name_EN" required=""/></td>

                            <td ><b>Customer Name</b></td>
                            <td><input class=" form-control" maxlength="50" type="text" name="Cust_Name" required=""/></td>
                        </tr>
                        
                        <tr><th style="padding-left:40px;">Type</th>
                            <td>
                                <select name="Type" required="" class="form-control" style="height:20%;">
                                    <option value="1">Client</option>
                                    <option value="2">Supplier</option>
                                    <option value="3">Partner</option>
                                    <option value="4">Other</option>

                                </select>

                            </td>
                            <td><b>Industry</b></td>
                            <td>
                                <select name="Indust" required="" class="form-control" style="height:20%;">
                                    <option value="0">Other</option>
                                    <option value="1">Information Technology</option>
                                    <option value="2">Manufacturing</option>
                                    <option value="3">Banking Services</option>
                                    <option value="4">Consulting</option>
                                    <option value="5">Finance</option>
                                    <option value="6">Government</option>
                                    <option value="7">Delivery</option>
                                    <option value="8">Entertainment</option>
                                    <option value="9">Non-Profit</option>
                                </select>
                            </td>
                        </tr>

                        <tr><th style="padding-left:40px;">Telephone</th>
                            <td><input class=" form-control" maxlength="15" type="text" name="phone_number" /></td>
                            <td><b>E-mail</b></td>
                            <td><input class=" form-control" maxlength="50" type="text" name="e_mail" /></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Website</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Website" /></td>
                            <td><b>TAX ID</b></td>
                            <td><input class=" form-control" maxlength="20" type="text" name="Taxid" /></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Street/Buiding</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Address" /></td>
                            <td><b>Room/Suite</b></td>
                            <td><input class=" form-control" maxlength="50" type="text" name="Suite" /></td>
                        </tr>

                        <tr><th style="padding-left:40px;">City(Khet/Amphur)</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="City"/></td>
                            <td><b>Region(Khwaeng/Tambol)</b></td>
                            <td><input class=" form-control" maxlength="50" type="text" name="Region" /></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Stat/Province</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Stat" /></td>
                            <td><b>Zip</b></td>
                            <td><input  class=" form-control" maxlength="10" type="text" name="Zip" /></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Country</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Country" required=""/></td>
                            <td></td>
                            <td></td>
                        </tr>
                        
                        <tr>
                            <div class="form-submit">
                                <td></td>
                                <td>
                                    <button class="btn btn-primary" id="submit" name="Save" type="submit" value="Save">Save</button>
                                    <button class="btn btn-danger" id="cancel" name="Cancel" type="button" onclick="window.location.href = 'Customer_Master.jsp';">Cancel</button>
                                </td>
                        </div>
                        
                        </tr>
                        
                    </table>

                </form>
                
                <!------ Insert Data Mobile Form ---------->

                <form  method="post" action="InsertP.jsp" class ="responsive_form">
                    <table>
                        <tr>
                            <th style="padding-left:40px;">Customer Code</th>
                            <td><input class=" form-control" maxlength="20" type="text" name="Cust_Code" required=""/></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Customer Name English</th>
                            <td ><input class=" form-control" maxlength="50" type="text" name="Cust_Name_EN" required="" /></td>
                        </tr>
                        <tr>  
                            <th style="padding-left:40px;">Customer Name</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Cust_Name" required=""/></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Type</th>
                            <td>
                                <select name="Type" required="" class="form-control" style="height:20%;">
                                    <option value="1">Client</option>
                                    <option value="2">Supplier</option>
                                    <option value="3">Partner</option>
                                    <option value="4">Other</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Industry</th>
                            <td>
                                <select name="Indust" required="" class="form-control" style="height:20%;">
                                    <option value="0">Other</option>
                                    <option value="1">Information Technology</option>
                                    <option value="2">Manufacturing</option>
                                    <option value="3">Banking Services</option>
                                    <option value="4">Consulting</option>
                                    <option value="5">Finance</option>
                                    <option value="6">Government</option>
                                    <option value="7">Delivery</option>
                                    <option value="8">Entertainment</option>
                                    <option value="9">Non-Profit</option>
                                </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Telephone</th>
                            <td><input class=" form-control" maxlength="15" type="text" name="phone_number" /></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">E-mail</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="e_mail" /></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Website</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Website" /></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">TAX ID</th>
                            <td><input class=" form-control" maxlength="20" type="text" name="Taxid" /></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Street/Buiding</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Address" /></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Room/Suite</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Suite" /></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">City(Khet/Amphur)</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="City"/></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Region(Khwaeng/Tambol)</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Region" /></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Stat/Province</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Stat" /></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Zip</th>
                            <td><input  class=" form-control" maxlength="10" type="text" name="Zip" /></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Country</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Country" required=""/></td>
                        </tr>
                        <tr>
                        <div class="form-submit">
                            <td></td>
                            <td>
                                <button class="btn btn-primary" id="submit" name="Save" type="submit" value="Save">Save</button>
                                <button class="btn btn-danger" id="cancel" name="Cancel" type="button" onclick="window.location.href = 'Customer_Master.jsp';">Cancel</button>
                            </td>
                        </div>
                        </tr>
                    </table>

                </form>

            </div>
        </div>


        <!------ Footer ---------->


        <div class="footer">
            <p align="center">2019 @Japan System(Thailand) Co.,Ltd.</p>
        </div>





        <%
            }
        %>
    </body>
</html>
