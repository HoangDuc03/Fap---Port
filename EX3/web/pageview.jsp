<%-- 
    Document   : pageview
    Created on : Mar 20, 2024, 12:42:42 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="home">Back to home</a>
        <br><!-- comment -->
        <div>
            View: ${requestScope.view}
        </div>
    </body>
</html>
