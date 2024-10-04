<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.Statement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Project</title>
<link rel="stylesheet" href="addProjects1.css">
</head>
<body>
<div class="container">
    <h1>Add Project</h1>
    
    <form id="addProjectForm" class="project-form" action="Project.jsp" method="POST">
        <input type="text" name="projectName" placeholder="Project Name" required>
        <textarea name="projectDescription" placeholder="Project Description" required></textarea>
        <input type="text" name="projectBudget" placeholder="Project Budget" required>
        <input type="text" name="projectDuration" placeholder="Project Duration" required>
        <input type="date" name="projectDeadline" placeholder="Project Deadline" required>
        <label for="role">Select a freelancer:</label>
        <select name="fname">
            <% 
            try {
                String url = "jdbc:mysql://localhost:3306/Freelancer";
                String user = "root";
                String password = "root";
                Connection conn = DriverManager.getConnection(url, user, password);
                Statement ps = conn.createStatement();
                ResultSet rs = ps.executeQuery("SELECT * FROM freelancer");
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("Name")%>"><%=rs.getString("Name")%></option>
            <% 
                int fid = rs.getInt(1); 
                session.setAttribute("fid", fid);
                }
                rs.close();
                ps.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } 
            %>
        </select>
        <button type="submit">Add Project</button>
    </form>
</div>
<script src="scripts.js"></script>
<script>
    document.getElementById('addProjectButton').addEventListener('click', function() {
        alert("Successfully added the project!");
        window.location.href = 'Project.jsp';
    });
</script>
</body>
</html>
