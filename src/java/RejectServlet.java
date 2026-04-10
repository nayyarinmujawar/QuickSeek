/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/RejectServlet")
public class RejectServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws IOException {

int id = Integer.parseInt(request.getParameter("id"));

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:XE",
"system",
"345678"
);

PreparedStatement ps = conn.prepareStatement(
"DELETE FROM items WHERE id=?"
);

ps.setInt(1, id);
ps.executeUpdate();

response.sendRedirect("AdminServlet");

}catch(Exception e){
e.printStackTrace();
}
}
}