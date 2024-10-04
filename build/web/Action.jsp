<%-- 
    Document   : Action
    Created on : 14-Mar-2024, 7:27:23?pm
    Author     : Mani
--%>

<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>

<%

Connection con = null;
String url = "jdbc:mysql://localhost:3306/";
String db = "Freelancer";
String driver = "com.mysql.cj.jdbc.Driver";
java.util.Date date;
String s=null;
try{
    Class.forName(driver);
    con = DriverManager.getConnection(url+db,"root","root");
    try{
        Statement st = con.createStatement();
        String tables=request.getParameter("tables");
        String Name=request.getParameter("Name");
        String Username=request.getParameter("Username");
        String Password=request.getParameter("Password");
        String qry = "insert into " +tables+ "(Name, Username, Password) values('"+Name+"','"+Username+"','"+Password+"')";
        int val = st.executeUpdate(qry);
        if(tables.equals("freelancer")){
            if(val > 0){
                out.println("successfully insert data into database!");
                out.println("</br>");
                response.sendRedirect("fhome.html");
            }
        }else{
            if(val > 0){
                out.println("successfully insert data into database!");
                out.println("</br>");
                response.sendRedirect("chome.html");
            }
        }
    }
    catch (SQLException ex){
        System.out.println("SQL statement is not executed!");
        ex.printStackTrace();
    }
}
catch (Exception e){
    e.printStackTrace();
}
finally {
    try {
        if (con != null) {
            con.close();
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}

%>
