<%-- 
    Document   : form_select_product
    Created on : Jun 17, 2019, 11:03:01 AM
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


        <title>Product Quotation</title>

       
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
        
        
<!--        <link type="text/css" href="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>-->

        <script type="text/javascript">

            $(document).ready(function () {

                var table = $('#myTable').DataTable({
//                    "dom": 'ltipr',
                    "dom": '<"top"if>rt<"bottom"lp><"clear">',
                    "lengthMenu": [[5, 10, 20, 50, -1], [5, 10, 20, 50, "All"]],
                    "pagingType": "full_numbers",
                    select: {
                        select:true
//                        style: 'multi'
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
                                selectAll:false
                             }
                        }
                     ],
                     'order': [[1, 'asc']]
                    
                }); 
                
                $('#myTable tbody').on( 'click', 'tr', function () {
                    $(this).toggleClass('selected');
                } );

                $('#buttontable').click( function () {
                    var rowdata = table.rows('.selected').data();     
                    var msgname = '',msgid = '';
                    var countforif = parseInt(rowdata.length -1);
                     for (var i = 0; i < rowdata.length; i++) {
                       if(rowdata.length===1){
                           msgid += rowdata[i][1];
                           msgname += rowdata[i][2];
                       }else{
                           if(i === countforif){
                                msgid += rowdata[i][1];   
                           }else{
                                msgid += rowdata[i][1]+",";
                           }
                       }
                       
                   }
//                    alert(msg);
//                    window.location.href = "Insert_Product_Quotation.jsp?selectPro=" + msg;
//                    document.getElementById('sel_pro').value=msg.toString();
//                   var countinpage = 1;
                    var line = document.getElementById("line").value;
//                    for(i=1;i<=counter;i++){
                        if (window.opener !== null && !window.opener.closed) {
                            //send value from popup to main page
                            var txtName = window.opener.document.getElementById("selectPro"+line);
                            var txtName2 = window.opener.document.getElementById("selectPro_name"+line);
                            txtName.value = msgid.toString();
                            txtName2.value = msgname.toString();
//                            countinpage++;
                        }
//                    }
                    window.close();
               } );
               
            });

        </script>
        
    </head>


    <body>
                <h2 style=" text-align: center ;padding-left: 5px">Select Product</h2>
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
                    
                    Statement statementCus = null;
                    ResultSet resultCus = null;

                    Statement statementCur = null;
                    ResultSet resultCur = null;
                %>
                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                        
                        statementCus = connection.createStatement();
                        statementCur = connection.createStatement();

                        String sqlcus = "SELECT * FROM customer";
                        String sqlcur = "SELECT * FROM currency";

                        resultCus = statementCus.executeQuery(sqlcus);
                        resultCur = statementCur.executeQuery(sqlcur);
                        
                        statement = connection.createStatement();
                        String sql = "SELECT * FROM product where FLG2 = 0";

                        resultSet = statement.executeQuery(sql);
                %>
                <table class="table table-bordered" id="myTable">
                    <thead>
                        <tr>
                            <th></th>
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
                            <td></td>
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
                        <%      }
                            }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                         %>
                    </tbody>
                </table>
<!--                    <input type='text' id='sel_pro' />-->
                    <button style="float:left; margin-right: 5%;" onclick="window.closed" class="btn btn-danger">Cancel</button>
                    <button style="float:right; margin-right: 5%;" class="btn btn-success" id="buttontable">Select</button>
                <!--<input type="button" value="Select" onclick="SetName();" />-->
                <% 
                    String count = request.getParameter("count"); 
                    String line = request.getParameter("line"); 
                %>
                <input  hidden id="count" value='<%= count %>' >
                <input  hidden id="line" value='<%= line %>' >
    </body>


</html>

