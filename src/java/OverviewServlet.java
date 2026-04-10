/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/OverviewServlet")
public class OverviewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("user_id") == null){
            response.sendRedirect("login.html");
            return;
        }

        try{

            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE",
                "system",
                "345678"
            );

            // TOTAL ITEMS
            PreparedStatement ps1 = conn.prepareStatement(
                "SELECT COUNT(*) FROM items"
            );
            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            int total = rs1.getInt(1);

            // FOUND ITEMS
            PreparedStatement ps2 = conn.prepareStatement(
                "SELECT COUNT(*) FROM items WHERE type='found'"
            );
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            int found = rs2.getInt(1);

            // LOST ITEMS
            PreparedStatement ps3 = conn.prepareStatement(
                "SELECT COUNT(*) FROM items WHERE type='lost'"
            );
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            int lost = rs3.getInt(1);

            // SEND DATA TO JSP
            request.setAttribute("total", total);
            request.setAttribute("found", found);
            request.setAttribute("lost", lost);

            RequestDispatcher rd = request.getRequestDispatcher("overview.jsp");
            rd.forward(request, response);

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}