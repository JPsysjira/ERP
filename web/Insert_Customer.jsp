<%-- 
    Document   : Insert_Customer
    Created on : May 7, 2019, 2:53:12 PM
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
try
{ 
        request.setCharacterEncoding("UTF-8");//
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
        Connection connect = null;

        
//        connect = DriverManager.getConnection(connectionUrl+dbName, userId, password);
        connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName+"?useUnicode=yes&characterEncoding=UTF-8",userId, password);//Connect Database.

//	s = connect.createStatement();

 
  String cus_code,cus_name_en,name,type,indust,tel,email,website,st,su,city,region,stat,zip,country,taxid,date,time,ed_name;
  
  //getParameter from Create Customer Page.
  cus_code = request.getParameter("Cust_Code"); 
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
 time = sdf.format(cal.getTime() );                      //but data type in database is time So the data must be converted from String to time.
 
 ed_name = String.valueOf(session.getAttribute("username_en"));//User who made a change.

  
  PreparedStatement pstmt=null; //create statement. 
  
  pstmt=connect.prepareStatement("INSERT INTO erp1.customer(CUST_CD,CUST_NAME_EN,CUST_NAME,TYPE,INDUST,TEL,EMAIL,WEBSITE,ADDR_ST,ADDR_SU,ADDR_CITY,ADDR_REG,ADDR_STAT,ADDR_ZIP,ADDR_COUNT,TAX_ID,REG_DATE,REG_TIME,ED_NAME)VALUES"
          + "               (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); //sql insert query .
  
  pstmt.setString(1,cus_code); 
  pstmt.setString(2,cus_name_en); 
  pstmt.setString(3,name); 
  pstmt.setString(4,type); 
  pstmt.setString(5,indust); 
  pstmt.setString(6,tel); 
  pstmt.setString(7,email); 
  pstmt.setString(8,website); 
  pstmt.setString(9,st); 
  pstmt.setString(10,su); 
  pstmt.setString(11,city); 
  pstmt.setString(12,region); 
  pstmt.setString(13,stat); 
  pstmt.setString(14,zip); 
  pstmt.setString(15,country); 
  pstmt.setString(16,taxid); 
  pstmt.setString(17,date); 
  pstmt.setString(18,time);
  pstmt.setString(19,ed_name); 

  pstmt.executeUpdate(); //execute query.
  
  connect.close();  //close connection 
  out.println("Insert Successfully...!");// after insert record successfully message.
  
 
 
}
catch(Exception e)
{
 out.println(e);
}

%>
<meta http-equiv= refresh content= 1;URL=Customer_Master.jsp> <!-- Return to Customer Master Page -->


