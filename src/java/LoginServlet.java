/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE",
                "system",       // change if using SYSTEM
                "345678"
            );

            String sql = "SELECT * FROM users1 WHERE username=? AND password=?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

           if(rs.next()){
       
               int userId = rs.getInt("id");   // get ID from DB
                String role = rs.getString("role");
                
    HttpSession session = request.getSession();
    session.setAttribute("user_id", userId);   //  IMPORTANT
    session.setAttribute("user", username);    // optional
    session.setAttribute("role", role);
    response.sendRedirect("dashboard.jsp");
}
else{

    out.println("<h2>Invalid Username or Password</h2>");

}

            conn.close();

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}