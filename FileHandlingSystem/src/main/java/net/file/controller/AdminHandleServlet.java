package net.file.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.file.dao.AdminDAO;
import net.file.model.FileDetail;
import net.file.model.UserRegister;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminHandle")
public class AdminHandleServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AdminDAO adminDAO = new AdminDAO();

        switch (action) {
            case "viewUsers":
                List<UserRegister> users = adminDAO.getAllUsers();
                System.out.println("Retrieved " + users.size() + " users."); // Logging
                request.setAttribute("users", users);
                request.getRequestDispatcher("/WEB-INF/views/viewUsers.jsp").forward(request, response);
                break;

            case "viewUploadedFiles":
                List<FileDetail> files = adminDAO.getAllUploadedFiles();
                System.out.println("Retrieved " + files.size() + " files."); // Logging
                request.setAttribute("files", files);
                request.getRequestDispatcher("/WEB-INF/views/viewUploadedFiles.jsp").forward(request, response);
                break;

            case "viewDownloadHistory":
                List<FileDetail> downloads = adminDAO.getDownloadHistory();
                System.out.println("Retrieved " + downloads.size() + " downloads."); // Logging
                request.setAttribute("downloads", downloads);
                request.getRequestDispatcher("/WEB-INF/views/viewDownloadHistory.jsp").forward(request, response);
                break;

            default:
                response.sendRedirect("/WEB-INF/views/admin.jsp");
        }
    }
}