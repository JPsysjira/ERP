<%-- 
    Document   : LoginP
    Created on : May 13, 2019, 11:38:18 AM
    Author     : Jira
--%>

<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        String username = request.getParameter("username");
        String password = request.getParameter("pass");
        String strUser = request.getParameter("username");
        String userid, username_en;

        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
        mdAlgorithm.update(password.getBytes());

        byte[] digest = mdAlgorithm.digest();
        StringBuffer hexString = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            password = Integer.toHexString(0xFF & digest[i]);

            if (password.length() < 2) {
                password = "0" + password;
            }

            hexString.append(password);
        }

            //set session
            session.setAttribute("sUser", strUser);
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/erp1", "root", "1234");
            PreparedStatement pst = conn.prepareStatement("Select User_ID,USER_NAME_EN,USER_NAME,PASSWORD from erp1.user_master where USER_NAME=? and PASSWORD=?");
            pst.setString(1, username);
            pst.setString(2, hexString.toString());
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                userid = rs.getString("User_ID");
                username_en = rs.getString("USER_NAME_EN");
                session.setAttribute("userid", userid);
                session.setAttribute("username_en", username_en);
//            ServletContext sc = getServletContext();
//            RequestDispatcher rd = sc.getRequestDispatcher("/Mainmenu.jsp");
//            rd.forward(request,response);
%>
<meta http-equiv= refresh content= 1;URL=Mainmenu.jsp>
<%
} else {
%>
<script>alert('Username and Password Incorrect!');</script>
<meta http-equiv= refresh content= 1;URL=Login.jsp>

<%
        }
    }
    catch(Exception e){
         
        
}
%>
