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

/**
 * Servlet implementation class Login
 */
@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login.jsp page
        jakarta.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/userlogin.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String user_name = request.getParameter("username");
        String pwd = request.getParameter("passkey");
        HttpSession session = request.getSession();
        jakarta.servlet.RequestDispatcher dispatcher = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_handling_system?useSSL=false", "root", "root");
            PreparedStatement pst = con.prepareStatement("select * from userlogin where user_name = ? and pwd = ?");
            pst.setString(1, user_name);
            pst.setString(2, pwd);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id"); // Assuming 'id' is the column name for user ID
                session.setAttribute("userId", userId);
                session.setAttribute("name", rs.getString("user_name"));
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/user.jsp");
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("/WEB-INF/views/userlogin.jsp");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}