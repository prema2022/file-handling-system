package net.file.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.file.dao.UserViewFileDAO;
import net.file.model.FileDetail;

import java.io.IOException;
import java.util.List;

@WebServlet("/ViewUploadedFilesServlet")
public class ViewUploadedFilesUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the JSP page for GET requests
        request.getRequestDispatcher("/WEB-INF/views/ViewUploadedFilesUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");

        if (userIdStr == null || userIdStr.isEmpty()) {
            request.setAttribute("error", "User ID is required.");
            request.getRequestDispatcher("/WEB-INF/views/ViewUploadedFilesUser.jsp").forward(request, response);
            return;
        }

        try {
            int userId = Integer.parseInt(userIdStr);
            UserViewFileDAO userFileDAO = new UserViewFileDAO();
            List<FileDetail> files = userFileDAO.getFilesByUserId(userId);

            request.setAttribute("files", files);
            request.getRequestDispatcher("/WEB-INF/views/ViewUploadedFilesUser.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid User ID.");
            request.getRequestDispatcher("/WEB-INF/views/ViewUploadedFilesUser.jsp").forward(request, response);
        }
    }
}