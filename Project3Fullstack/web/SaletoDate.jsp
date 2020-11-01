<%-- 
    Document   : index
    Created on : Oct 29, 2020, 1:40:52 AM
    Author     : hasan
--%>

<%@page import = "java.sql.*"%>
<%@page import = "java.io.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h1> Sales to Date</h1>
    <% 
        String url = "jdbc:oracle:thin:@129.7.240.3:1521:ORCL";
        
        Connection conn = DriverManager.getConnection(url, "QureshiH", "QureshiH#");
        Statement statement = conn.createStatement();
        ResultSet resultset = statement.executeQuery("SELECT P.ProductID, P.ProductName, SUM(O.OrderedQuantity) FROM Product P, Orderline O WHERE P.ProductID = O.ProductID GROUP BY P.ProductID, P.ProductName ORDER BY P.ProductID"); 
    %>
    <table border="1" bgcolor="ffffff" width ="50%" cellspacing="1" cellpadding="0" bordercolor="black" border="1" >
    <tr>
        <th bgcolor="00ffff"> <font size="2"/> Product ID</th>
        <th bgcolor="00ffff"> <font size="2"/> Product Description</th>
        <th bgcolor="00ffff"> <font size="2"/> Number of Times Ordered</th>
    </tr>
    <%while(resultset.next()){%>
    <tr>
        <td><font size="2"/><center><%=resultset.getString(1)%></center></td>
        <td><font size="2"/><center><%=resultset.getString(2)%></center></td>
        <td><font size="2"/><center><%=resultset.getString(3)%></center></td>
        </tr>
   <% }%>
    </table>
</html>
