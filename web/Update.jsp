<%-- 
    Document   : update
    Created on : 22-Mar-2024, 1:14:17 pm
    Author     : Mani
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*,java.sql.*,java.text.*,java.util.*" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int fid = (int) session.getAttribute("fid");
            String status= request.getParameter("status1");
            Connection conn = null;
            PreparedStatement stmt = null;
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Freelancer", "root", "root");
            String sql = "Update addprojects set status = ? where fid=fid";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,status);
            stmt.executeUpdate();
            response.sendRedirect("fdisplay.jsp");
            }catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </body>
</html>
