<%-- 
    Document   : Update_Customer
    Created on : May 8, 2019, 2:08:44 PM
    Author     : Jira
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="java.sql.*" %>  

<%
    try {
        String driverName = "com.mysql.jdbc.Driver";//Check mysql jdbc Driver add from Libraries.
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String dbName = "erp1";//Database Name
        String userId = "root";//Username
        String password = "1234";//Password

        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connect = null;//Create Connections

        connect = DriverManager.getConnection(connectionUrl + dbName, userId, password);//Connect Database

        String cus_name_en, cus_cd, name, type, indust, tel, email, website, st, su, city, region, stat, zip, country, taxid, date, time,ed_name;
        Integer cus_id;
        //getParameter from Edit Customer Page.
        cus_id = Integer.parseInt(request.getParameter("cus_id"));
        cus_cd = request.getParameter("Cust_Code");
        cus_name_en = request.getParameter("Cust_Name_EN");
        name = request.getParameter("Cust_Name"); 
        type = request.getParameter("Type");
        indust = request.getParameter("Indust");
        tel = request.getParameter("phone_number"); 
        email = request.getParameter("e_mail"); 
        website = request.getParameter("Website"); 
        st = request.getParameter("Address"); 
        su = request.getParameter("Suite"); 
        city = request.getParameter("City"); 
        region = request.getParameter("Region"); 
        stat = request.getParameter("Stat"); 
        zip = request.getParameter("Zip"); 
        country = request.getParameter("Country"); 
        taxid = request.getParameter("Taxid"); 

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");//set Date Format because the information taken from create_customer page is type String.
        LocalDate localDate = LocalDate.now();                            //but data type in database is date So the data must be converted from String to Date.
        date = dtf.format(localDate);

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");//set Time Format because the information taken from create_customer page is type String.
        time = sdf.format(cal.getTime());                       //but data type in database is time So the data must be converted from String to time.
        
        ed_name = String.valueOf(session.getAttribute("username_en"));//User who made a change.

        PreparedStatement pstmt = null; //create statement. 

        pstmt = connect.prepareStatement("UPDATE erp1.customer "
                + "SET CUST_CD = ?, CUST_NAME_EN = ?,CUST_NAME = ?,TYPE = ?,INDUST = ?,TEL = ?,EMAIL = ?,WEBSITE = ?,ADDR_ST = ?,ADDR_SU = ?,"
                + "ADDR_CITY = ?,ADDR_REG = ?,ADDR_STAT = ?,ADDR_ZIP = ?,ADDR_COUNT = ?,TAX_ID = ?,UPD_DATE = ?,UPD_TIME = ?,ED_NAME = ?"
                + "WHERE CUST_ID = ?;"); //sql update query. 

        pstmt.setString(1, cus_cd);
        pstmt.setString(2, cus_name_en);
        pstmt.setString(3, name);
        pstmt.setString(4, type);
        pstmt.setString(5, indust);
        pstmt.setString(6, tel);
        pstmt.setString(7, email);
        pstmt.setString(8, website);
        pstmt.setString(9, st);
        pstmt.setString(10, su);
        pstmt.setString(11, city);
        pstmt.setString(12, region);
        pstmt.setString(13, stat);
        pstmt.setString(14, zip);
        pstmt.setString(15, country);
        pstmt.setString(16, taxid);
        pstmt.setString(17, date);
        pstmt.setString(18, time);
        pstmt.setString(19, ed_name);
        pstmt.setInt(20, cus_id);

        pstmt.executeUpdate(); //execute query.

        connect.close();  //close connection.
        
        

        out.println("Update Successfully...!");// after insert record successfully message.

    } catch (Exception e) {
        out.println(e);
    }

%>
<meta http-equiv= refresh content= 1;URL=Customer_Master.jsp><!-- Return to Customer Master Page -->