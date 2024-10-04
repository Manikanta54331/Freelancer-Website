<%@ page import="java.sql.*, java.io.*, javax.servlet.*" session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String url = "jdbc:mysql://localhost:3306/Freelancer";
    String user = "root";
    String password = "root";
    String projectName = request.getParameter("projectName");
    String projectDescription = request.getParameter("projectDescription");
    String projectBudget = request.getParameter("projectBudget");
    String projectDuration = request.getParameter("projectDuration");
    String projectDeadline = request.getParameter("projectDeadline");
    String fname = request.getParameter("fname");
    Connection conn = null;
    PreparedStatement ps = null;

    // Fetch session attributes
    int fid = (int) session.getAttribute("fid");
    int cid = (int) session.getAttribute("cid");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);
        String cname = "";
        String clientSql = "SELECT Name FROM clients WHERE cid = ?";
        ps = conn.prepareStatement(clientSql);
        ps.setInt(1, cid);
        ResultSet clientRs = ps.executeQuery();
        if (clientRs.next()) {
            cname = clientRs.getString("Name");
        }

        // Insert project details into the addprojects table
        String sql = "INSERT INTO addprojects (projectName, projectDescription, projectBudget, projectDuration, projectDeadline, fid, cid, fname, cname) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, projectName);
        ps.setString(2, projectDescription);
        ps.setString(3, projectBudget);
        ps.setString(4, projectDuration);
        ps.setString(5, projectDeadline);
        ps.setInt(6, fid);
        ps.setInt(7, cid);
        ps.setString(8, fname);
        ps.setString(9, cname);

        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            out.println("<h1>Project Added Successfully</h1>");
            response.sendRedirect("chome.html");
        } else {
            out.println("<h1>Error adding project</h1>");
        }
    } catch (ClassNotFoundException e) {
        // Handle ClassNotFoundException
        e.printStackTrace();
    } catch (SQLException e) {
        // Handle SQLException
        out.println("<h1>Error: " + e.getMessage() + "</h1>");
    } finally {
        // Close resources in the finally block
        try {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

%>
