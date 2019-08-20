<%-- 
    Document   : form_select_quotation
    Created on : Jul 30, 2019, 9:20:14 AM
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


        <title>Select Quotation</title>

       
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
                    }
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
                           msgid += rowdata[i][0];
                           msgname += rowdata[i][1];
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
//                  var countinpage = 1;
//                    for(i=1;i<=counter;i++){
                        if (window.opener !== null && !window.opener.closed) {
                            //send value from popup to main page
                            var txtName = window.opener.document.getElementById("Quotation_id");
                            var txtName2 = window.opener.document.getElementById("Quotation_no");
                            txtName.value = msgid.toString();
                            txtName2.value = msgname.toString();
                        }
//                    }
                    window.close();
               } );
               
            });

        </script>
        
    </head>


    <body>
                <h2 style=" text-align: center ;padding-left: 5px">Select Quotation</h2>
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
                    
                    Statement statementqt = null;
                    ResultSet resultqt = null;
                %>
                <%
                    try {
                        connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
                        
                        statementqt = connection.createStatement();
                        String sqlqt = "select * from erp1.qt_head "
                                + "INNER JOIN `erp1`.`customer` customer ON qt_head.`QT_CUST_ID` = customer.`CUST_ID` "
                                + "INNER JOIN `erp1`.`user_master` userm ON qt_head.`QT_USER_ID` = userm.`USER_ID`  "
                                + "where qt_head.`FLG2` = 0;";
                        resultqt = statementqt.executeQuery(sqlqt);
                %>
                <table class="table table-bordered" id="myTable">
                    <thead>
                        <tr>
                            <th style="text-align: center;">Quotation ID</th>
                            <th style="text-align: center;">Quotation No</th>
                            <th style="text-align: center;">Customer Name EN</th>
                            <th style="text-align: center;">Quote Name</th>
                            <th style="text-align: center;">Sales</th>
                            <th style="text-align: center;">Amount</th>
                            <th style="text-align: center;">Create</th>
                            <th style="text-align: center;">Expired</th>
                        </tr>
                    </thead >

                    <tbody> 

                        <%
                            while (resultqt.next()) {
                        %>
                        <tr>
                            <td><%=resultqt.getString("QT_ID")%></td>
                            <td><%=resultqt.getString("QT_NO")%></td>
                            <td><%=resultqt.getString("CUST_NAME")%></td>
                            <td><%=resultqt.getString("QT_NAME")%></td>
                            <td><%=resultqt.getString("USER_NAME_EN")%></td>
                            <% SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
                                String creDate = formatter.format(resultqt.getDate("QT_DATE"));
                                String expireDate = formatter.format(resultqt.getDate("QT_VALID"));
                                DecimalFormat formatcomma = new DecimalFormat("#,##0.00");
                                float qt_amt = resultqt.getFloat("QT_AMT");
                                String stramt = formatcomma.format(qt_amt);
                                
                            %>
                            <td><%out.print(stramt);%></td>
                            <td><% out.print(creDate.toString()); %></td>
                            <td><% out.print(expireDate.toString()); %></td>
                        </tr>

                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
<!--                    <input type='text' id='sel_pro' />-->
                
                    <button style="float:right; margin-right: 5%;" class="btn btn-success" id="buttontable">Select</button>
                <!--<input type="button" value="Select" onclick="SetName();" />-->
                <% String count = request.getParameter("count"); 
                    String line = request.getParameter("line"); 
                %>
                <input  hidden id="count" value='<%= count %>' >
                <input  hidden id="line" value='<%= line %>' >
    </body>


</html>


