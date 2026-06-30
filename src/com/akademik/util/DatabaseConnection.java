package com.akademik.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    
    // Database configuration
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/akademik_db";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    
    // Get database connection
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        try {
            Class.forName(DB_DRIVER);
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found. " + e.getMessage());
            throw e;
        } catch (SQLException e) {
            System.err.println("Database connection failed. " + e.getMessage());
            throw e;
        }
    }
    
    // Close database connection
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.err.println("Error closing connection. " + e.getMessage());
            }
        }
    }
    
    // Test connection
    public static boolean testConnection() {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                System.out.println("✓ Database connection successful!");
                closeConnection(conn);
                return true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("✗ Database connection failed: " + e.getMessage());
        }
        return false;
    }
}
