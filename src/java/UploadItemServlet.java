/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/UploadItemServlet")
public class UploadItemServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

String title = request.getParameter("title");
String description = request.getParameter("description");
String location = request.getParameter("location");
String type = request.getParameter("type");
String phone = request.getParameter("phone");


HttpSession session = request.getSession();
int userId = (int) session.getAttribute("user_id");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:XE",
"system",
"345678"
);

PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO items(title,description,location,type,status,user_id,phone) VALUES(?,?,?,?,?,?,?)"
);

ps.setString(1,title);
ps.setString(2,description);
ps.setString(3,location);
ps.setString(4,type);
ps.setString(5,"pending");
ps.setInt(6,userId);
ps.setString(7, phone);

ps.executeUpdate();

response.sendRedirect("dashboard.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}