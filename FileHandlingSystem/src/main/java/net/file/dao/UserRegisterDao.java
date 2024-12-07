package net.file.dao;

import net.file.model.UserRegister;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class UserRegisterDao {
    public static int newuser(UserRegister userregister) throws ClassNotFoundException {
        String INSERT_USERS_SQL = "INSERT INTO userlogin (user_name, pwd, pwd1) VALUES (?, ?, ?)";
        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/file_handling_system?useSSL=false", "root", "root");
             PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL)) {

            ps.setString(1, userregister.getUsername());
            ps.setString(2, userregister.getPasskey());
            ps.setString(3, userregister.getPasskey1());

            // Debugging: Print the SQL statement and parameters
            System.out.println("SQL: " + INSERT_USERS_SQL);
            System.out.println("Parameters: " + userregister.getUsername() + ", " + userregister.getPasskey() + ", " + userregister.getPasskey1());

            result = ps.executeUpdate();

            // Debugging: Print the result of the executeUpdate method
            System.out.println("Rows affected: " + result);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}