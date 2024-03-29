<%-- 
    Document   : Update_Product
    Created on : May 13, 2019, 4:47:21 PM
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
try
{ 
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String driverName = "com.mysql.jdbc.Driver";//Check mysql jdbc Driver add from Libraries.
	String dbName = "erp1";//DataBase Name.
	String userId = "root";//Username.
	String password = "1234";//Password.
    
	
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
        Connection connect = null;//Create Connection
        
        
//        connect = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName+"?useUnicode=yes&characterEncoding=UTF-8",userId, password);//Connect Database
        
        

 
        String item_no,item_eng,item_th,size,spec,date,time;
        Integer cus_id,currency,flg1;
        Float  standard_price, mt_unit_price, process_price;
        
        
        //getParameter from Edit Product Page.
        item_no = request.getParameter("item_no");  
        item_eng = request.getParameter("item_eng");
        item_th = request.getParameter("item_th");
        size = request.getParameter("size"); 
        spec = request.getParameter("spec");
        cus_id = Integer.parseInt(request.getParameter("customer_id"));
        currency = Integer.parseInt(request.getParameter("cur_id"));
        standard_price = Float.parseFloat(request.getParameter("standard_price").replace(",",""));//replace "," with "" because in database type is float. float can't record ","(type int is the same).
        mt_unit_price = Float.parseFloat(request.getParameter("mt_unit_price").replace(",",""));
        process_price = Float.parseFloat(request.getParameter("process_price").replace(",",""));
        flg1 = Integer.parseInt("1");
        
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");//set Date Format because the information taken from create_customer page is type String.
        LocalDate localDate = LocalDate.now();                            //but data type in database is date So the data must be converted from String to Date.
        date = dtf.format(localDate);

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");//set Time Format because the information taken from create_customer page is type String.
        time = sdf.format(cal.getTime() );                      //but data type in database is time So the data must be converted from String to time.

        PreparedStatement pstmt=null; //create statement. 

        pstmt=connect.prepareStatement("UPDATE erp1.product "
          + "SET ITEM_NAME_EN = ?,ITEM_NAME_TH = ?,SIZE = ?,SPEC = ?,CUST_ID = ?,CURR_ID=?,ST_PRICE = ?,MT_UNIT_PRICE = ?,PROC_PRICE = ?,"
          + "UPD_DATE = ?,UPD_TIME = ?,FLG1=? WHERE ITEM_NO = ?;");//sql update query. 
        
        pstmt.setString(1,item_eng); 
        pstmt.setString(2,item_th); 
        pstmt.setString(3,size); 
        pstmt.setString(4,spec); 
        pstmt.setInt(5,cus_id);
        pstmt.setInt(6,currency);
        pstmt.setFloat(7,standard_price); 
        pstmt.setFloat(8,mt_unit_price); 
        pstmt.setFloat(9,process_price); 
        pstmt.setString(10,date); 
        pstmt.setString(11,time);
        pstmt.setInt(12,flg1);
        pstmt.setString(13,item_no);
        
        
        pstmt.executeUpdate(); //execute query

        connect.close();  //close connection 

        out.println("Update Successfully...!");// after insert record successfully message

        

      }
      catch(Exception e)
      {
       out.println(e);
        
      }

      %>
      <meta http-equiv=refresh content=1;URL=Product_Master.jsp><!-- Return to Product Master Page -->