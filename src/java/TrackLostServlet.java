/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/TrackLostServlet")
public class TrackLostServlet extends HttpServlet {

protected void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

HttpSession session = request.getSession(false);

int userId = (int) session.getAttribute("user_id");

try{

Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = DriverManager.getConnection(
"jdbc:oracle:thin:@localhost:1521:XE",
"system",
"345678"
);

PreparedStatement ps = conn.prepareStatement(
"SELECT * FROM items WHERE user_id=? AND type='lost'"
);

ps.setInt(1, userId);

ResultSet rs = ps.executeQuery();

request.setAttribute("items", rs);

RequestDispatcher rd = request.getRequestDispatcher("tracklost.jsp");
rd.forward(request, response);

}catch(Exception e){
e.printStackTrace();
}
}
}