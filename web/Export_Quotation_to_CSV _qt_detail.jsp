<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %> 

<%
    try {
        Connection conn = null;
        
        String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/";
        String dbName = "erp1";
        String userId = "root";
        String password = "1234";
        Integer i = 1;
        Statement stmt;

        String Content = new String("");

        String date, time, dateu, timeu;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.now();
        date = dtf.format(localDate);

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH_mm_ss");
        time = sdf.format(cal.getTime());

        String filename = "Quotation_CSV_" + date + "_" + time + ".csv";

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        String query = "select * from qt_head";
        stmt = conn.createStatement();

        ResultSet rs = stmt.executeQuery(query);
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=" + filename);
        try {
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(0xEF);
            outputStream.write(0xBB);
            outputStream.write(0xBF);
            
//            String outputResult = "QT ID, QT No, QT Customer Code, QT Customer Name EN, QT Customer Name, QT Customer TaxID, QT Contact, QT Contact Tel,"
//                    + " QT Name, QT Stats, QT Date,QT Valid, QT Company TAX, QT Currency ID, QT Currency Name, QT Currency Code, QT Currency SYM, QT Amount, QT Amount/Discount & TAX,QT Discount,"
//                    + " QT Sub Total, QT TAX, QT Create Date,QT Create Time, QT FLG1, QT Expiration Date,QT User ID,QT User Name EN,QT Comment, QT Valid Term,QT Delivery Term,QT Payment Term,"
//                    + " Registeration of Date, Registeration of Time, FLG1, Date of Update, Time of Update, FLG2\n";
//            String outputResult = "QT ID, QT No, QT Customer Code, QT Contact, QT Contact Tel,"
//                    + " QT Name, QT Stats, QT Date,QT Valid, QT Currency ID,QT Create Date,QT Create Time, QT Amount, QT Amount/Discount & TAX,QT Discount,"
//                    + " QT Sub Total, QT Vat, QT Expiration Date,QT User ID,QT Comment, QT Valid Term,QT Delivery Term,QT Payment Term,"
//                    + " Registeration of Date, Registeration of Time, FLG1, Date of Update, Time of Update, FLG2\n";
String outputResult = "QT ID, QT No, QT Customer Code, QT Contact, QT Contact Tel,"
                    + " QT Name, QT Stats, QT Date,QT Valid, QT Currency ID,QT Create Date,QT Create Time,"
                    + " QT Expiration Date,QT User ID,QT Comment, QT Valid Term,QT Delivery Term,QT Payment Term,QT Amount, QT Amount/Discount & TAX,QT Discount,"
                    + " QT Sub Total, QT Vat,Registeration of Date, Registeration of Time, FLG1, Date of Update, Time of Update, FLG2\n";
            
            outputStream.write(outputResult.getBytes());
            while (rs.next()) {
                outputStream.write(rs.getString(1).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(2).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(3).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(4).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(5).getBytes(StandardCharsets.UTF_8));
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(6).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(7).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(8).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(9).getBytes(StandardCharsets.UTF_8));
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(10).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(11).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(12).getBytes());
                outputStream.write(",".getBytes());
                //csv company tax not correct
//                outputStream.write(rs.getString(13).getBytes());
//                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(14).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(15).getBytes(StandardCharsets.UTF_8));
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(16).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(17).getBytes(StandardCharsets.UTF_8));
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(18).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(19).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(20).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(21).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(22).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(23).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(24).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(25).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(26).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(27).getBytes());
                outputStream.write(",".getBytes());
                if (rs.getString(28) == null) {
                    dateu = "null";
                } else {
                    dateu = rs.getString(28);
                }
                outputStream.write(dateu.getBytes());
                outputStream.write(",".getBytes());
                if (rs.getString(29) == null) {
                    timeu = "null";
                } else {
                    timeu = rs.getString(29);
                }
                outputStream.write(timeu.getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(30).getBytes(StandardCharsets.UTF_8));
                outputStream.write("\n".getBytes());
////                outputStream.write(rs.getString(31).getBytes(StandardCharsets.UTF_8));
////                outputStream.write(",".getBytes());
////                outputStream.write(rs.getString(32).getBytes(StandardCharsets.UTF_8));
////                outputStream.write(",".getBytes());
////                outputStream.write(rs.getString(33).getBytes());
////                outputStream.write(",".getBytes());
////                outputStream.write(rs.getString(34).getBytes());
////                outputStream.write(",".getBytes());
////                outputStream.write(rs.getString(35).getBytes());
////                outputStream.write(",".getBytes());
////                if (rs.getString(36) == null) {
////                    dateu = "null";
////                } else {
////                    dateu = rs.getString(36);
////                }
////                outputStream.write(dateu.getBytes());
////                outputStream.write(",".getBytes());
////                if (rs.getString(37) == null) {
////                    timeu = "null";
////                } else {
////                    timeu = rs.getString(37);
////                }
////                outputStream.write(timeu.getBytes());
////                outputStream.write(",".getBytes());
////                outputStream.write(rs.getString(38).getBytes());
////                outputStream.write("\n".getBytes());
            }
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }

    } catch (Exception e) {

        e.printStackTrace();

    }

%>