<%-- 
    Document   : Progress
    Created on : Feb 27, 2024, 12:28:54 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Group" %>
<%@page import="dal.DAOGroups" %>
<%@page import="dal.DAOProgress" %>
<%@page import="model.Student" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
         <div>
            <%@include file="header.jsp"%>
        </div>
        <%
            int gr = (int) request.getAttribute("Gr");
            DAOProgress object = new DAOProgress();
            int slotN = object.loadNumberSlot(gr);
            pageContext.setAttribute("slot", slotN);
        %>
        <div    >
            Groups: 
            <select id="gr" onchange="Change()">
                <c:forEach var="i" items="${requestScope.GrLect}">
                    <option value="${i.getCodeG()}" <c:if test="${i.getCodeG() == requestScope.Gr}"> selected </c:if> >
                        ${i.getNameG()}
                    </option>
                </c:forEach>
            </select>
            
            <table border="1px">
                <tr>
                    <td> Name </td>
                    <td> Student Code </td>
                    <td colspan="<%= slotN%>" style="text-align: center">
                                    Marks
                    </td>
                </tr>
                
                <%
                     DAOGroups ob= new DAOGroups();
                     
                     ArrayList<Student> crs = ob.loadStudents(gr);
                    for(Student i : crs){
                    %>
                    <tr>
                        <td>
                            <%= i.getName() %>
                        </td>
                        <td>
                            <%= i.getMSSV() %>
                        </td>
                        <td>
                            
                        </td>
                            
                    </tr>    
                    <%
                        }
                    %>
                
            </table>
        </div>
        </div>  
    <script >
        function Change()
        {
            var gr = document.getElementById("gr").value;
            window.location.href="Marks?gr="+gr;
            
        }
    </script>
    
    </body>
</html>
