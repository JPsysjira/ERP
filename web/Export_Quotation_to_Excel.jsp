<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%> 
<%@page import="org.apache.poi.ss.util.CellRangeAddress"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="java.io.*" %>
<%

    Connection conn = null;
    
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "erp1";
    String userId = "root";
    String password = "1234";
    Integer i = 1;
    Statement stmt;

    Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(connectionUrl + dbName, userId, password);
    String query = "select * from qt_head";
    stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery(query);

    try {

// create a small spreadsheet
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet();
        HSSFRow row = sheet.createRow(0);
        sheet.addMergedRegion(new CellRangeAddress(
                0, //first row (0-based)
                0, //last row (0-based)
                0, //first column (0-based)
                0 //last column (0-based)
        ));

        String date, time;
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.now();
        date = dtf.format(localDate);

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("HH_mm_ss");
        time = sdf.format(cal.getTime());

        String filename = "Quotation_xls_" + date + "_" + time + ".xls";

        HSSFCell cell;
        row = sheet.createRow(0);
        cell = row.createCell(0);
        cell.setCellValue("QT ID");
        cell = row.createCell(1);
        cell.setCellValue("QT No");
        cell = row.createCell(2);
        cell.setCellValue("QT Customer Code");
        cell = row.createCell(3);
        cell.setCellValue("QT Customer Name EN");
        cell = row.createCell(4);
        cell.setCellValue("QT Customer Name");
        cell = row.createCell(5);
        cell.setCellValue("QT Customer TaxID");
        cell = row.createCell(6);
        cell.setCellValue("QT Contact");
        cell = row.createCell(7);
        cell.setCellValue("QT Contact Tel");
        cell = row.createCell(8);
        cell.setCellValue("QT Name");
        cell = row.createCell(9);
        cell.setCellValue("QT Stats");
        cell = row.createCell(10);
        cell.setCellValue("QT Date");
        cell = row.createCell(11);
        cell.setCellValue("QT Valid");
        cell = row.createCell(12);
        cell.setCellValue("QT Company Tax");
        cell = row.createCell(13);
        cell.setCellValue("QT Currency ID");
        cell = row.createCell(14);
        cell.setCellValue("QT Currency Name");
        cell = row.createCell(15);
        cell.setCellValue("QT Currency Code");
        cell = row.createCell(16);
        cell.setCellValue("QT Currency SYM");
        cell = row.createCell(17);
        cell.setCellValue("QT Amount");
        cell = row.createCell(18);
        cell.setCellValue("QT Amount/Discount & TAX");
        cell = row.createCell(19);
        cell.setCellValue("QT Discount");
        cell = row.createCell(20);
        cell.setCellValue("QT Sub Total");
        cell = row.createCell(21);
        cell.setCellValue("QT Tax");
        cell = row.createCell(22);
        cell.setCellValue("QT Create Date");
        cell = row.createCell(23);
        cell.setCellValue("QT Create Time");
        cell = row.createCell(24);
        cell.setCellValue("QT FLG1");
        cell = row.createCell(25);
        cell.setCellValue("QT Expiration Date");
        cell = row.createCell(26);
        cell.setCellValue("QT User ID");
        cell = row.createCell(27);
        cell.setCellValue("QT User Name EN");
        cell = row.createCell(28);
        cell.setCellValue("QT Comment");
        cell = row.createCell(29);
        cell.setCellValue("QT Valid Term");
        cell = row.createCell(30);
        cell.setCellValue("QT Delivery Term");
        cell = row.createCell(31);
        cell.setCellValue("QT Payment Term");
        cell = row.createCell(32);
        cell.setCellValue("Registeration of Date");
        cell = row.createCell(33);
        cell.setCellValue("Registeration of Time");
        cell = row.createCell(34);
        cell.setCellValue("FLG1");
        cell = row.createCell(35);
        cell.setCellValue("Date of Update");
        cell = row.createCell(36);
        cell.setCellValue("Time of Update");
        cell = row.createCell(37);
        cell.setCellValue("FLG2");


        while (rs.next()) {

            row = sheet.createRow(i);
            cell = row.createCell(0);
            cell.setCellValue(rs.getString(1));
            cell = row.createCell(1);
            cell.setCellValue(rs.getString(2));
            cell = row.createCell(2);
            cell.setCellValue(rs.getString(3));
            cell = row.createCell(3);
            cell.setCellValue(rs.getString(4));
            cell = row.createCell(4);
            cell.setCellValue(rs.getString(5));
            cell = row.createCell(5);
            cell.setCellValue(rs.getString(6));
            cell = row.createCell(6);
            cell.setCellValue(rs.getString(7));
            cell = row.createCell(7);
            cell.setCellValue(rs.getString(8));
            cell = row.createCell(8);
            cell.setCellValue(rs.getString(9));
            cell = row.createCell(9);
            cell.setCellValue(rs.getString(10));
            cell = row.createCell(10);
            cell.setCellValue(rs.getString(11));
            cell = row.createCell(11);
            cell.setCellValue(rs.getString(12));
            cell = row.createCell(12);
            cell.setCellValue(rs.getString(13));
            cell = row.createCell(13);
            cell.setCellValue(rs.getString(14));
            cell = row.createCell(14);
            cell.setCellValue(rs.getString(15));
            cell = row.createCell(15);
            cell.setCellValue(rs.getString(16));
            cell = row.createCell(16);
            cell.setCellValue(rs.getString(17));
            cell = row.createCell(17);
            cell.setCellValue(rs.getString(18));
            cell = row.createCell(18);
            cell.setCellValue(rs.getString(19));
            cell = row.createCell(19);
            cell.setCellValue(rs.getString(20));
            cell = row.createCell(20);
            cell.setCellValue(rs.getString(21));
            cell = row.createCell(21);
            cell.setCellValue(rs.getString(22));
            cell = row.createCell(22);
            cell.setCellValue(rs.getString(23));
             cell = row.createCell(23);
            cell.setCellValue(rs.getString(24));
             cell = row.createCell(24);
            cell.setCellValue(rs.getString(25));
             cell = row.createCell(25);
            cell.setCellValue(rs.getString(26));
             cell = row.createCell(26);
            cell.setCellValue(rs.getString(27));
             cell = row.createCell(27);
            cell.setCellValue(rs.getString(28));
             cell = row.createCell(28);
            cell.setCellValue(rs.getString(29));
             cell = row.createCell(29);
            cell.setCellValue(rs.getString(30));
             cell = row.createCell(30);
            cell.setCellValue(rs.getString(31));
             cell = row.createCell(31);
            cell.setCellValue(rs.getString(32));
             cell = row.createCell(32);
            cell.setCellValue(rs.getString(33));
             cell = row.createCell(33);
            cell.setCellValue(rs.getString(34));
             cell = row.createCell(34);
            cell.setCellValue(rs.getString(35));
             cell = row.createCell(35);
            cell.setCellValue(rs.getString(36));
             cell = row.createCell(36);
            cell.setCellValue(rs.getString(37));
             cell = row.createCell(37);
            cell.setCellValue(rs.getString(38));
            

            i++;
        }

// write it as an excel attachment
        conn.close();
        ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
        wb.write(outByteStream);
        byte[] outArray = outByteStream.toByteArray();
        response.setContentType("application/ms-excel");
        response.setContentLength(outArray.length);
        response.setHeader("Expires:", "0"); // eliminates browser caching
        response.setHeader("Content-Disposition", "attachment; filename= " + filename);
        OutputStream outStream = response.getOutputStream();
        outStream.write(outArray);
        outStream.flush();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>