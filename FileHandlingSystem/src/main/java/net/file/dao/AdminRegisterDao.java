package net.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import net.file.model.AdminRegister;

public class AdminRegisterDao {

    public static int newstaff(AdminRegister adminregister) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO adminlogin (admin_name, paskey, paskey1) VALUES (?, ?, ?)";
        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_handling_system?useSSL=false", "root", "root");
             PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL)) {

            ps.setString(1, adminregister.getUsername());
            ps.setString(2, adminregister.getPswrd());
            ps.setString(3, adminregister.getPswrd1());
            System.out.println(ps);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}