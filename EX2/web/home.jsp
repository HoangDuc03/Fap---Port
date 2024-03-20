<%-- 
    Document   : home
    Created on : Mar 13, 2024, 11:13:30 AM
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
        <h1>Login</h1>
        <form action="home" method="post">
            <div class="space">
                <label>UserName: </label><input type="text" name="user" value="admin">
            </div>
            <div class="space">
                <label>PassWord: </label><input type="password" name="password" value="admin">
            </div>
            <input type="submit" name="done" value="Login">
        </form>
    <c:if test="${requestScope.error != null}">
        <p style="color: red">${requestScope.error}</p>
    </c:if>
</body> 
</html>
