package net.file.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.file.dao.FileDAO;
import net.file.model.FileDetail;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/FileUploadServlet")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to upload.jsp for GET requests
        request.getRequestDispatcher("/WEB-INF/views/upload.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = null;
        String savePath = null;

        // Handle file upload
        jakarta.servlet.http.Part filePart = request.getPart("file");
        if (filePart != null) {
            fileName = filePart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            savePath = uploadPath + File.separator + fileName;
            filePart.write(savePath);
        }

        // Generate a unique download ID
        String downloadId = UUID.randomUUID().toString();

        // Save file details in the database
        jakarta.servlet.http.HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Assuming user ID is stored in the session

        if (userId == null) {
            // Handle the case where userId is not set in the session
            request.setAttribute("message", "User not logged in. Please log in to upload files.");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            return;
        }

        FileDetail fileDetail = new FileDetail();
        fileDetail.setUserId(userId);
        fileDetail.setFileName(fileName);
        fileDetail.setFilePath(savePath);
        fileDetail.setDownloadId(downloadId);

        FileDAO fileDAO = new FileDAO();
        if (fileDAO.saveFile(fileDetail)) {
            request.setAttribute("message", "File uploaded successfully. Download ID: " + downloadId);
        } else {
            request.setAttribute("message", "File upload failed!");
        }
        request.getRequestDispatcher("/WEB-INF/views/upload.jsp").forward(request, response);
    }
}