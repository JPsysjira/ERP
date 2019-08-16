<%-- 
    Document   : RemoveS
    Created on : May 14, 2019, 5:03:22 PM
    Author     : Jira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script type="text/javascript">
            function noBack(){
                window.history.forward();
            }
             
            noBack();
            window.onload = noBack;
            window.onpageshow = function(evt) { 
                if (evt.persisted){ 
                    noBack();
                } 
            };
            window.onunload = function() { 
                void (0); 
            };
        </script>
     

        <title>Logout</title>
    </head>

    <body>
        <%
            
            
            session.removeAttribute("sUser");
            session.removeAttribute("username_en");
            session.removeAttribute("userid");
            String user,username,userid;
            
            user = String.valueOf(session.getAttribute("sUser"));
            
            username = String.valueOf(session.getAttribute("username_en"));
            userid = String.valueOf(session.getAttribute("userid"));
//            
//            out.print(user);
//            out.print(username);
//            out.print(userid);
              


        %> 
        <p>Please wait.....</p>
    </body>

</html>
<meta http-equiv= refresh content= 1;URL=Login.jsp>
