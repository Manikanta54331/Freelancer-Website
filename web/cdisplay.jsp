<%-- 
    Document   : cdisplay
    Created on : 22-Mar-2024, 5:21:12 am
    Author     : Mani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*,java.sql.*,java.text.*,java.util.*" session="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Projects List</title>
    <link rel='stylesheet' type='text/css' href='displays.css'>
</head>
<body>
<header>
    <h1>Freelancer Platform</h1>
    <center><p><em>Track your projects</em></p></center>
    <div class="logout">
        <button id='logoutButton' style='position: fixed; top: 10px; right: 10px; padding: 10px; background-color: #f5f5f5; color: #3b3c36; cursor: pointer;' onclick="window.location.href='index.html'"><b>Logout</b></button>
    </div>       
</header>

<section class='hero'>
    <table align='center' border='1' id='tab'>
        <tr>
            <th>ID</th>
            <th>Project Name</th>
            <th>Project Description</th>
            <th>Project Budget(in Rupees)</th>
            <th>Project Duration(in Days)</th>
            <th>Project Deadline</th>
            <th>Freelancer Name</th>
            <th>Client Name</th>
            <th>Status</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        <% 
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Freelancer", "root", "root");

            int cid = (int) session.getAttribute("cid");
            String sql = "SELECT * FROM addprojects WHERE cid = cid";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            int i = 1;
            while (rs.next()) {
                out.println("<tr><td>" + i + "</td><td>" + rs.getString("projectName") + "</td><td>" + rs.getString("projectDescription") + "</td><td>" + rs.getString("projectBudget") + "</td><td>" + rs.getString("projectDuration") + "</td><td>" + rs.getString("projectDeadline") + "</td><td>" + rs.getString("fname") + "</td><td>" + rs.getString("cname") + "<td><form name='status' action='cupdate.jsp' method='post'><select name='status1'><option value='Assigned'>Assigned</option><option value='Ongoing'>Ongoing</option><option value='Completed'>Completed</option></select></td>" + "</td><td><a href='Update.jsp?id=" + rs.getInt("id") + "' style='text-decoration:none;'>Update</a></td><td><a href='DeleteUser?id=" + rs.getInt("id") + "' style='text-decoration:none;'>Delete</a></td></tr>");
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        %>
    </table>
</section>
</body>
</html>

