<%-- 
    Document   : product master
    Created on : May 9, 2019, 11:26:28 AM
    Author     : pakasit
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    String id = request.getParameter("ITEM_NO");
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

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

%> 
<!DOCTYPE html>
<html> 
    <head> 
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"><!--
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        -->        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script><!--
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        
        -->        <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Roboto" rel="stylesheet"><!--
        
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        -->        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"><!--
        -->        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"><!--
        -->        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma"><!--
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>-->

        <%-- Dropdown --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="css/style5.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script src="js/main.js" type="text/javascript"></script>

        <!-- Title name -->
        <title>Product Master</title> 
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
                word-break: break-all; 
            }
            .artigo_nome1 {
                display: inline-block;
                word-break: break-all; 
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
                border: 1px solid lightgray;
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
                /*                    background-color: greenyellow;*/
                display:inline;
                width: 100%;
                height:54px;
                position: absolute;


            }
            .stylepic{
                width: 55px; height: 54px;

            }
            .styleloginname{
                /*                    background-color: red;*/
                height:54px;
                width: 200px;
                text-align: center;
                padding-top: 20px;
                position: absolute;
                right: 0;
            }
            .mainpage{
                margin-left: 15%;
                padding-bottom: 5%;
                width: 85%;
                height: auto;
                text-align: left;
                border: 1px solid; 
                border-color: #5a5255;
                border-left: none;
                border-bottom: none;
                border-top: none;
                border-right: none;
            }
            #myTable {
                text-align: center; 
                border-collapse: collapse;
                width: 90%;
                margin-left: 30px;
                border: 1px solid #ddd;
                font-size: 18px;

            }
            .fullmain{
                width: 100%;max-width: 100%; height: auto; min-height: 100%; margin: 57px auto auto auto;
            }
            input{
                width: 50%;
            }


            @media screen and (max-width: 700px) {
                #myTable {
                    border-collapse: collapse;
                    width: 100%;
                    border: 1px solid #ddd;
                    margin: auto;
                    /*                    font-size: 18px;*/

                }
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
                    padding: 0;
                    padding-bottom: 10%;

                }
                .fullmain{
                    padding: 0;
                }
                input{
                    width: auto;
                }
                .search{
                    width: 50%;
                }

            }
            .myInput {
                background-image: url('image/magnifier-tool.png');
                background-position: 10px 15px;
                background-repeat: no-repeat;
                width: 100%;
                font-size: 16px;
                padding: 12px 20px 12px 40px;
                border: 1px solid #ddd;
                margin-bottom: 12px;

            }
            .dataTables_length{
                margin-left: 30px;
                margin-top: 10px;
                float: left;
            }
            .dataTables_paginate{
                margin-right: 80px
            }
            .dataTables_info{
                margin-left: 30px;                
            }
            .search{
                padding: 12px 20px 12px 40px;
                margin-left: 30px;
                width: 90%;
            }

            #confirm {
                display: none;
                background-color: white;
                border: 1px solid #aaa;
                position: fixed;
                width: 600px;
                left: 50%;
                margin-left: -100px;
                padding: 30px 30px 30px;
                box-sizing: border-box;
                text-align: left;
            }
            #confirm button {
                display: inline-block;
                border-radius: 5px;
                border: 1px solid #aaa;
                padding: 5px;
                text-align: center;
                width: 80px;
                cursor: pointer;
            }
            #confirm .message {
                text-align: left;
            }
            #but_export{
                margin-right:  90%;
            }
            #but_create{
                float: right; padding-bottom: 10px;
            }



        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- นำเข้า  CSS จาก Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- นำเข้า  CSS จาก dataTables -->
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.12/css/jquery.dataTables.css">

        <!-- นำเข้า  Javascript จาก  Jquery -->
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- นำเข้า  Javascript  จาก   dataTables -->
        <script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.12/js/jquery.dataTables.js"></script>
        <script type="text/javascript">

            $(document).ready(function () {

                var table = $('#myTable').DataTable({
//                    "dom": 'ltipr',
                    "dom": '<"top"i>rt<"bottom"lp><"clear">',
                    "lengthMenu": [[5, 10, 20, 50, -1], [5, 10, 20, 50, "All"]],
                    "pagingType": "full_numbers",
                    "language": {
                        "lengthMenu": 'Display <select>' +
                                '<option value="5">5</option>' +
                                '<option value="10">10</option>' +
                                '<option value="20">20</option>' +
                                '<option value="50">50</option>' +
                                '<option value="-1">All</option>' +
                                '</select> records',
                        "info": "Showing _START_ to _END_ of _TOTAL_ records"
                    }
                });

                $('#mySearchText').on('keyup ', function () {
                    table.search($('#mySearchText').val()).draw();
                });


            });

        </script>

    </head> 
    <body> 
        <!------ Set&Check Session ---------->
        <%  String User = String.valueOf(session.getAttribute("sUser"));
            session.setAttribute("User", User);
            String username = String.valueOf(session.getAttribute("username_en"));
            session.setAttribute("username", username);
            String userid = String.valueOf(session.getAttribute("userid"));
            session.setAttribute("userid", userid);
            if (session.getAttribute("sUser") == null || session.getAttribute("userid") == null || session.getAttribute("username_en") == null) {
        %>
        <meta http-equiv= refresh content= 1;URL=Login.jsp>
        <%      } else {
        %>



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

        <div class="fullmain">
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

            <div class="mainpage">
                <br>
                <h2 style="padding-left: 5px; margin-left: 30px;">Product Master Maintenance</h2>
                <!--<input type="text" id="mySearchText" class="myInput"  placeholder="Fine Customer(Code,Name)" title="Type in a name">-->

                <table class="search">
                    <tr>
                        <td><input type="text" id="mySearchText" class="myInput"  placeholder="Find Product (Item No,English Name)" title="Type in a item_no or item_name_en"></td>
                        <td><button id="but_create" style=" float: right; padding-bottom: 10px;" type="button" class="btn btn-success" onclick=" document.location.href = 'Create_Product.jsp'">+ Add</button>
                            <div class="dropdown" style=" float: right; margin-right: 5%">
                                <button id="but_export" style=" float: right; margin-right: 5%;" class="btn btn-primary" type="button" data-toggle="dropdown"><img src="image/cog-wheel-silhouette.png">
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">

                                    <li>
                                        <button style=" width: 100%" type="submit" class="btn btn-light" onclick = "exportprocsv()">Export to CSV</button>
                                    </li>



                                    <li>
                                        <button style=" width: 100%" type="submit" class="btn btn-light" onclick = "exportproexcel()">Export to Excel</button>
                                    </li>

                                    <li><form target="_blank" action="PrintListProduct.jsp">

                                            <button style=" width: 100%" type="submit" class="btn btn-light">Print List</button>


                                        </form></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                        statement = connection.createStatement();
                        String sql = "SELECT * FROM product where FLG2 = 0";

                        resultSet = statement.executeQuery(sql);
                %>
                <table class="table table-hover" id="myTable">
                    <thead>
                        <tr>
                            <th style="text-align: center;"><img src="image/cog-wheel-silhouette.png"></th>
                            <th style="text-align: center;">Item No</th>
                            <th style="text-align: center;">Item Name EN</th>
                            <th style="text-align: center;">Item Name TH</th>
                            <th style="text-align: center;">Std Price</th>
                            <th style="text-align: center;">Registration</th>
                        </tr>
                    </thead >

                    <tbody> 

                        <%
                            while (resultSet.next()) {
                                String currency = resultSet.getString("CURR_ID");
                                Statement stwhereCur = null;
                                stwhereCur = connection.createStatement();
                                String sqlwhereCur = "SELECT * FROM currency where CRR_ID=" + currency;
                                ResultSet resultwhereCur = null;
                                resultwhereCur = stwhereCur.executeQuery(sqlwhereCur);
                                while (resultwhereCur.next()) {
                        %>
                        <tr>
                            <td>
                                <div class="dropdown">
                                    <button class="btn w3-button" id="menu1" data-toggle="dropdown" style="background-color: white">☰
                                    </button>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                        <li>
                                           

                                            <button style=" width: 100%; text-align: left; padding-left: 20px;" type="submit" class="btn btn-light " onclick="create()">Create</button>
                                        </li>
                                        <li>
                                           

                                            <button style=" width: 100%; text-align: left; padding-left: 20px;" type="submit" class="btn btn-light " onclick="edit('<%=resultSet.getString("ITEM_NO")%>')">Edit</button>
                                        </li>
                                        <li>
                                           

                                            <button style=" width: 100%; text-align: left; padding-left: 20px;" type="submit" class="btn btn-light " onclick="deletet('<%=resultSet.getString("ITEM_NO")%>')">Delete</button>
                                        </li>
                                    </ul>
                                </div>

                            </td>
                            <td><%out.print(resultSet.getString("ITEM_NO"));%></td>
                            <td><%=resultSet.getString("ITEM_NAME_EN")%></td>
                            <td><%=resultSet.getString("ITEM_NAME_TH")%></td>
                            <% DecimalFormat formatcomma = new DecimalFormat("#,##0.00");
                                Double douStprice = resultSet.getDouble("ST_PRICE");
                                String strStprice = formatcomma.format(douStprice);

                                String symbol = resultwhereCur.getString("CRR_SYM");
                            %>
                            <td><% out.print(symbol + strStprice); %></td>
                            <% SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
                                String strDate = formatter.format(resultSet.getDate("REG_DATE"));%>
                            <td><% out.print(strDate); %></td>
                        </tr>

                        <%
                                    }
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                    </tbody>
                </table>
                <br>

            </div>



        </div>


        <div class="footer">
            <p align="center">2019 @Japan System(Thailand) Co.,Ltd.</p>
        </div>


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
            function exportprocsv() {
                var r = confirm("Download CSV file");

                if (r === true) {
                    document.location.href = "Export_Product_to_CSV.jsp";

                } else {
                    document.location.href = "Product_Master.jsp";
                }
            }

            function exportproexcel() {
                var r = confirm("Download Excel file");

                if (r === true) {
                    document.location.href = "Export_Product_to_Excel.jsp";

                } else {
                    document.location.href = "Product_Master.jsp";
                }
            }
        </script>
        <script>
            function create() {
                    document.location.href = "Create_Product.jsp";
            }
             function edit(pid) {
                    document.location.href = "Edit_Product.jsp?ProID=" + pid;
            }
            function deletet(pid) {
                var r = confirm("Are you sure you want to delete it?");
                if (r === true) {
                    document.location.href = "Del.jsp?ProID=" + pid;

                } else {
                    document.location.href = "Product_Master.jsp";
                }

            }
        </script>

        <!-- JS -->
        <!--        <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/nouislider/nouislider.min.js"></script>
                <script src="vendor/wnumb/wNumb.js"></script>
                <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
                <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>-->
        <%
            }
        %>
    </body> 
</html>
