<%-- 
    Document   : Login.jsp
    Created on : 14-Mar-2024, 7:57:43?pm
    Author     : Mani
--%>

<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" session="true"%>

<%
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "Freelancer";
String driver = "com.mysql.jdbc.Driver";

try {
    Class.forName(driver);
    con = DriverManager.getConnection(url + db, "root", "root");
    String tables = request.getParameter("tables");
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    int cid = 0;
    String qry = "SELECT * FROM " + tables + " WHERE Username=? AND Password=?;";
    PreparedStatement ps = con.prepareStatement(qry);
    ps.setString(1, username);
    ps.setString(2, password);
    
    ResultSet rs = ps.executeQuery();

    if (tables.equals("freelancer")) {
        int fid = 0;
        if (rs.next()) {
            fid = rs.getInt(1); 
            session.setAttribute("fid", fid);
            out.println("Login successful!");
            out.println("<br/>");
            response.sendRedirect("fhome.html");
        } else {
            out.println("Invalid username or password!");
        }
    } else {
        if (rs.next()) {
            cid = rs.getInt(1); 
            session.setAttribute("cid", cid);
            out.println("Login successful!");
            out.println("<br/>");
            response.sendRedirect("chome.html");
        } else {
            out.println("Invalid username or password!");
        }
    }

    con.close();
} catch (Exception e) {
    e.printStackTrace();
    out.println("An error occurred while processing your request.");
} finally {
    try {
        if (con != null) {
            con.close();
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
%>
