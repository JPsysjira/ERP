<%-- 
    Document   : Create_Product
    Created on : May 9, 2019, 11:26:28 AM
    Author     : pakasit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>

        <!------ Script ---------->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>   
        <script src="js/dropdown.js" type="text/javascript"></script>
        
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
        <script>
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

            function chkNum(ele) {
//                                var num = parseFloat(ele.value);
//                                ele.value = addCommas(num.toFixed(2));
                var num = parseFloat(ele.value.replace(/,/g, ''));
                if (isNaN(num)) {
                    ele.value = "0.00";
                } else {
                    ele.value = addCommas(num.toFixed(2));
                }
            }
        </script>
        <script>
            $(document).ready(function () {
                $("#cus_id").on('change', function () {
                    var id = this.options[this.selectedIndex].id;
                    document.getElementById("readcus").innerHTML = id;
                });
            });
            $(document).ready(function () {
                $("#currency_id").on('change', function () {
                    var id = this.options[this.selectedIndex].id;
                    var sym = $(this).find('option:selected').attr("symbol");
                    document.getElementById("readcur").innerHTML = id;
                    document.getElementById("readsym1").innerHTML = sym;
                    document.getElementById("readsym2").innerHTML = sym;
                    document.getElementById("readsym3").innerHTML = sym;

                });
            });
            $(document).ready(function () {
                var idcust = $('#cus_id').find(":selected").attr("id");
                document.getElementById("readcus").innerHTML = idcust;

                var idcur = $('#currency_id').find(":selected").attr("id");
                var sym = $('#currency_id').find(":selected").attr("symbol");
                document.getElementById("readcur").innerHTML = idcur;
                document.getElementById("readsym1").innerHTML = sym;
                document.getElementById("readsym2").innerHTML = sym;
                document.getElementById("readsym3").innerHTML = sym;
            });


        </script>
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

        <!------ Meta ---------->

        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <%-- Dropdown --%>
        <link href="css/style5.css" rel="stylesheet" type="text/css"/>
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

        <!------ Link ---------->

        <title>Create Product</title>

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
                border: 1px solid; 
                border-color: #5a5255;
                border-left: none;
                border-bottom: none;
                border-top: none;
                border-right: none;
            }
            #myTable{
                width: 100%;
            }
            .fullmain{
                width: 100%;max-width: 100%; height: 650px; min-height: 100%; margin: 57px auto auto auto;
            }
            table{
                width: 40%;
            }
            th,td{
                padding :5px;
            }


            @media screen and (max-width: 650px) {
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
                }
                .fullmain{
                    padding: 0;
                }
                table{
                    width: 100%;
                }
                th,td{
                    padding :5px;
                }
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
                            out.print(username);
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

                <!------ Insert Data ---------->

                <h2 style=" text-align: left ;padding-left: 5px">Create/Edit Product</h2>
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
                    ResultSet resultSet = null;

                    Statement statementCur = null;
                    ResultSet resultCur = null;
                %>
                <% try {

                        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                        statement = connection.createStatement();
                        statementCur = connection.createStatement();

                        String sql = "SELECT * FROM customer where FLG2 = 0";
                        String sql2 = "SELECT * FROM currency";

                        resultSet = statement.executeQuery(sql);
                        resultCur = statementCur.executeQuery(sql2);

                %>

                <form  method="post" action="Insert_Product.jsp">
                    <table>
                        <!--                        <tr><th style="padding-left:40px;">item No.</th><td><input class="form-control" type="text" name="item_no" required onkeyup="this.setCustomValidity('Type in English or numbers 0-9')" pattern="[A-Za-z0-9]{1,30}" /></td></tr>-->
                        <tr><th style="padding-left:40px;">item No.</th><td><input class="form-control" type="text" name="item_no" required pattern="[A-Za-z0-9]{1,}" title="Please Type in English or Number" maxlength="30" /></td></tr>
                        <tr><th style="padding-left:40px;">item Name English</th><td><input class="form-control" type="text" name="item_eng" required pattern="[A-Za-z0-9]{1,}" title="Please Type in English or Number" maxlength="50" /></td></tr>
                        <tr><th style="padding-left:40px;">item Name Thai</th><td><input class="form-control" type="text" name="item_th" maxlength="30" /></td></tr>
                        <tr><th style="padding-left:40px;">Size</th><td><input class="form-control" type="text" name="size" maxlength="30" /></td></tr>
                        <!--                        <tr><th style="padding-left:40px;">Specification</th><td><input class="form-control" type="text" name="spec" maxlength="50" /></td></tr>-->
                        <tr><th style="padding-left:40px;">Specification</th><td><textarea style=" resize: none" class="form-control" type="text" name="spec" /></textarea></tr>
                        <tr><th style="padding-left:40px;">Customer ID</th>
                            <td>


                                <select id="cus_id" name="cus_id" class="form-control" style="height:20%;" >
                                    <% while (resultSet.next()) {%>
                                    <option id="<%=resultSet.getString("CUST_ID")%>" value="<%=resultSet.getString("CUST_ID")%> " ><%=resultSet.getString("CUST_NAME_EN") + " " + resultSet.getString("CUST_NAME")%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td> 
                            <td colspan="2"><span id="readcus"></span></td>


                        <tr><th style="padding-left:40px;">Currency</th>
                            <td colspan="2">
                                <select id="currency_id" name="currency" required="" class="form-control" style="height:20%;">
                                    <%
                                        while (resultCur.next()) {
                                    %>
                                    <option symbol="<%=resultCur.getString("CRR_SYM")%>" id="<%=resultCur.getString("CRR_SYM")%>"  value="<%=resultCur.getString("CRR_ID")%>" ><%=resultCur.getString("CRR_NAME") + " " + resultCur.getString("CURR_CD") + " " + resultCur.getString("CRR_SYM")%></option>
                                    <%
                                        }
                                    %>
                                </select>

                            <td colspan="2"><span id="readcur"></span></td>
                            </td>
                        </tr>
                        <tr><th style="padding-left:40px;">Standard Price</th><td colspan="2"><input class="form-control" style="text-align: right;" type="text" name="standard_price" required pattern="[0-9.,]{1,}" onchange="chkNum(this)" value="0" /></td><td colspan="2"><span id="readsym1"></span></td></tr>
                        <tr><th style="padding-left:40px;">Material Unit Price</th><td colspan="2"><input class="form-control" style="text-align: right;" type="text"  name="mt_unit_price" required pattern="[0-9.,]{1,}"  onchange="chkNum(this)" value="0"/></td><td colspan="2"><span id="readsym2"></span></td></tr>
                        <tr><th style="padding-left:40px;">Process Price</th><td colspan="2"><input class="form-control" style="text-align: right;" type="text" name="process_price" required pattern="[0-9.,]{1,}" onchange="chkNum(this)" value="0"/></td><td colspan="2"><span id="readsym3"></span></td></tr>

                        <tr>
                        <div class="form-submit">
                            <td><button class="btn btn-primary" id="submit" name="Save" type="submit" value="Save" style="float: right;">Save</button></td>
                            <td>
                                <button class="btn btn-danger" id="cancel" name="Cancel" type="button" onclick="window.location.href = 'Product_Master.jsp';">Cancel</button>
                            </td>
                        </div>
                        </tr>
                    </table>

                </form>

                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
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
