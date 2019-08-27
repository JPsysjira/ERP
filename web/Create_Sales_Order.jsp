<%-- 
    Document   : Create_Sales_Order
    Created on : Jul 25, 2019, 1:43:06 PM
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


        
        <!------ Title ---------->
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
            #myTable{
                width: 95%

            }
            textarea{
                resize: none;
            }
            input[data-readonly] {
                pointer-events: none;
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
            
            Statement statementqt = null;
            ResultSet resultqt = null;
            

        %>
        <% try {

                connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                statement = connection.createStatement();
                statementCur = connection.createStatement();
                statementUser = connection.createStatement();
                

                String sql = "SELECT * FROM customer";
                String sql2 = "SELECT * FROM currency";
                String sql3 = "SELECT * FROM user_master";

                String sqlcus2 = "SELECT * FROM customer";
                String sqlcur2 = "SELECT * FROM currency";
                String sqluser2 = "SELECT * FROM user_master";

                resultCus = statement.executeQuery(sql);
                resultCur = statementCur.executeQuery(sql2);
                resultUser = statementUser.executeQuery(sql3);

                

        %>
        <script>
            //add row in Table_price
            $(document).ready(function () {
                var counter = 1;
                $("#addrow").on("click", function () {
                    var newRow = $("<tr>");
                    var cols = "";
                    
                    cols += '<td><input type="text" readonly style=" text-align: center" class="form-control" id="line' + counter + '" name="line' + counter + '" value="' + counter + '" /></td>';
                    cols += '<td><input type="text" class="form-control" id="selectPro'+counter+'" name="product' + counter + '" required="" data-readonly style="width:70%; display:inline;" /><input class="btn btn-default" id="selectProButton" type="button" value="+" onclick="SelectProduct('+counter+')" style="width:30%;height:30%; display:inline;" />';
                    cols += '<input type="text" class="form-control" id="selectPro_name' + counter + '" name="product_name' + counter + '" readonly /></td>';
                    cols += '<td><input type="text" class="form-control" id="deshead' + counter + '" name="deshead' + counter + '" placeholder="Description Head" value=""  />';
                    cols += '<textarea class="form-control" id="description' + counter + '" name="description' + counter + '" onclick="SelectDes('+counter+')" readonly /></textarea></td>';
                    cols += '<td><input type="text" class="form-control" id="unit_price' + counter + '" name="unit_price' + counter + '" onchange="changeinput('+counter+')" style="text-align: right;" value="0.00" /></td>';
                    cols += '<td><input type="text" class="form-control" id="quantity' + counter + '" name="quantity' + counter + '" onchange="changeinput('+counter+')" style="text-align: right;" value="0" /></td>';
                    cols += '<td><input type="text" class="form-control" id="amount' + counter + '" name="amount' + counter + '" style="text-align: right;" value="0.00" readonly /></td>';
                    cols += '<td><input type="text" class="form-control" id="discount_per' + counter + '" name="discount_per' + counter + '" onchange="discount_changeper('+counter+')" style="text-align: right;" value="0" /></td>';
                    cols += '<td><input type="text" class="form-control" id="discountamt' + counter + '" name="discountamt' + counter + '" onchange="discount_changeamt('+counter+')" style="text-align: right;" value="0.00" /></td>';
                    cols += '<td><input type="text" class="form-control" id="amount_after' + counter + '" name="amount_after' + counter + '" style="text-align: right;" value="0.00" readonly /></td>';
                    
                    
                    
                    newRow.append(cols);
                    $("#Table_price").append(newRow);
                    
                    document.getElementById("save_counter").value = counter;
//                    document.getElementById("line"+counter).value = counter;
                    counter++;
//                    document.getElementById("save_counter").value = counter;
//                    document.getElementById("save_line").value = line;
                    
                    
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
                        select: true
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
                        var rowdata = table.rows(this).data();
                        var qt_id = rowdata[0][1];
                        var qt_no = rowdata[0][2];
                        document.getElementById("Quotation_id").value = qt_id;
                        document.getElementById("Quotation_no").value = qt_no;
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
           
            <div id="main" class="mainpage">
                
                <br>
                <h2 style=" text-align: left ;padding-left: 5px">Sales Order Entry</h2>
                <br>
                
                <form  method="post" action="Create_Sales_Order_Step2.jsp" class="normal_form" onsubmit="return alertconfirm();">
                    <table class="" align="center" style="width:80%;">
                        <tr>
                            <th style=" text-align: right; width: 35%; padding-right: 10px;">Quotation ID</th>
                            <td><input style="display:inline;width: 75%;" class=" form-control" type="text"  id="Quotation_id" name="Quotation_id" readonly/><input class="btn btn-default" id="selectProButton" type="button" value="+" onclick="SelectQ()" style="width:25%; display:inline;" />
                            <td><button style=" float: right;" class="btn btn-primary btn-lg" id="Skip" name="Skip" type="button" onclick="location.href='Create_Sales_Order_Skip.jsp'">Skip</button></td>
                        </tr>
                        <tr>
                            <th style=" text-align: right;padding-right: 6px;">Quotation No</th>
                            <td><input style="display:inline;" class=" form-control" type="text"  id="Quotation_no" name="Quotation_no" readonly/></td>
                            
                        </tr>
                        
                    </table>
                        <input id="save_counter" name="save_counter" hidden>
                        <input id="save_line" hidden>
<!--                    <table align="right" border="1">
                        <tr>
                            <td><button style=" float: left;" class="btn btn-danger btn-lg" id="Skip" name="Skip" type="button" onclick="location.href='Create_Sales_Order_Skip.jsp'">Skip</button></td>
                        </tr>
                    </table>-->
<!--                    <button style=" width: 20%;float: right;" class="btn btn-danger btn-lg" id="Skip" name="Skip" type="button" onclick="location.href='Create_Sales_Order_Skip.jsp'">Skip</button>-->
                     <br>
                    <table  align="center" style=" width: 80%;">
                        <tr><div class="form-submit">
                            <td><button style=" float: left;" class="btn btn-danger btn-lg" id="Skip" name="Cancel" type="button" onclick="location.href='Sales_Order.jsp'">Cancel</button></td>
                            <td><button style=" float: right;" class="btn btn-success btn-lg" id="submit" name="Next" type="submit" value="Next">Next</button></td>
                        </div></tr>
                    </table>            

                </form>

                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

            </div>
        </div>
        <script type="text/javascript">
                    var popup;
                    //Open popup to select quotation
                    function SelectQ() {
                        popup = window.open("form_select_quotation.jsp", "Popup", "width=900,height=600");
                        popup.focus();
                    }
                    //Alert when no product data and click Save
                    function alertconfirm(){
                        var quotation_no = document.getElementById("Quotation_no").value;
                        if(quotation_no === ""){
                            alert("Please Select Quotation");
                            return false;
                        }else{
                            return true;
                        }
                    }
        </script>



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


