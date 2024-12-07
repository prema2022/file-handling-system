package net.file.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.file.model.FileDetail;

public class UserViewFileDAO {

    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/file_handling_system?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    // Method to get a database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Method to retrieve files by user_id
    public List<FileDetail> getFilesByUserId(int userId) {
        List<FileDetail> files = new ArrayList<>();
        String sql = "SELECT file_id, user_id, file_name, file_path, upload_time, download_id FROM files WHERE user_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                FileDetail file = new FileDetail();
                file.setFileId(rs.getInt("file_id"));
                file.setUserId(rs.getInt("user_id"));
                file.setFileName(rs.getString("file_name"));
                file.setFilePath(rs.getString("file_path"));
                file.setUploadTime(rs.getTimestamp("upload_time"));
                file.setDownloadId(rs.getString("download_id"));
                files.add(file);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return files;
    }
}