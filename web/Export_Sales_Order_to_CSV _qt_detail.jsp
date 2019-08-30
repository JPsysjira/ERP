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

        String filename = "Sales_Order_CSV_" + date + "_" + time + ".csv";

        Class.forName("com.mysql.jdbc.Driver").newInstance();

        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(connectionUrl + dbName, userId, password);
        String query = "select * from od_detail";
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
String outputResult = "QDD_ID, ODD_QD_ID, QDD_LINENO, QDD_ITEM_NO, QDD_DES_HEAD,"
                    + " QDD_DEST, QDD_UNIT_PRICE, QDD_QTY,QTD_AMT, QDD_DISC_PERCENT,QDD_DISC_AMOUNT,QDD_AMT_A_DISC,"
                    + " Registeration of Date, Registeration of Time, FLG1, Date of Update, Time of Update, FLG2\n";
            
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
                String des_cutline = rs.getString(6).replace("\r\n"," ");
                String des_cut = des_cutline.replace("-", "");
                outputStream.write(des_cut.replace(",","_").getBytes(StandardCharsets.UTF_8));
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
                outputStream.write(rs.getString(13).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(14).getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(15).getBytes(StandardCharsets.UTF_8));
                outputStream.write(",".getBytes());
                if (rs.getString(16) == null) {
                    dateu = "null";
                } else {
                    dateu = rs.getString(16);
                }
                outputStream.write(dateu.getBytes());
                outputStream.write(",".getBytes());
                if (rs.getString(17) == null) {
                    timeu = "null";
                } else {
                    timeu = rs.getString(17);
                }
                outputStream.write(timeu.getBytes());
                outputStream.write(",".getBytes());
                outputStream.write(rs.getString(18).getBytes());
              outputStream.write("\n".getBytes());
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