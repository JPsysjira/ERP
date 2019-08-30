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
    Integer i = 1,j = 1;
    Statement stmt,stmt2;

    Class.forName(driver).newInstance();
    conn = DriverManager.getConnection(connectionUrl + dbName, userId, password);
    String query = "select * from od_head";
    String query2 = "select * from od_detail";
    stmt = conn.createStatement();
    stmt2 = conn.createStatement();
    
    ResultSet rs = stmt.executeQuery(query);
    ResultSet rs2 = stmt2.executeQuery(query2);
    
    try {

// create a small spreadsheet
        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet("Sheet1");
        HSSFSheet sheet2 = wb.createSheet("Sheet2");
        HSSFRow row = sheet.createRow(0);
        sheet.addMergedRegion(new CellRangeAddress(
                0, //first row (0-based)
                0, //last row (0-based)
                0, //first column (0-based)
                0 //last column (0-based)
        ));
        HSSFRow row2 = sheet2.createRow(0);
        sheet2.addMergedRegion(new CellRangeAddress(
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

        HSSFCell cell,cell2;
        row = sheet.createRow(0);
        cell = row.createCell(0);
        cell.setCellValue("OD_ID");
        cell = row.createCell(1);
        cell.setCellValue("OD_QT_ID");
        cell = row.createCell(2);
        cell.setCellValue("OD_NO");
        cell = row.createCell(3);
        cell.setCellValue("OD_CUST_ID");
        cell = row.createCell(4);
        cell.setCellValue("OD_CONTACT");
        cell = row.createCell(5);
        cell.setCellValue("OD_CONT_TEL");
        cell = row.createCell(6);
        cell.setCellValue("OD_NAME");
        cell = row.createCell(7);
        cell.setCellValue("OD_ODATE");
        cell = row.createCell(8);
        cell.setCellValue("OD_STATS");
        cell = row.createCell(9);
        cell.setCellValue("OD_PAY_STAT");
        cell = row.createCell(10);
        cell.setCellValue("OD_CUR_ID");
        cell = row.createCell(11);
        cell.setCellValue("OD_CRE_DATE");
        cell = row.createCell(12);
        cell.setCellValue("OD_CRE_TIME");
        cell = row.createCell(13);
        cell.setCellValue("OD_FLG1");
        cell = row.createCell(14);
        cell.setCellValue("OD_USER_ID");
        cell = row.createCell(15);
        cell.setCellValue("OD_COMM");
        cell = row.createCell(16);
        cell.setCellValue("OD_DELIVERY_DATE");
        cell = row.createCell(17);
        cell.setCellValue("OD_PAY_DATE");
        cell = row.createCell(18);
        cell.setCellValue("OD_AMT");
        cell = row.createCell(19);
        cell.setCellValue("OD Amount/Discount & TAX");
        cell = row.createCell(20);
        cell.setCellValue("OD Discount");
        cell = row.createCell(21);
        cell.setCellValue("OD Sub Total");
        cell = row.createCell(22);
        cell.setCellValue("OD Vat");
        cell = row.createCell(23);
        cell.setCellValue("Registeration of Date");
        cell = row.createCell(24);
        cell.setCellValue("Registeration of Time");
        cell = row.createCell(25);
        cell.setCellValue("FLG1");
        cell = row.createCell(26);
        cell.setCellValue("Date of Update");
        cell = row.createCell(27);
        cell.setCellValue("Time of Update");
        cell = row.createCell(28);
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

            i++;
        }
        //Sheet2
        row2 = sheet2.createRow(0);
        cell2 = row2.createCell(0);
        cell2.setCellValue("ODD_ID");
        cell2 = row2.createCell(1);
        cell2.setCellValue("ODD_OD_ID");
        cell2 = row2.createCell(2);
        cell2.setCellValue("ODD_LINENO");
        cell2 = row2.createCell(3);
        cell2.setCellValue("ODD_ITEM_NO");
        cell2 = row2.createCell(4);
        cell2.setCellValue("ODD_DES_HEAD");
        cell2 = row2.createCell(5);
        cell2.setCellValue("ODD_DEST");
        cell2 = row2.createCell(6);
        cell2.setCellValue("ODD_UNIT_PRICE");
        cell2 = row2.createCell(7);
        cell2.setCellValue("ODD_QTY");
        cell2 = row2.createCell(8);
        cell2.setCellValue("ODD_AMT");
        cell2 = row2.createCell(9);
        cell2.setCellValue("ODD_DISC_PERCENT");
        cell2 = row2.createCell(10);
        cell2.setCellValue("ODD_DISC_AMOUNT");
        cell2 = row2.createCell(11);
        cell2.setCellValue("ODD_AMT_A_DISC");
        cell2 = row2.createCell(12);
        cell2.setCellValue("Registeration of Date");
        cell2 = row2.createCell(13);
        cell2.setCellValue("Registeration of Time");
        cell2 = row2.createCell(14);
        cell2.setCellValue("FLG1");
        cell2 = row2.createCell(15);
        cell2.setCellValue("Date of Update");
        cell2 = row2.createCell(16);
        cell2.setCellValue("Time of Update");
        cell2 = row2.createCell(17);
        cell2.setCellValue("FLG2");
        

        while (rs2.next()) {

            row2 = sheet2.createRow(j);
            cell2 = row2.createCell(0);
            cell2.setCellValue(rs2.getString(1));
            cell2 = row2.createCell(1);
            cell2.setCellValue(rs2.getString(2));
            cell2 = row2.createCell(2);
            cell2.setCellValue(rs2.getString(3));
            cell2 = row2.createCell(3);
            cell2.setCellValue(rs2.getString(4));
            cell2 = row2.createCell(4);
            cell2.setCellValue(rs2.getString(5));
            cell2 = row2.createCell(5);
            cell2.setCellValue(rs2.getString(6));
            cell2 = row2.createCell(6);
            cell2.setCellValue(rs2.getString(7));
            cell2 = row2.createCell(7);
            cell2.setCellValue(rs2.getString(8));
            cell2 = row2.createCell(8);
            cell2.setCellValue(rs2.getString(9));
            cell2 = row2.createCell(9);
            cell2.setCellValue(rs2.getString(10));
            cell2 = row2.createCell(10);
            cell2.setCellValue(rs2.getString(11));
            cell2 = row2.createCell(11);
            cell2.setCellValue(rs2.getString(12));
            cell2 = row2.createCell(12);
            cell2.setCellValue(rs2.getString(13));
            cell2 = row2.createCell(13);
            cell2.setCellValue(rs2.getString(14));
            cell2 = row2.createCell(14);
            cell2.setCellValue(rs2.getString(15));
            cell2 = row2.createCell(15);
            cell2.setCellValue(rs2.getString(16));
            cell2 = row2.createCell(16);
            cell2.setCellValue(rs2.getString(17));
            cell2 = row2.createCell(17);
            cell2.setCellValue(rs2.getString(18));
            cell2 = row2.createCell(18);
            j++;
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
        %>
<!--        <meta http-equiv=refresh content=1;URL=Export_Quotation_to_Excel2.jsp>-->
        <%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
