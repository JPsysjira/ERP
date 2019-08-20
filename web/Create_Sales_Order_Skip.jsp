<%-- 
    Document   : Create_Sales_Order_Skip
    Created on : Jul 26, 2019, 3:11:24 PM
    Author     : pakasit
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
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

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- นำเข้า  CSS จาก Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- นำเข้า  CSS จาก dataTables -->
        <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.12/css/jquery.dataTables.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.0/css/select.dataTables.min.css">

        <!-- นำเข้า  Javascript จาก  Jquery -->
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <!-- นำเข้า  Javascript  จาก   dataTables -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/select/1.3.0/js/dataTables.select.min.js"></script>

        
        <title>Create Sales Order</title>

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
/*                width: 15%;
                height: 100%;
                    border: 1px solid lightgray;
                position: fixed;
                border: 1px solid;
                border-color: #5a5255;
                border-top: none;
                float: left;*/

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
            .openbtn{
                display: none;
                font-size: 16px;
                cursor: pointer;
                background-color: #56AFD6;
                color: white;
                padding: 10px 15px;
                border: none;
            }
            .closebtn{
                font-size: 16px;
                cursor: pointer;
                background-color: #56AFD6;
                color: white;
                padding: 10px 15px;
                border: none;
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
                width: 85%;
                text-align: left;
                border-left: none;
                border-bottom: none;
                border-top: none;
                border-right: none;
                padding-bottom: 20%;
            }
            .fullmain{
                width: 100%;max-width: 100%; height: 650px; min-height: 100%; margin: 57px auto auto auto;
            }
            /*            input{
                            width: 100%;
                        }
                        th{
                            width: 20%;
                        }*/


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
            td,tr{
                padding: 5px;
            }

            .form-control{
                width: 100%;
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
            .myTable{
                width: 90%

            }
            textarea{
                resize: none;
            }
            input[data-readonly] {
                pointer-events: none;
            }





        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>


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
                            out.print(username);
                        %> </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#" class="dropdown-item" onclick="open_Account()">My Account</a></li>
                        <li><a href="RemoveS.jsp" class="dropdown-item" onclick="logout()">Logout</a></li>    
                    </ul>
                </span>


            </div>
        </div>
        <%
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
            ResultSet resultCus = null;

            Statement statementCur = null;
            ResultSet resultCur = null;

            Statement statementUser = null;
            ResultSet resultUser = null;

            Statement statementCus2 = null;
            ResultSet resultCus2 = null;

            Statement statementCur2 = null;
            ResultSet resultCur2 = null;

            Statement statementUser2 = null;
            ResultSet resultUser2 = null;
        %>
        <% try {

                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                statement = connection.createStatement();
                statementCur = connection.createStatement();
                statementUser = connection.createStatement();

                statementCus2 = connection.createStatement();
                statementCur2 = connection.createStatement();
                statementUser2 = connection.createStatement();

                String sql = "SELECT * FROM customer";
                String sql2 = "SELECT * FROM currency";
                String sql3 = "SELECT * FROM user_master";

                String sqlcus2 = "SELECT * FROM customer";
                String sqlcur2 = "SELECT * FROM currency";
                String sqluser2 = "SELECT * FROM user_master";

                resultCus = statement.executeQuery(sql);
                resultCur = statementCur.executeQuery(sql2);
                resultUser = statementUser.executeQuery(sql3);

                resultCus2 = statementCus2.executeQuery(sqlcus2);
                resultCur2 = statementCur2.executeQuery(sqlcur2);
                resultUser2 = statementUser2.executeQuery(sqluser2);

        %>
        <script>
            //add row in Table_price
            $(document).ready(function () {
                $("#addrow").on("click", function () {
                    var newRow = $("<tr>");
                    var cols = "";
                    var counter = parseInt(document.getElementById("save_counter").value);
                    counter = counter+1;
                    cols += '<td><input type="text" readonly style=" text-align: center" class="form-control" id="line' + counter + '" name="line' + counter + '" value="' + counter + '" /><input class="btn btn-danger" id="del_line'+counter+'" type="button" style="width:100%;" value="-" onclick="del_line(this);"/></td>';
                    cols += '<td><input type="text" class="form-control" id="selectPro'+counter+'" name="product' + counter + '" readonly style="width:70%; display:inline;" /><input class="btn btn-default" id="selectProButton'+counter+'" type="button" value="+" onclick="SelectProduct('+counter+')" style="width:30%;height:30%; display:inline;" />';
                    cols += '<input type="text" class="form-control" id="selectPro_name' + counter + '" name="product_name' + counter + '" readonly /></td>';
                    cols += '<td><input type="text" class="form-control" id="deshead' + counter + '" name="deshead' + counter + '" placeholder="Description Head" value=""  />';
                    cols += '<textarea class="form-control" id="description' + counter + '" name="description' + counter + '" onclick="SelectDes('+counter+')" readonly /></textarea></td>';
                    cols += '<td><input type="text" class="form-control" id="unit_price' + counter + '" name="unit_price' + counter + '" onchange="changeinput('+counter+')" style="text-align: right;" value="0.00" /></td>';
                    cols += '<td><input type="text" class="form-control" id="quantity' + counter + '" name="quantity' + counter + '" onchange="changeinput('+counter+')" style="text-align: right;" value="0" /></td>';
                    cols += '<td><input type="text" class="form-control" id="amount' + counter + '" name="amount' + counter + '" style="text-align: right;" value="0.00" readonly tabindex="-1" /></td>';
                    cols += '<td><input type="text" class="form-control" id="discount_per' + counter + '" name="discount_per' + counter + '" onchange="discount_changeper('+counter+')" style="text-align: right;" value="0" /></td>';
                    cols += '<td><input type="text" class="form-control" id="discountamt' + counter + '" name="discountamt' + counter + '" onchange="discount_changeamt('+counter+')" style="text-align: right;" value="0.00" /></td>';
                    cols += '<td><input type="text" class="form-control" id="amount_after' + counter + '" name="amount_after' + counter + '" style="text-align: right;" value="0.00" readonly tabindex="-1" /></td>';
                    
                    
                    newRow.append(cols);
                    $("#Table_price").append(newRow);         
                    document.getElementById("save_counter").value = parseInt(counter);
                });
                


            });

                    

            $(document).ready(function () {
//                var cust_name = document.getElementById("cust_id").getAttribute("cust_name");
                var cust_name = $('#customer_id').find(":selected").attr("cust_name");
                document.getElementById("readcust").innerHTML = cust_name;
            });

            $(document).ready(function () {
//                var tel = document.getElementById("cust_id").getAttribute("tel");
                var tel = $('#customer_id').find(":selected").attr("tel");
                document.getElementById("readtel").value = tel;
            });

            $(document).ready(function () {
//                var sale_name = document.getElementById("sale_id").getAttribute("sale_name");
                var sale_name = $('#sales').find(":selected").attr("sale_name");
                document.getElementById("readuser").innerHTML = sale_name;
            });

            $(document).ready(function () {
//                var crr_name = document.getElementById("cur_id").getAttribute("cur_name");
                var crr_name = $('#currency_id').find(":selected").attr("cur_name");
                document.getElementById("readcur").innerHTML = crr_name;
            });
            $(document).ready(function () {
                var cur_tax = $('#currency_id').find(":selected").attr("cur_tax");
                document.getElementById("qt_tax").value = cur_tax;
            });
            $(document).ready(function () {
                var cur_sym = $('#currency_id').find(":selected").attr("cur_sym");
                document.getElementById("cur_sym1").innerHTML = cur_sym;
                document.getElementById("cur_sym2").innerHTML = cur_sym;
                document.getElementById("cur_sym3").innerHTML = cur_sym;
                document.getElementById("cur_sym4").innerHTML = cur_sym;
                document.getElementById("cur_sym5").innerHTML = cur_sym;
            });


            $(document).ready(function () {

                $("#customer_id").on('change', function () {
                    var select = this.options[this.selectedIndex];
                    var select2 = this.options[this.selectedIndex];

                    var custid = select.getAttribute("cust_name");
                    var tel = select2.getAttribute("tel");

                    document.getElementById("readcust").innerHTML = custid;
                    document.getElementById("readtel").value = tel;

                });

                $("#currency_id").on('change', function () {
                    var select = this.options[this.selectedIndex];
                    var curid = select.getAttribute("cur_name");
                    document.getElementById("readcur").innerHTML = curid;

                    var cur_tax = select.getAttribute("cur_tax");
                    document.getElementById("qt_tax").value = cur_tax;

                    var cur_sym = select.getAttribute("cur_sym");
                    document.getElementById("cur_sym1").innerHTML = cur_sym;
                    document.getElementById("cur_sym2").innerHTML = cur_sym;
                    document.getElementById("cur_sym3").innerHTML = cur_sym;
                    document.getElementById("cur_sym4").innerHTML = cur_sym;
                    document.getElementById("cur_sym5").innerHTML = cur_sym;
                });

                $("#sales").on('change', function () {
                    var select = this.options[this.selectedIndex];
                    var custid = select.getAttribute("sale_name");
                    document.getElementById("readuser").innerHTML = custid;
                });


                var table = $('#myTable').DataTable({
                    "dom": '<"top"i>rt<"bottom"lp><"clear">',
                    "lengthMenu": [[5, 10, 20, 50, -1], [5, 10, 20, 50, "All"]],
                    "pagingType": "full_numbers",
                    select: {
                        select: true,
                        style: 'multi'
                    },
                    "language": {
                        "lengthMenu": 'Display <select>' +
                                '<option value="5">5</option>' +
                                '<option value="10">10</option>' +
                                '<option value="20">20</option>' +
                                '<option value="50">50</option>' +
                                '<option value="-1">All</option>' +
                                '</select> records',
                        "info": "Showing _START_ to _END_ of _TOTAL_ records"
                    },
                    'columnDefs': [
                        {
                            targets: 0,
                            data: null,
                            className: 'select-checkbox',
                            defaultContent: '',
                            checkboxes: {
                                selectRow: true,
                                selectAll: false
                            }
                        }
                    ],
                    'order': [[1, 'asc']]

                });

                $('#myTable tbody').on('click', 'tr', function () {
                    $(this).toggleClass('selected');
                });


            });
        </script>
        <div class="fullmain">
            <div id="sideB" class="sidebar">
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
            <script>
                function closeNav() {
                    document.getElementById("sideB").style.width = "0";
                    document.getElementById("main").style.marginLeft = "0";
                    document.getElementById("main").style.width = "100%";
                    document.getElementById("openbtn").style.display = "inline";
                    document.getElementById("closebtn").style.display = "none";
                    
                }
                function openNav() {
                    document.getElementById("sideB").style.width = "15%";
                    document.getElementById("main").style.marginLeft = "15%";
                    document.getElementById("main").style.width = "85%";
                    document.getElementById("closebtn").style.display = "inline";
                    document.getElementById("openbtn").style.display = "none";
                    
                }
            </script>
            <div id="main" class="mainpage">
                
                <button id="closebtn" class="closebtn" onclick="closeNav()">&#171; Hide Sidebar</button>
                <button id="openbtn" class="openbtn" onclick="openNav()">&#187; Show Sidebar</button>
                <h2 style=" text-align: left ;padding-left: 5px">Sales Order Entry</h2>
                <form  method="post" action="Insert_Sales_Order.jsp" class="normal_form">
                    <table class="myTable" align="center">
                        <!--                        <tr><th style="padding-left:40px;">ID</th>
                        -->                         <input hidden="" class=" form-control" type="text" name="od_qt_id" value="0"/><!--
                                                    <td></td>
                                                    <td></td>
                                                </tr>-->



                        <tr><th>Order No</th>
                            <td style="width: 35%;"><input class=" form-control" maxlength="50" type="text"  name="od_no" required/></td>
                            <td style="width: 2%;"></td>
                            <th>Sales</th>
                            <td><select id="sales" name="sales" required="" class="form-control" style="height:20%; display:inline; width: 100px;">
                                    <% while (resultUser.next()) {
                                    %>
                                    <option id="sale_id" sale_name="<%= resultUser.getString("User_NAME_EN")%>" value="<%= resultUser.getString("User_ID")%>"> <%= resultUser.getString("User_ID")%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                                <span id="readuser" style="display:inline;"></span>
                            </td>

                        </tr>


                        <tr><th>Order Date</th>
                            <td>
                                <input class=" form-control" type="date" name="od_odate"  id="quote_date" required onchange="setUntill_Date()"/>
                            </td>
                            <td></td>
                            <th>Status</th>
                            <td>
                                <select id="status" name="status" class="form-control" style="height:20%; display:inline; ">
                                    <option value="Awaiting order">Awaiting order</option>
                                    <option value="Order in processing">Order in processing</option>
                                    <option value="Order dispatched">Order dispatched</option>
                                    <option value="Order delivered">Order delivered</option>
                                    <option value="Order returned">Order returned</option>
                                </select>
                            </td>
                        </tr>
                        <script>
                            function setUntill_Date() {
                                var q_days = document.getElementById("quote_date").valueAsDate;
                                var u_date = new Date();
                                u_date.setDate(q_days.getDate() + 30);
                                document.getElementById("date_until").valueAsDate = u_date;
                            }
                        </script>    
                        

                        <tr><th>Customer</th>
                            <td>
                                <select id="customer_id" name="customer_id" required="" class="form-control"  style="height:20%; display:inline; width: 100px;">
                                    <% while (resultCus.next()) {
                                    %>
                                    <option id="cust_id" tel="<%= resultCus.getString("TEL")%>" cust_name="<%= resultCus.getString("CUST_NAME_EN")%>" value="<%= resultCus.getString("CUST_ID")%>"> <%= resultCus.getString("CUST_ID")%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                                <span id="readcust" style="display:inline;"></span>
                            </td>
                            <td></td>
                            <th>Payment Status</th>
                            <td>
                                <select id="P_status" name="P_status" class="form-control" style="height:20%; display:inline; ">
                                    <option value="Transaction incomplete">Transaction incomplete</option>
                                    <option value="Awaiting payment">Awaiting payment</option>
                                    <option value="Payment completed">Payment completed</option>
                                    <option value="Payment failed">Payment failed</option>
                                    <option value="Transaction incomplete (cancelled by system)">Transaction incomplete (cancelled by system)</option>
                                    <option value="Payment refunded">Payment refunded</option>
                                </select>
                            </td>
                        </tr>


                        <tr><th>Contact</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="contact" /></td>
                            <td></td>
                            <th>Contact Tel.</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="contact_tel" id="readtel"/></td>
                        </tr>

                        <tr><th>Subject</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="subject" required/></td>
                            <td></td>
                            <th>Delivery Date</th>
                            <td><input class=" form-control"  type="date" name="od_delivery_date"/></td>
                        </tr>

                        <tr><th>Comment</th>
                            <td><input class=" form-control" maxlength="50" type="text" name="comment" /></td>
                            <td></td>
                            <th>Payment Date</th>
                            <td><input  class=" form-control"  type="date" name="od_pay_date"/></td>
                        </tr>

                        <tr><th>Currency</th>
                            <td> <select id="currency_id" name="currency" required="" class="form-control" style="height:20%;width: 100px; display:inline;" onclick="tax()" >
                                    <%
                                        while (resultCur.next()) {
                                    %>
                                    <option id="cur_id" cur_sym="<%= resultCur.getString("CRR_SYM")%>" cur_tax="<%= resultCur.getString("CRR_TAX")%>" cur_name="<%= resultCur.getString("CRR_NAME")%>" value="<%= resultCur.getString("CRR_ID")%>" > <%= resultCur.getString("CRR_ID")%> </option>
                                    <%
                                        }
                                    %>
                                </select>
                                <span id="readcur" style="display:inline;"></span>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <br>
                    <table id="Table_price" class="table table-bordered" style="width:99%;" align="center">
                        <thead>
                            <br>
                            <INPUT style="width: 10%;margin-left: 0.5%" class="btn btn-success" type="button" value="+ Add rows" id="addrow" />

                            <tr>
                                <th style="width: 6%; text-align: center; ">Line</th>
                                <th style="width: 17%; text-align: center; ">Product</th>
                                <th style="width: 17%; text-align: center; ">Description</th>
                                <th style="width: 11%; text-align: center; ">Unit Price</th>
                                <th style="width: 4%; text-align: center; ">Quantity</th>
                                <th style="width: 11%; text-align: center; ">Amount</th>
                                <th style="width: 5%; text-align: center; ">Discount%</th>
                                <th style="width: 11%; text-align: center; ">Discount</th>
                                <th style="width: 11%; text-align: center; ">Amount After</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>

                    </table>
                    

                    <table style=" margin-right: 3%"  align="right" >
                        <tr>
                            <th>Total without discounts and taxses : </th>
                            <td style=" width: 30px"><input id="qt_amt_wotax" name="od_amt_wotax" value="0.00" readonly="" tabindex="-1" style="text-align: right;border: none;"></td>
                            <td><span id="cur_sym1"></span></td>
                        </tr>
                        <tr>
                            <th style=" text-align: right">Discount : </th>
                            <td style=" width: 30px"><input id="qt_discount" name="od_discount" value="0.00" readonly="" tabindex="-1" style="text-align: right;border: none;"></td>
                            <td><span id="cur_sym2"></span></td>
                        </tr>
                        <tr>
                            <th style=" text-align: right">Sub Total : </th>
                            <td style=" width: 30px"><input id="qt_subtotal" name="od_subtotal" value="0.00" readonly="" tabindex="-1" style="text-align: right;border: none;" ></td>
                            <td><span id="cur_sym3"></span></td>
                        </tr>
                        <tr>
                            <th style=" text-align: right">Tax : </th>
                            <td style=" width: 30px"><input id="qt_tax" name="od_tax" value="" readonly="" tabindex="-1" style="text-align: right;border: none;"></td>
                            <td>%</td>
                        </tr>
                        <tr>
                            <th style=" text-align: right">Vat : </th>
                            <td style=" width: 30px"><input id="qt_vat" name="od_vat" value="0.00" readonly="" tabindex="-1" style="text-align: right;border: none;"></td>
                            <td><span id="cur_sym4"></span></td>
                        </tr>
                        <tr>
                            <th style=" text-align: right">Total Amount : </th>
                            <td style=" width: 30px"><input id="qt_amt" name="od_amt" value="0.00" readonly="" tabindex="-1" style="text-align: right;border: none;"></td>
                            <td><span id="cur_sym5"></span></td>
                        </tr>
                        <input id="save_counter" name="save_counter" value="0" hidden>
                        <input id="save_line" hidden>
                    </table>

                    <table  style="margin-left:5%;width: 90%;" >
                        <tr><div class="form-submit">
                            <td><button style="float:left;" class="btn btn-danger" id="back" name="Back" type="button" onclick="goBack()">Cancel</button></td>
                            <td><button style="float:right;" class="btn btn-primary" id="submit" name="Save" type="submit" value="Save">Save</button></td>
                        </div>
                        </tr>
                    </table>         

                </form>
                <script type="text/javascript">
                    //Open popup for select product
                    var popup;
                    function SelectProduct(line) {
                        popup = window.open("form_select_product.jsp?line="+line, "Popup", "width=800,height=500");
                        popup.focus();
                    }
                    //Open popup for select description
                    function SelectDes(line) {
                        var des = document.getElementById("description"+line).value;
                        var desR1 = des.replace(/%/g,"%25").replace(/&/g,"%26");
                        var desR2 = desR1.replace(/\n/g,"%0A");
                        
                        popup = window.open("Description.jsp?line="+line+"&des="+desR2, "Popup", "width=800,height=600");
                        popup.focus();
                    }
                    //Alert when no product data and click Save
                    function alertconfirm(){
                        var count = parseInt(document.getElementById("save_counter").value);
                        for(var i = 1 ; i<=count ;i++){ 
                            var qt_id  = document.getElementById("selectPro"+i).value;
                            if(qt_id === ""){
                                alert("Please Select Product in line "+i);
                                return false;
                                break;
                                }
                        }
                        return true;
                    }
                    //Delete row table_price
                    function del_line(r){
                        var count = parseInt(document.getElementById("save_counter").value);
                        var i = r.parentNode.parentNode.rowIndex;
                        document.getElementById("Table_price").deleteRow(i);
//                        var realnumber = (i-1);
                        var round = count - i;
                        for(var x = 1;x <= round;x++){
//                            var countnumber = (i+x)-1;
                            var countnumber = i+x;
                            document.getElementById("line"+countnumber).setAttribute("name", "line"+(countnumber-1));
                            document.getElementById("line"+countnumber).setAttribute("value",(countnumber-1));
                            document.getElementById("line"+countnumber).setAttribute("id", "line"+(countnumber-1));
                                                            
                            document.getElementById("selectPro"+countnumber).setAttribute("name", "product"+(countnumber-1));
                            document.getElementById("selectPro"+countnumber).setAttribute("id", "selectPro"+(countnumber-1));
                            document.getElementById("selectPro_name"+countnumber).setAttribute("name", "product_name"+(countnumber-1));
                            document.getElementById("selectPro_name"+countnumber).setAttribute("id", "selectPro_name"+(countnumber-1));
                            document.getElementById("deshead"+countnumber).setAttribute("name", "deshead"+(countnumber-1));
                            document.getElementById("deshead"+countnumber).setAttribute("id", "deshead"+(countnumber-1));
                                
                            document.getElementById("description"+countnumber).setAttribute("onclick", "SelectDes("+(countnumber-1)+")");
                            document.getElementById("description"+countnumber).setAttribute("name", "description"+(countnumber-1));
                            document.getElementById("description"+countnumber).setAttribute("id", "description"+(countnumber-1));
                                
                            document.getElementById("unit_price"+countnumber).setAttribute("onchange", "changeinput("+(countnumber-1)+")");
                            document.getElementById("unit_price"+countnumber).setAttribute("name", "unit_price"+(countnumber-1));
                            document.getElementById("unit_price"+countnumber).setAttribute("id", "unit_price"+(countnumber-1));
                                
                            document.getElementById("quantity"+countnumber).setAttribute("onchange", "changeinput("+(countnumber-1)+")");
                            document.getElementById("quantity"+countnumber).setAttribute("name", "quantity"+(countnumber-1));
                            document.getElementById("quantity"+countnumber).setAttribute("id", "quantity"+(countnumber-1));
                                     
                            document.getElementById("amount"+countnumber).setAttribute("name", "amount"+(countnumber-1));
                            document.getElementById("amount"+countnumber).setAttribute("id", "amount"+(countnumber-1));
                                     
                            document.getElementById("discount_per"+countnumber).setAttribute("onchange", "discount_changeper("+(countnumber-1)+")");     
                            document.getElementById("discount_per"+countnumber).setAttribute("name", "discount_per"+(countnumber-1));
                            document.getElementById("discount_per"+countnumber).setAttribute("id", "discount_per"+(countnumber-1));
                                
                            document.getElementById("discountamt"+countnumber).setAttribute("onchange", "discount_changeamt("+(countnumber-1)+")");
                            document.getElementById("discountamt"+countnumber).setAttribute("name", "discountamt"+(countnumber-1));
                            document.getElementById("discountamt"+countnumber).setAttribute("id", "discountamt"+(countnumber-1));
                                     
                            document.getElementById("amount_after"+countnumber).setAttribute("name", "amount_after"+(countnumber-1));
                            document.getElementById("amount_after"+countnumber).setAttribute("id", "amount_after"+(countnumber-1));
                                
                            document.getElementById("selectProButton"+countnumber).setAttribute( "onclick", "SelectProduct("+(countnumber-1)+")" );
                            document.getElementById("selectProButton"+countnumber).setAttribute("id", "selectProButton"+(countnumber-1));
                            
                            document.getElementById("del_line"+countnumber).setAttribute("id", "del_line"+(countnumber-1));
                            
                        }
                        document.getElementById("save_counter").value = count-1;
                        var total_wo_tax = parseFloat(0);
                        var total_amount_after = parseFloat(0);
                        var total_discount = parseFloat(0);
                        var countloop = parseInt(document.getElementById("save_counter").value);
                        for (var y = 1; y <= countloop ; y++) {
                            total_wo_tax += parseFloat(document.getElementById("amount"+y).value.replace(/,/g,""));
                            total_amount_after += parseFloat(document.getElementById("amount_after"+y).value.replace(/,/g,""));
                            total_discount += parseFloat(document.getElementById("discountamt"+y).value.replace(/,/g,""));
                        }
                        document.getElementById("qt_amt_wotax").value = addCommas(total_wo_tax.toFixed(2));
                        document.getElementById("qt_discount").value = addCommas(total_discount.toFixed(2));
                        var qt_tax = parseFloat(document.getElementById("qt_tax").value);
                        var subtotal = parseFloat(total_wo_tax - total_discount);
                        var vat = parseFloat(subtotal * (qt_tax / 100));
                        var totalamount = parseFloat(subtotal + vat);
                        document.getElementById("qt_subtotal").value = addCommas(subtotal.toFixed(2));
                        document.getElementById("qt_vat").value = addCommas(vat.toFixed(2));
                        document.getElementById("qt_amt").value = addCommas(totalamount.toFixed(2));
                    }
                    function addCommas(nStr)
                    {
                        nStr += '';
                        x = nStr.split('.');
                        x1 = x[0];
                        x2 = x.length > 1 ? '.' + x[1] : '';
                        var rgx = /(\d+)(\d{3})/;
                        while (rgx.test(x1)) {
                            x1 = x1.replace(rgx, '$1' + ',' + '$2');
                        }
                        return x1 + x2;
                    }
                    //change input when put value in quantity,unitprice
                    function changeinput(ele) {
                                var unit_price = parseFloat(document.getElementById("unit_price" + ele).value.replace(/,/g,""));                                
                                var quantity = parseInt(document.getElementById("quantity"+ele).value);
                                var discount_per = parseFloat(document.getElementById("discount_per" + ele).value);
                                
                                if (quantity === 0 || unit_price === 0){
                                    
                                    document.getElementById("discount_per" + ele).value = 0;
                                    document.getElementById("discountamt"+ele).value = 0;
                                    document.getElementById("amount"+ele).value = 0;
                                    document.getElementById("amount_after"+ele).value = 0;
                                    var discountamt = parseFloat(document.getElementById("discountamt" + ele).value.replace(/,/g,""));
                                    
                                var amount_before = parseFloat(0);
                                var amount_after = parseFloat(0);
                                
                                amount_before = unit_price * quantity;
                                amount_after = amount_before - discountamt;
                                document.getElementById("amount"+ele).value = addCommas(amount_before.toFixed(2));
                                document.getElementById("unit_price"+ele).value = addCommas(unit_price.toFixed(2));
                                
                                var total_wo_tax = parseFloat(0);
                                var total_discount = parseFloat(0);
                                var count = document.getElementById("save_counter").value;
                                for (var i = 1; i <= count ; i++) {
                                      total_wo_tax += parseFloat(document.getElementById("amount"+i).value.replace(/,/g,""));
                                      total_discount += parseFloat(document.getElementById("discountamt"+i).value.replace(/,/g,""));
                                }
                                document.getElementById("qt_amt_wotax").value = addCommas(total_wo_tax.toFixed(2));
                                document.getElementById("qt_discount").value = addCommas(total_discount.toFixed(2));
                                
                                
                                document.getElementById("amount_after"+ele).value = addCommas(amount_after.toFixed(2));
                                
                                var qt_tax = parseFloat(document.getElementById("qt_tax").value);
                                var subtotal = parseFloat(total_wo_tax - total_discount);
                                var vat = parseFloat(subtotal * (qt_tax / 100));
                                var totalamount = parseFloat(subtotal + vat);
                                document.getElementById("qt_subtotal").value = addCommas(subtotal.toFixed(2));
                                document.getElementById("qt_vat").value = addCommas(vat.toFixed(2));
                                document.getElementById("qt_amt").value = addCommas(totalamount.toFixed(2));
                                    
                                }else{
                                
                                document.getElementById("discount_per" + ele).value = 0;
                                document.getElementById("discountamt"+ele).value = 0;
                                var discountamt = parseFloat(document.getElementById("discountamt" + ele).value.replace(/,/g,""));
                                document.getElementById("amount_after"+ele).value = 0;
                                var amount_before = parseFloat(0);
                                var amount_after = parseFloat(0);
                                
                                amount_before = unit_price * quantity;
                                amount_after = amount_before - discountamt;
                                document.getElementById("amount"+ele).value = addCommas(amount_before.toFixed(2));
                                document.getElementById("unit_price"+ele).value = addCommas(unit_price.toFixed(2));
                                
                                var total_wo_tax = parseFloat(0);
                                var total_discount = parseFloat(0);
                                var count = document.getElementById("save_counter").value;
                                for (var i = 1; i <= count ; i++) {
                                      total_wo_tax += parseFloat(document.getElementById("amount"+i).value.replace(/,/g,""));
                                      total_discount += parseFloat(document.getElementById("discountamt"+i).value.replace(/,/g,""));
                                }
                                document.getElementById("qt_amt_wotax").value = addCommas(total_wo_tax.toFixed(2));
                                document.getElementById("qt_discount").value = addCommas(total_discount.toFixed(2));
                                
                                
                                document.getElementById("amount_after"+ele).value = addCommas(amount_after.toFixed(2));
                                
                                var qt_tax = parseFloat(document.getElementById("qt_tax").value);
                                var subtotal = parseFloat(total_wo_tax - total_discount);
                                var vat = parseFloat(subtotal * (qt_tax / 100));
                                var totalamount = parseFloat(subtotal + vat);
                                document.getElementById("qt_subtotal").value = addCommas(subtotal.toFixed(2));
                                document.getElementById("qt_vat").value = addCommas(vat.toFixed(2));
                                document.getElementById("qt_amt").value = addCommas(totalamount.toFixed(2));
                                    
                                    
                                }
                        
                            
                    }
                    //change input when put value in discountamt
                     function  discount_changeamt(ele) {
                                var discount_per = parseInt(document.getElementById("discount_per" + ele).value);
                                var discountamt = parseFloat(document.getElementById("discountamt" + ele).value.replace(/,/g,""));
                                var quantity = parseInt(document.getElementById("quantity" + ele).value);
                                var unit_price = parseFloat(document.getElementById("unit_price" + ele).value.replace(/,/g,""));
                                var amount_before = unit_price * quantity;
                                var amount_after = amount_before - discountamt;
                                if(amount_before === 0){
                                    discount_per = 0;
                                }else{
                                    discount_per = ((discountamt / amount_before) * 100);
                                }
                                document.getElementById("discount_per" + ele).value = addCommas(discount_per.toFixed(2));
                                document.getElementById("amount_after" + ele).value = addCommas(amount_after.toFixed(2));
                                document.getElementById("discountamt"+ele).value = addCommas(discountamt.toFixed(2));

                                var total_wo_tax = parseFloat(0);
                                var total_discount = parseFloat(0);
                                var count = document.getElementById("save_counter").value;
                                for (var i = 1; i <= count ; i++) {
                                      total_wo_tax += parseFloat(document.getElementById("amount"+i).value.replace(/,/g,""));
                                      total_discount += parseFloat(document.getElementById("discountamt"+i).value.replace(/,/g,""));
                                }
                                document.getElementById("qt_amt_wotax").value = addCommas(total_wo_tax.toFixed(2));
                                document.getElementById("qt_discount").value = addCommas(total_discount.toFixed(2));
                                var qt_tax = parseFloat(document.getElementById("qt_tax").value);
                                var subtotal = parseFloat(total_wo_tax - total_discount);
                                var vat = parseFloat(subtotal * (qt_tax / 100));
                                var totalamount = parseFloat(subtotal + vat);
                                document.getElementById("qt_subtotal").value = addCommas(subtotal.toFixed(2));
                                document.getElementById("qt_vat").value = addCommas(vat.toFixed(2));
                                document.getElementById("qt_amt").value = addCommas(totalamount.toFixed(2));
                    }
                    
                    //change input when put value in discount_changeper
                    function  discount_changeper(ele) {
                                var quantity = parseInt(document.getElementById("quantity" + ele).value);
                                var unit_price = parseFloat(document.getElementById("unit_price" + ele).value.replace(/,/g,""));
                                var discountamt = parseFloat(document.getElementById("discountamt" + ele).value.replace(/,/g,""));
                                var discount_per = parseInt(document.getElementById("discount_per" + ele).value);
                                var amount_before = unit_price * quantity;
                                discountamt = amount_before * (discount_per / 100);
                                var amount_after = amount_before - discountamt;
                                
                                document.getElementById("amount_after" + ele).value = addCommas(amount_after.toFixed(2));
                                document.getElementById("discountamt" + ele).value = addCommas(discountamt.toFixed(2));
                                
                                var total_wo_tax = parseFloat(0);
                                var total_discount = parseFloat(0);
                                var count = document.getElementById("save_counter").value;
                                for (var i = 1; i <= count ; i++) {
                                      total_wo_tax += parseFloat(document.getElementById("amount"+i).value.replace(/,/g,""));
                                      total_discount += parseFloat(document.getElementById("discountamt"+i).value.replace(/,/g,""));
                                }
                                document.getElementById("qt_amt_wotax").value = addCommas(total_wo_tax.toFixed(2));
                                document.getElementById("qt_discount").value = addCommas(total_discount.toFixed(2));
                                var qt_tax = parseFloat(document.getElementById("qt_tax").value);
                                var subtotal = parseFloat(total_wo_tax - total_discount);
                                var vat = parseFloat(subtotal * (qt_tax / 100));
                                var totalamount = parseFloat(subtotal + vat);
                                document.getElementById("qt_subtotal").value = addCommas(subtotal.toFixed(2));
                                document.getElementById("qt_vat").value = addCommas(vat.toFixed(2));
                                document.getElementById("qt_amt").value = addCommas(totalamount.toFixed(2));
                    }
                   //change input when change tax(currency)
                    function  tax() {
                        var qt_tax = parseFloat(document.getElementById("qt_tax").value.replace(/,/g, ""));
                        var subtotal = parseFloat(document.getElementById("qt_subtotal").value.replace(/,/g, ""));
                        var vat = parseFloat(subtotal * (qt_tax / 100));
                        var totalamount = parseFloat(subtotal + vat);
                        
                        document.getElementById("qt_vat").value = addCommas(vat.toFixed(2));
                        document.getElementById("qt_amt").value = addCommas(totalamount.toFixed(2));

                    }
                   
                                    
                </script>

                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </div>
        </div>





        <div class="footer">
            <p align="center">2019 @Japan System(Thailand) Co.,Ltd.</p>
        </div>


        <script>
            function mydrop1() {
                var x = document.getElementById("drop1");
                if (x.className.indexOf("w3-show") == -1) {
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
            function myFunction1() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("myInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("myTable");
                tr = table.getElementsByTagName("tr");
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[2];
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }

            function deletet(cid) {


                var r = confirm("Are you sure you want to delete it?");
                if (r === true) {
                    document.location.href = "Del.jsp?CusID=" + cid;

                } else {
                    document.location.href = "Customer_Master.jsp";
                }

            }
            function goBack() {
                window.history.back();
            }
        </script>
        <!-- JS -->
        <!--        <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/nouislider/nouislider.min.js"></script>
                <script src="vendor/wnumb/wNumb.js"></script>
                <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
                <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
                <script src="js/main.js"></script>-->

        <%
            }
        %>
    </body>
</html>
