<%-- 
    Document   : Description
    Created on : Jul 22, 2019, 10:35:21 AM
    Author     : pakasit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- title name-->
        <title>Description Page</title>
    </head>
    <body>
        <h1 align="center">Description</h1>
        <!-- line is line number , desfrommain is description detail from main page -->
        <% String line = request.getParameter("line"); 
           String desfrommain = request.getParameter("des"); 
        %>
        <!-- table -->
        <table align="center" style="width: 90%">
            <tr>
                <td ><textarea id="despopup" class="form-control" rows="20" ><%= desfrommain %></textarea></td>
            </tr>
            <tr><td>
                <button style="float:left; margin-left: 5%;" class="btn btn-danger" id="back" name="Back" type="button" onclick="closepop()">Cancel</button>
                <button style="float:right; margin-right: 5%;" class="btn btn-success" id="buttontable" onclick="sendback()">OK</button>
                </td></tr>
        </table>
        <!-- line from main page -->
        <input  hidden id="line" value='<%= line %>' >
        <script>
                //send value form popup to main page
                function sendback() {
                    var line = document.getElementById("line").value; //line from main page
                    var msg = document.getElementById("despopup").value;
                                if (window.opener !== null && !window.opener.closed) {
                                    var txtName = window.opener.document.getElementById("description"+line);
                                    txtName.value = msg.toString();
                                }
                    window.close();
                }
            //close popup
            function closepop() {
                    window.close();
                }
        </script>
    </body>
</html>
