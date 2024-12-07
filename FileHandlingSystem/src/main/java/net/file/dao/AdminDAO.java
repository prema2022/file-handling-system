package net.file.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import net.file.model.FileDetail;
import net.file.model.UserRegister;

public class AdminDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/file_handling_system";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    // Method to establish a database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Get all registered users
    public List<UserRegister> getAllUsers() {
        List<UserRegister> users = new ArrayList<>();
        String sql = "SELECT id, user_name FROM userlogin";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                UserRegister user = new UserRegister();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("user_name"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error retrieving users: " + e.getMessage());
        }
        return users;
    }

    // Get all uploaded files
    public List<FileDetail> getAllUploadedFiles() {
        List<FileDetail> files = new ArrayList<>();
        String sql = "SELECT file_id, user_id, file_name, file_path, upload_time, download_id FROM files";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

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
            System.err.println("Error retrieving uploaded files: " + e.getMessage());
        }
        return files;
    }

    // Get download history
    public List<FileDetail> getDownloadHistory() {
        List<FileDetail> downloads = new ArrayList<>();
        String sql = """
                     SELECT d.download_id, d.file_id, d.user_id, d.download_time, f.file_name, f.file_path 
                     FROM downloads d
                     JOIN files f ON d.file_id = f.file_id
                     """;

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                FileDetail download = new FileDetail();
                download.setFileId(rs.getInt("file_id"));
                download.setUserId(rs.getInt("user_id"));
                download.setFileName(rs.getString("file_name"));
                download.setFilePath(rs.getString("file_path"));
                download.setUploadTime(rs.getTimestamp("download_time"));
                download.setDownloadId(rs.getString("download_id"));
                downloads.add(download);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error retrieving download history: " + e.getMessage());
        }
        return downloads;
    }
}