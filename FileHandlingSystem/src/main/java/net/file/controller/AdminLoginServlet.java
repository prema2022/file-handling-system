package net.file.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminLoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login.jsp page
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String admin_name = request.getParameter("username");
        String passkey = request.getParameter("pswrd");
        HttpSession session = request.getSession();
        jakarta.servlet.RequestDispatcher dispatcher = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_handling_system?useSSL=false", "root", "root");
            PreparedStatement pst = con.prepareStatement("select * from adminlogin where admin_name = ? and paskey = ?");
            pst.setString(1, admin_name);
            pst.setString(2, passkey);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                session.setAttribute("name", rs.getString("admin_name"));
                // Redirect to AdminOrderServlet
                response.sendRedirect(request.getContextPath() + "/AdminServlet");
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}