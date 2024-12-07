package net.file.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class DownloadHistoryDao {

    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/file_handling_system";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    // Method to establish a database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Method to save download history
    public void saveDownloadHistory(int fileId, int userId, Timestamp downloadTime) {
        String sql = "INSERT INTO downloads (file_id, user_id, download_time) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, fileId);
            stmt.setInt(2, userId);
            stmt.setTimestamp(3, downloadTime);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error saving download history: " + e.getMessage());
        }
    }
}