<%-- 
    Document   : Insert_Sales_Order
    Created on : Jun 4, 2019, 10:06:12 AM
    Author     : pakasit
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*" %>  
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>  

<%
    try {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String driverName = "com.mysql.jdbc.Driver";
//        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String dbName = "erp1";//Database Name
        String userId = "root";//Username
        String password = "1234";//Password

        //comment
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connect = null;//Create Connect
        Statement statement = null;//Used for storing sql commands.
        ResultSet resultSet = null;//keep data that has been processed.

//        connect = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password);//Connect Database

//        String item_no,item_eng,item_th,size,spec,cus_id,currency,standard_price,mt_unit_price,process_price,date,time;
        String od_no, od_cust_id, od_qt_id, od_contact, od_cont_tel, od_name, od_stats, od_odate, od_pay_stat, od_cur_id;
        String od_cre_date, od_cre_time, od_user_id;
        String od_comm, od_delivery_date, od_pay_date, reg_date, reg_time;

        String date, time;

        float od_amt, od_amt_wotax, od_discount, od_subtotal, od_vat;
        int counts = 0;

        counts = Integer.parseInt(request.getParameter("save_counter"));//save_counter is Number of Product

        if (counts == 0) {//If there is no product. return to Create Sale_Order Page. %>

<script>alert('Please Enter Product');</script><!--Message alert when there is no product-->
<meta http-equiv= refresh content= 1;URL=Sales_Order.jsp><!-- Return to Create Quotation Page -->

<%
    } else {

        //getParameter from Create Sales Order Step2 Page or Create Sales Order Skip Page.
        od_qt_id = request.getParameter("od_qt_id");
       
        od_no = request.getParameter("od_no");
       
        od_cust_id = request.getParameter("customer_id");

        od_contact = request.getParameter("contact");
        od_cont_tel = request.getParameter("contact_tel");
        od_name = request.getParameter("subject");
        od_stats = request.getParameter("od_status");
        od_pay_stat = request.getParameter("od_pay_stat");
        od_odate = request.getParameter("od_odate");
        od_cur_id = request.getParameter("currency");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");//set Date Format because the information taken from create_customer page is type String.
        LocalDate localDate = LocalDate.now();                            //but data type in database is date So the data must be converted from String to Date.
        date = dtf.format(localDate);
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");//set Time Format because the information taken from create_customer page is type String.          
        time = sdf.format(cal.getTime());                       //but data type in database is time So the data must be converted from String to time.
        od_cre_date = date;
        od_cre_time = time;
        od_user_id = request.getParameter("sales");
        od_comm = request.getParameter("comment");
        od_amt = Float.parseFloat(request.getParameter("od_amt").replace(",", ""));//replace "," with "" because in database type is float. float can't record ","(type int is the same).
        od_amt_wotax = Float.parseFloat(request.getParameter("od_amt_wotax").replace(",", ""));
        od_discount = Float.parseFloat(request.getParameter("od_discount").replace(",", ""));
        od_subtotal = Float.parseFloat(request.getParameter("od_subtotal").replace(",", ""));
        od_vat = Float.parseFloat(request.getParameter("od_vat").replace(",", ""));
        od_delivery_date = request.getParameter("od_delivery_date");
        od_pay_date = request.getParameter("od_pay_date");
        reg_date = date;
        reg_time = time;


        PreparedStatement pstmt = null, pstmtd = null,pstmts = null; //create statement. 

        pstmt = connect.prepareStatement("INSERT INTO erp1.od_head(OD_QT_ID,OD_NO,OD_CUST_ID,"
                + "OD_CONTACT,OD_CONT_TEL,OD_NAME,OD_ODATE ,OD_STATS,OD_PAY_STAT,OD_CUR_ID,"
                + "OD_CRE_DATE,"
                + "OD_CRE_TIME,OD_USER_ID,OD_COMM,OD_DELIVERY_DATE,OD_PAY_DATE,OD_AMT,OD_AMT_WOTAX,OD_DISCOUNT,OD_SUBTOTAL,OD_VAT,"
                + "REG_DATE,REG_TIME)VALUES"
                + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); //sql insert query.

        pstmt.setString(1, od_qt_id);
        pstmt.setString(2, od_no);
        pstmt.setString(3, od_cust_id);
        pstmt.setString(4, od_contact);
        pstmt.setString(5, od_cont_tel);
        pstmt.setString(6, od_name);
        pstmt.setString(7, od_odate);
        pstmt.setString(8, od_stats);
        pstmt.setString(9, od_pay_stat);       
        pstmt.setString(10, od_cur_id);
        pstmt.setString(11, od_cre_date);
        pstmt.setString(12, od_cre_time);
        pstmt.setString(13, od_user_id);
        pstmt.setString(14, od_comm);
        pstmt.setString(15, od_delivery_date);
        pstmt.setString(16, od_pay_date);
        pstmt.setFloat(17, od_amt);
        pstmt.setFloat(18, od_amt_wotax);
        pstmt.setFloat(19, od_discount);
        pstmt.setFloat(20, od_subtotal);
        pstmt.setFloat(21, od_vat);   
        pstmt.setString(22, reg_date);
        pstmt.setString(23, reg_time);
        pstmt.executeUpdate(); //execute query.

        //connect.close();  //close connection
//




        String odd_od_id;
        pstmtd = connect.prepareStatement("INSERT INTO erp1.od_detail(ODD_OD_ID,"
                + "ODD_LINENO,ODD_ITEM_NO,ODD_DES_HEAD,ODD_DEST,ODD_UNIT_PRICE,ODD_QTY,ODD_AMT,ODD_DISC_PERCENT,ODD_DISC_AMOUNT,ODD_AMT_A_DISC,REG_DATE,REG_TIME)VALUES"
                + "(?,?,?,?,?,?,?,?,?,?,?,?,?)"); //sql insert query.

        statement = connect.createStatement();
//                        String sql = "SELECT * FROM customer where FLG2 = 0";
//                        String sql = "select * from qt_head";
        String sql = "SELECT OD_ID FROM erp1.od_head ORDER BY OD_ID DESC LIMIT 0, 1;";//sql for selecting the latest OD_ID.
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {//while loop for selecting the latest OD_ID.
            odd_od_id = resultSet.getString("OD_ID");

//                        String sqluser = "select * from user_master";
            String odd_dest, odd_item_no, odd_des_head;
            int odd_qty, odd_lineno, counter;
            float odd_dis_amt, odd_dis_per, odd_amt, odd_amt_a_dis, odd_unit_per_price;
            counter = Integer.parseInt(request.getParameter("save_counter"));//save_counter is Number of Product
            for (int i = 1; i <= counter; i++) {//for loop for insert detail of product.
                odd_lineno = Integer.parseInt(request.getParameter("line" + i));
                odd_des_head = request.getParameter("deshead" + i);
                odd_dest = request.getParameter("description" + i);
                odd_item_no = request.getParameter("product" + i);
                odd_unit_per_price = Float.parseFloat(request.getParameter("unit_price" + i).replace(",", ""));//replace "," with "" because in database type is float. float can't record ","(type int is the same).
                odd_qty = Integer.parseInt(request.getParameter("quantity" + i));
                odd_amt = Float.parseFloat(request.getParameter("amount" + i).replace(",", ""));
                odd_dis_per = Float.parseFloat(request.getParameter("discount_per" + i).replace(",", ""));
                odd_dis_amt = Float.parseFloat(request.getParameter("discountamt" + i).replace(",", ""));
                odd_amt_a_dis = Float.parseFloat(request.getParameter("amount_after" + i).replace(",", ""));

                pstmtd.setString(1, odd_od_id);
                pstmtd.setInt(2, odd_lineno);
                pstmtd.setString(3, odd_item_no);
                pstmtd.setString(4, odd_des_head);
                pstmtd.setString(5, odd_dest);
                pstmtd.setFloat(6, odd_unit_per_price);
                pstmtd.setInt(7, odd_qty);
                pstmtd.setFloat(8, odd_amt);
                pstmtd.setFloat(9, odd_dis_per);
                pstmtd.setFloat(10, odd_dis_amt);
                pstmtd.setFloat(11, odd_amt_a_dis);
                pstmtd.setString(12, reg_date);
                pstmtd.setString(13, reg_time);
                pstmtd.executeUpdate();

            }

                
        }
        
        if(od_qt_id == "Null"){
           out.println("Insert Successfully...!");
        }
        else{
           int j = 1;
           pstmts = connect.prepareStatement("UPDATE erp1.qt_head SET QT_ORDER = ? where QT_ID = ?");

           pstmts.setInt(1, j);
           pstmts.setString(2, od_qt_id);
           pstmts.executeUpdate();

           out.println("Insert Successfully...!");// after insert record successfully message.

           }
        
    }
%>
<meta http-equiv=refresh content=1;URL=Sales_Order.jsp><!-- return to Quotation Page -->
<%
} catch (Exception e) {%>

<!--<script>alert('Please Enter Product');</script>
<meta http-equiv= refresh content= 1;URL=Create_Quotation.jsp>-->


<%
    out.println(e);
    }

%>

