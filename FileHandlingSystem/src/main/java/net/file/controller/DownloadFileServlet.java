package net.file.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Timestamp;
import java.util.Date;

import net.file.dao.DownloadFileDao;
import net.file.dao.DownloadHistoryDao; // New DAO for storing download history
import net.file.model.DownloadFileDetail;

@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to Download.jsp
        request.getRequestDispatcher("/WEB-INF/views/Download.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String downloadId = request.getParameter("downloadId");

        if (downloadId == null) {
            request.setAttribute("error", "Missing required parameter: downloadId");
            request.getRequestDispatcher("/WEB-INF/views/Download.jsp").forward(request, response);
            return;
        }

        try {
            // Retrieve file details using the DAO
            DownloadFileDao fileDAO = new DownloadFileDao();
            DownloadFileDetail file = fileDAO.getFileByDownloadId(downloadId);

            if (file != null) {
                File downloadFile = new File(file.getUniqueFilePath());
                if (downloadFile.exists()) {
                    // Set response headers for file download
                    response.setContentType("application/octet-stream");
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getOriginalFileName() + "\"");
                    
                    // Stream the file to the client
                    try (FileInputStream fis = new FileInputStream(downloadFile);
                         OutputStream out = response.getOutputStream()) {
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = fis.read(buffer)) != -1) {
                            out.write(buffer, 0, bytesRead);
                        }
                    }

                    // Store download history
                    DownloadHistoryDao downloadHistoryDao = new DownloadHistoryDao();
                    downloadHistoryDao.saveDownloadHistory(file.getFileId(), file.getUserId(), new Timestamp(new Date().getTime()));

                } else {
                    // If the file doesn't exist on the server
                    request.setAttribute("error", "File not found on the server!");
                    request.getRequestDispatcher("/WEB-INF/views/Download.jsp").forward(request, response);
                }
            } else {
                // If the download ID is invalid
                request.setAttribute("error", "Invalid Download ID!");
                request.getRequestDispatcher("/WEB-INF/views/Download.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/Download.jsp").forward(request, response);
        }
    }
}