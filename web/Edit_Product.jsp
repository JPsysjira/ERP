<%-- 
    Document   : Edit_Product
    Created on : May 10, 2019, 3:43:12 PM
    Author     : pakasit
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>

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
        
        <link rel="shortcut icon" type="image/x-icon" href="image/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300|Roboto" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <%-- Dropdown --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="css/style5.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <%-- Editpage --%>
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="js/dropdown.js" type="text/javascript"></script>
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">

        <!-- title name -->
        <title>Edit Product</title>

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
                border: 1px solid; 
                border-color: #5a5255;
                border-left: none;
                border-bottom: none;
                border-top: none;
                border-right: none;
            }

            .fullmain{
                width: 100%;max-width: 100%; height: 650px; min-height: 100%; margin: 57px auto auto auto;
            }
            table{
                width: 50%;
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
                    width: 100%
                }
            }



        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>


    <body>
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
                request.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");

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
                Statement s = null;
                ResultSet resultSet = null;

                connect = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                s = connect.createStatement();

                String strProductID = request.getParameter("ProID");

                String item_no, item_eng, item_th, size, spec, new_cus_id;
//                Float  standard_price, mt_unit_price, process_price;
                Double standard_price, mt_unit_price, process_price;
                Integer cus_id, currency;
                PreparedStatement pstmt = null; //create statement 

                pstmt = connect.prepareStatement("select * from erp1.product where ITEM_NO=?"); //sql insert query 
                pstmt.setString(1, strProductID);

                ResultSet rs = pstmt.executeQuery(); // execute query store in resultset object rs.

                ///////////////////////////////////////////////////
                Statement statementcust = null;
                Statement statementCur = null;

                statementcust = connect.createStatement();
                statementCur = connect.createStatement();

                String sql = "SELECT * FROM customer";
                String sql2 = "SELECT * FROM currency";

                ResultSet resultcust = null;
                ResultSet resultCur = null;

                resultcust = statementcust.executeQuery(sql);
                resultCur = statementCur.executeQuery(sql2);

                ///////////////////////////////////////////////////
                while (rs.next()) {
                    item_no = rs.getString(1);
                    item_eng = rs.getString(2);
                    item_th = rs.getString(3);
                    size = rs.getString(4);
                    spec = rs.getString(5);
                    cus_id = rs.getInt(6);
                    currency = rs.getInt(7);

                    DecimalFormat formatter = new DecimalFormat("#,##0.00");
                    standard_price = rs.getDouble(8);
                    mt_unit_price = rs.getDouble(9);
                    process_price = rs.getDouble(10);

                    String new_standard_price = formatter.format(standard_price);
                    String new_mt_unit_price = formatter.format(mt_unit_price);
                    String new_process_price = formatter.format(process_price);

                    Statement stwhereCus = null;
                    stwhereCus = connect.createStatement();
                    String sqlwhereCus = "SELECT * FROM customer where CUST_ID=" + cus_id;
                    ResultSet resultwhereCus = null;
                    resultwhereCus = stwhereCus.executeQuery(sqlwhereCus);

                    Statement stwhereCur = null;
                    stwhereCur = connect.createStatement();
                    String sqlwhereCur = "SELECT * FROM currency where CRR_ID=" + currency;
                    ResultSet resultwhereCur = null;
                    resultwhereCur = stwhereCur.executeQuery(sqlwhereCur);


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
                <h2 style=" text-align: left ;padding-left: 5px">Create/Edit Product</h2>


                <form  method="post" action="Update_Product.jsp">
                    <table >
                        <input type="hidden" name="cus_id" value="">
                        <tr><th style="padding-left:40px;">item No.</th><td><input class="form-control" type="text" name="" required="" value="<%=item_no%>" disabled /><input type="hidden" name="item_no" value="<%=item_no%>"/></td></tr>
                        <tr><th style="padding-left:40px;">item Name English</th><td><input class="form-control" type="text" name="item_eng" value="<%=item_eng%>" maxlength="30"/></td></tr>
                        <tr><th style="padding-left:40px;">item Name Thai</th><td><input class="form-control" type="text" name="item_th" value="<%=item_th%>" maxlength="30"/></td></tr>
                        <tr><th style="padding-left:40px;">Size</th><td><input type="text"class="form-control" name="size" value="<%=size%>" maxlength="30"/></td></tr>
                        <tr><th style="padding-left:40px;">Specification</th><td><input class="form-control" type="text" name="spec" value="<%=spec%>" maxlength="50"/></td></tr>
                        <th style="padding-left:40px;">Customer ID</th>
                        <td colspan="2">
                            
                            <script>
                                //set default page
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


                            <select id="cus_id" name="customer_id" required="" class="form-control" style="height:20%;" >
                                <% while (resultwhereCus.next()) {%>
                                <option id="<%=resultwhereCus.getString("CUST_ID")%>" value="<%=resultwhereCus.getString("CUST_ID")%>" selected hidden><%=resultwhereCus.getString("CUST_NAME_EN") + " " + resultwhereCus.getString("CUST_NAME")%></option>
                                <% } %>

                                <% while (resultcust.next()) {%>
                                <option id="<%=resultcust.getString("CUST_ID")%>" value="<%=resultcust.getString("CUST_ID")%>"><%=resultcust.getString("CUST_NAME_EN") + " " + resultcust.getString("CUST_NAME")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>  
                        <td colspan="2" ><span id="readcus"></span></td>

                        <tr><th style="padding-left:40px;">Currency</th>
                            <td colspan="2">
                                <select id="currency_id" name="cur_id" required="" class="form-control" style="height:20%;" >
                                    <% while (resultwhereCur.next()) {%>
                                    <option symbol="<%=resultwhereCur.getString("CRR_SYM")%>" id="<%=resultwhereCur.getString("CRR_ID")%>" value="<%=resultwhereCur.getString("CRR_ID")%>" selected hidden><%=resultwhereCur.getString("CRR_NAME") + " " + resultwhereCur.getString("CURR_CD") + " " + resultwhereCur.getString("CRR_SYM")%></option>
                                    <% } %>
                                    <% while (resultCur.next()) {%>
                                    <option symbol="<%=resultCur.getString("CRR_SYM")%>" id="<%=resultCur.getString("CRR_ID")%>" value="<%=resultCur.getString("CRR_ID")%>"><%=resultCur.getString("CRR_NAME") + " " + resultCur.getString("CURR_CD") + " " + resultCur.getString("CRR_SYM")%></option>
                                    <% }%>
                                </select>
                            </td>
                            <td colspan="2"><span id="readcur"></span></td>
                        </tr>
                        <tr><th style="padding-left:40px;">Standard Price</th><td colspan="2"><input class="form-control" style="text-align: right;" type="text" name="standard_price" required pattern="[0-9.,]{1,}" onchange="chkNum(this)" class="inputprice" value="<%= new_standard_price%>"/></td><td colspan="2"><span id="readsym1"></span></td></tr>
                        <tr><th style="padding-left:40px;">Material Unit Price</th><td colspan="2"><input class="form-control" style="text-align: right;" type="text"  name="mt_unit_price" required pattern="[0-9.,]{1,}" onchange="chkNum(this)" class="inputprice " value="<%=new_mt_unit_price%>" /><td colspan="2"><span id="readsym2"></span></td></td></tr>
                        <tr><th style="padding-left:40px;">Process Price</th><td colspan="2"><input class="form-control" style="text-align: right;" type="text" name="process_price" required pattern="[0-9.,]{1,}" onchange="chkNum(this)" class="inputprice" value="<%=new_process_price%>"/></td><td colspan="2"><span id="readsym3"></span></td></tr>
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
                        }
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
            //code for number add comma and check number or not
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
//              var num = parseFloat(ele.value);
//              ele.value = addCommas(num.toFixed(2));
                var num = parseFloat(ele.value.replace(/,/g, ''));
                if (isNaN(num)) {
                    ele.value = "0.00";
                } else {
                    ele.value = addCommas(num.toFixed(2));
                }
            }
        </script>
        <!-- JS -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/nouislider/nouislider.min.js"></script>
        <script src="vendor/wnumb/wNumb.js"></script>
        <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="vendor/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="js/main.js"></script>

        <%
            }
        %>
    </body>
</html>
