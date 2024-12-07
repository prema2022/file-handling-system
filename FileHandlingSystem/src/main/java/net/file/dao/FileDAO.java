package net.file.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.file.model.FileDetail;


public class FileDAO {


    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/file_handling_system?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    // Method to get a database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Method to save a file's details to the database
    public boolean saveFile(FileDetail file) {
        String sql = "INSERT INTO files (user_id, file_name, file_path, download_id) VALUES (?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, file.getUserId());
            stmt.setString(2, file.getFileName());
            stmt.setString(3, file.getFilePath());
            stmt.setString(4, file.getDownloadId());
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}