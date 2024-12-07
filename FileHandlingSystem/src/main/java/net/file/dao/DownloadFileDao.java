package net.file.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.file.model.DownloadFileDetail;

public class DownloadFileDao {

    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/file_handling_system";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    // Method to establish a database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Method to retrieve file details based on download ID
    public DownloadFileDetail getFileByDownloadId(String downloadId) {
        String sql = "SELECT * FROM files WHERE download_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, downloadId);
            System.out.println("Executing query: " + stmt.toString()); // Debugging statement
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                DownloadFileDetail file = new DownloadFileDetail();
                file.setFileId(rs.getInt("file_id"));
                file.setUserId(rs.getInt("user_id"));
                file.setOriginalFileName(rs.getString("file_name")); // Original name
                file.setUniqueFilePath(rs.getString("file_path"));  // Unique path
                file.setDownloadId(rs.getString("download_id"));
                System.out.println("File found: " + file.getOriginalFileName()); // Debugging statement
                return file;
            } else {
                System.out.println("No file found for download ID: " + downloadId); // Debugging statement
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error retrieving file details: " + e.getMessage()); // Debugging statement
        }
        return null; // Return null if no file is found
    }
}