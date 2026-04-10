/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

protected void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

    // ✅ STEP 1: CHECK SESSION
    HttpSession session = request.getSession(false);

    if(session == null){
        response.sendRedirect("login.html");
        return;
    }

    // ✅ STEP 2: CHECK ROLE
    String role = (String) session.getAttribute("role");

    if(role == null || !role.equals("admin")){
        response.sendRedirect("login.html"); // ❌ block non-admin
        return;
    }

    // ✅ STEP 3: DATABASE LOGIC
    try{

        Class.forName("oracle.jdbc.driver.OracleDriver");

        Connection conn = DriverManager.getConnection(
            "jdbc:oracle:thin:@localhost:1521:XE",
            "system",
            "345678"
        );

        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM items"
        );

        ResultSet rs = ps.executeQuery();

        request.setAttribute("items", rs);

        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);

    }catch(Exception e){
        e.printStackTrace();
    }
}
}

