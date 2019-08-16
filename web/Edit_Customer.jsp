<%-- 
    Document   : Edit_Customer
    Created on : May 9, 2019, 11:26:28 AM
    Author     : pakasit
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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

        <!------ Meta ---------->

        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <%-- Editpage --%>
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!------ Link ---------->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Roboto" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
        <%-- Dropdown --%>
        <link href="css/style5.css" rel="stylesheet" type="text/css"/>
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

        <!------ Title ---------->

        <title>Edit Customer</title>

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
                width: 15%;
                height: 100%;
                /*    border: 1px solid lightgray;*/
                position: fixed;
                border: 1px solid;
                border-color: #5a5255;
                border-top: none;
                float: left;
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
                /*                                display: none;*/
            }
            .responsive_form{
                /*                                display:inherit;*/
                display: none;
            }

        </style>

    </head>

    <!------ Body ---------->

    <body>

        <!------ Set&Check Session ---------->

        <%
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
        <%
            try {

                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String dbName = "erp1";
                String userId = "root";
                String password = "1234";

                try {
                    Class.forName(driverName);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
                Connection connect = null;
                connect = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                String cus_id, cus_cd, cus_name_en, name, tel, email, website, st, su, city, region, stat, zip, country, taxid, date, time, types, industs;
                Integer type, indust;

                PreparedStatement pstmt = null; //create statement 

                String strCustomerID = request.getParameter("CusID");
                int cusid = Integer.parseInt(strCustomerID);

                pstmt = connect.prepareStatement("select * from erp1.customer where CUST_ID=?"); // sql select query

                pstmt.setInt(1, cusid);

                ResultSet rs = pstmt.executeQuery(); // execute query store in resultset object rs.

                while (rs.next()) {

                    cus_id = rs.getString(1);
                    cus_cd = rs.getString(2);
                    cus_name_en = rs.getString(3);
                    name = rs.getString(4);
                    type = rs.getInt(5);
                    indust = rs.getInt(6);
                    tel = rs.getString(7);
                    email = rs.getString(8);
                    website = rs.getString(9);
                    st = rs.getString(10);
                    su = rs.getString(11);
                    city = rs.getString(12);
                    region = rs.getString(13);
                    stat = rs.getString(14);
                    zip = rs.getString(15);
                    country = rs.getString(16);
                    taxid = rs.getString(17);

                    types = Integer.toString(type);

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
                        <%out.print(username);%> </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#" class="dropdown-item" onclick="open_Account()">My Account</a></li>
                        <li><a href="RemoveS.jsp" class="dropdown-item" onclick="logout()">Logout</a></li>    
                    </ul>
                </span>


            </div>
        </div>

        <!------ Main ---------->             

        <div class="fullmain">
            <div class="sidebar">

                <!------ Menu Left ---------->

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

                <!------ Update Data Web Form ---------->

                <form  method="post" action="Update_Customer.jsp" class="normal_form">
                    <input type="hidden" name="cus_id" value="<%=cus_id%>">
                    <table>
                        <tr><th style="padding-left:40px;">Customer Code</th>
                            <td>
                                <input class=" form-control" maxlength="20" type="text" name="Cust_Code" required="" value="<%=cus_cd%>"/>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>



                        <tr><th style="padding-left:40px;">Customer Name English</th>
                            <td ><input class=" form-control" maxlength="50" type="text" name="Cust_Name_EN" required="" value="<%=cus_name_en%>" /></td>

                            <th style="padding-left:40px;">Customer Name</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Cust_Name" required="" value="<%=name%>"/></td>
                        </tr>
                        <tr><th style="padding-left:40px;">Type</th>
                            <td>

                                <select name="Type" required="" class="form-control" style="height:20%;">
                                    <%
                                        if (type == 1) {
                                    %><option selected="" value="1">Client</option><%
                                    } else {
                                    %><option value="1">Client</option><%
                                        }
                                        if (type == 2) {
                                    %><option selected="" value="2">Supplier</option><%
                                    } else {
                                    %><option value="2">Supplier</option><%
                                        }
                                    %>
                                    <%
                                        if (type == 3) {
                                    %><option selected="" value="3">Partner</option><%
                                    } else {
                                    %><option value="3">Partner</option><%
                                        }
                                        if (type == 4) {
                                    %><option selected="" value="4">Other</option><%
                                    } else {
                                    %><option value="4">Other</option><%
                                        }
                                    %>



                                </select>


                            </td>
                            <th style="padding-left:40px;">Industry</th>
                            <td>

                                <select name="Indust" required="" class="form-control" style="height:20%;">
                                    <% if (indust == 0) {

                                    %><option selected = "" value = "0">Other</option><%} else {
                                    %><option value = "0" > Other </option ><%
                                        }
                                    %>
                                    <% if (indust == 1) {

                                    %><option selected="" value="1">Information Technology</option><%} else {
                                    %><option value="1">Information Technology</option><%
                                        }
                                    %>
                                    <% if (indust == 2) {

                                    %><option selected="" value="2">Manufacturing</option><%} else {
                                    %><option value = "2" > Manufacturing</option ><%
                                        }
                                    %>
                                    <% if (indust == 3) {

                                    %><option selected="" value="3">Banking Services </option><%} else {
                                    %><option value="3">Banking Services </option><%
                                        }
                                    %>
                                    <% if (indust == 4) {

                                    %><option selected="" value="4">Consulting</option><%} else {
                                    %><option value="4">Consulting</option><%
                                        }
                                    %>
                                    <% if (indust == 5) {

                                    %><option selected="" value="5">Finance</option><%} else {
                                    %><option value="5">Finance</option><%
                                        }
                                    %>
                                    <% if (indust == 6) {

                                    %><option selected="" value="6">Government</option><%} else {
                                    %><option value="6">Government</option><%
                                        }
                                    %>
                                    <% if (indust == 7) {

                                    %><option selected="" value="7">Delivery</option><%} else {
                                    %><option value="7">Delivery</option><%
                                        }
                                    %>
                                    <% if (indust == 8) {

                                    %><option selected="" value="8">Entertainment</option><%} else {
                                    %><option value="8">Entertainment</option><%
                                        }
                                    %>
                                    <% if (indust == 9) {

                                    %><option selected="" value="9">Non-Profit</option><%} else {
                                    %><option value="9">Non-Profit</option><%
                                        }
                                    %>
                                </select>

                            </td>
                        </tr>

                        <tr><th style="padding-left:40px;">Telephone</th>
                            <td><input class=" form-control" maxlength="15" type="text" name="phone_number" value="<%=tel%>"/></td>
                            <th style="padding-left:40px;">E-mail</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="e_mail" value="<%=email%>" /></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Website</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Website" value="<%=website%>"/></td>
                            <th style="padding-left:40px;">TAX ID</th>
                            <td><input class=" form-control" maxlength="20" type="text" name="Taxid" value="<%=taxid%>" /></td>
                        </tr>



                        <tr><th style="padding-left:40px;">Street/Buiding</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Address" value="<%=st%>"/></td>
                            <th style="padding-left:40px;">Room/Suite</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Suite" value="<%=su%>"/></td>
                        </tr>

                        <tr><th style="padding-left:40px;">City(Khet)</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="City" value="<%=city%>"/></td>
                            <th style="padding-left:40px;">Region(Khwaeng)</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Region" value="<%=region%>"/></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Stat/Province</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Stat" value="<%=stat%>"/></td>
                            <th style="padding-left:40px;">Zip</th>
                            <td><input  class=" form-control" maxlength="10" type="text" name="Zip" value="<%=zip%>"/></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Country</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Country" required="" value="<%=country%>"/></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div class="form-submit">
                                    <button class="btn btn-primary" id="submit" name="Save" type="submit" value="Save">Save</button>
                                    <button class="btn btn-danger" id="cancel" name="Cancel" type="button" onclick="window.location.href = 'Customer_Master.jsp';">Cancel</button>
                                </div>
                            </td>
                        </tr>
                    </table>

                </form>

                <!------ Update Data Mobile Form ---------->

                <form  method="post" action="EditP.jsp" class="responsive_form">
                    <input type="hidden" name="cus_id" value="<%=cus_id%>">
                    <table>
                        <tr><th style="padding-left:40px;">Customer Code</th>
                            <td>
                                <input class=" form-control" maxlength="20" type="text" name="Cust_Code" required="" value="<%=cus_cd%>"/>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>



                        <tr><th style="padding-left:40px;">Customer Name English</th>
                            <td ><input class=" form-control" maxlength="50" type="text" name="Cust_Name_EN" required="" value="<%=cus_name_en%>" /></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;" >Customer Name</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Cust_Name" required="" value="<%=name%>"/></td>
                        </tr>
                        <tr><th style="padding-left:40px;">Type</th>
                            <td>

                                <select name="Type" required="" class=" form-control" style="height:20%;">
                                    <%
                                        if (type == 1) {
                                    %><option selected="" value="1">Client</option><%
                                    } else {
                                    %><option value="1">Client</option><%
                                        }
                                        if (type == 2) {
                                    %><option selected="" value="2">Supplier</option><%
                                    } else {
                                    %><option value="2">Supplier</option><%
                                        }
                                    %>
                                    <%
                                        if (type == 3) {
                                    %><option selected="" value="3">Partner</option><%
                                    } else {
                                    %><option value="3">Partner</option><%
                                        }
                                        if (type == 4) {
                                    %><option selected="" value="4">Other</option><%
                                    } else {
                                    %><option value="4">Other</option><%
                                        }
                                    %>



                                </select>


                            </td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Industry</th>
                            <td>

                                <select name="Indust" required="" class=" form-control" style="height:20%;">
                                    <% if (indust == 0) {

                                    %><option selected = "" value = "0">Other</option><%} else {
                                    %><option value = "0" > Other </option ><%
                                        }
                                    %>
                                    <% if (indust == 1) {

                                    %><option selected="" value="1">Information Technology</option><%} else {
                                    %><option value="1">Information Technology</option><%
                                        }
                                    %>
                                    <% if (indust == 2) {

                                    %><option selected="" value="2">Manufacturing</option>Other</option><%} else {
                                    %><option value = "2" > Other </option ><%
                                        }
                                    %>
                                    <% if (indust == 3) {

                                    %><option selected="" value="3">Manufacturing</option><%} else {
                                    %><option value="3">Manufacturing</option><%
                                        }
                                    %>
                                    <% if (indust == 4) {

                                    %><option selected="" value="4">Consulting</option><%} else {
                                    %><option value="4">Consulting</option><%
                                        }
                                    %>
                                    <% if (indust == 5) {

                                    %><option selected="" value="5">Finance</option><%} else {
                                    %><option value="5">Finance</option><%
                                        }
                                    %>
                                    <% if (indust == 6) {

                                    %><option selected="" value="6">Government</option><%} else {
                                    %><option value="6">Government</option><%
                                        }
                                    %>
                                    <% if (indust == 7) {

                                    %><option selected="" value="7">Delivery</option><%} else {
                                    %><option value="7">Delivery</option><%
                                        }
                                    %>
                                    <% if (indust == 8) {

                                    %><option selected="" value="8">Entertainment</option><%} else {
                                    %><option value="8">Entertainment</option><%
                                        }
                                    %>
                                    <% if (indust == 9) {

                                    %><option selected="" value="9">Non-Profit</option><%} else {
                                    %><option value="9">Non-Profit</option><%
                                        }
                                    %>

                                </select>

                            </td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Telephone</th>
                            <td><input class=" form-control" maxlength="15" type="text" name="phone_number" value="<%=tel%>"/></td>
                        </tr>
                        <tr>    
                            <th style="padding-left:40px;">E-mail</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="e_mail" value="<%=email%>" /></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Website</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Website" value="<%=website%>"/></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">TAX ID</th>
                            <td><input class=" form-control" maxlength="20" type="text" name="Taxid" value="<%=taxid%>" /></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Street/Buiding</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Address" value="<%=st%>"/></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Room/Suite</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Suite" value="<%=su%>"/></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">City(Khet)</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="City" value="<%=city%>"/></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Region(Khwaeng)</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Region" value="<%=region%>"/></td>
                        </tr>

                        <tr>
                            <th style="padding-left:40px;">Stat/Province</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Stat" value="<%=stat%>"/></td>
                        </tr>
                        <tr>
                            <th style="padding-left:40px;">Zip</th>
                            <td><input  class=" form-control" maxlength="10" type="text" name="Zip" value="<%=zip%>"/></td>
                        </tr>

                        <tr><th style="padding-left:40px;">Country</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="Country" required="" value="<%=country%>"/></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <div class="form-submit">
                                    <button class="btn btn-primary" id="submit" name="Save" type="submit" value="Save">Save</button>
                                    <button class="btn btn-danger" id="cancel" name="Cancel" type="button" onclick="window.location.href = 'Customer_Master.jsp';">Cancel</button>
                                </div>
                            </td>
                        </tr>
                    </table>

                </form>

            </div>
        </div>



        <%
                }
            } catch (Exception e) {
                out.println(e);
            }
        %> 

        <!------ Footer ---------->

        <div class="footer">
            <p align="center">2019 @Japan System(Thailand) Co.,Ltd.</p>
        </div>
        <%
            }
        %>
    </body>
</html>
