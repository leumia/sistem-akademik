package com.akademik.dao;

import com.akademik.model.Dosen;
import com.akademik.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DosenDAO {
    
    // CREATE - Insert data dosen
    public boolean insert(Dosen dosen) {
        String sql = "INSERT INTO dosen (username, password, nama_dosen, email, no_telpon) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, dosen.getUsername());
            pstmt.setString(2, dosen.getPassword());
            pstmt.setString(3, dosen.getNamaDosen());
            pstmt.setString(4, dosen.getEmail());
            pstmt.setString(5, dosen.getNoTelpon());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error inserting dosen: " + e.getMessage());
            return false;
        }
    }
    
    // READ - Get all dosen
    public List<Dosen> getAll() {
        List<Dosen> list = new ArrayList<>();
        String sql = "SELECT * FROM dosen ORDER BY id_dosen DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Dosen dosen = new Dosen(
                    rs.getInt("id_dosen"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("nama_dosen"),
                    rs.getString("email"),
                    rs.getString("no_telpon")
                );
                list.add(dosen);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving dosen: " + e.getMessage());
        }
        return list;
    }
    
    // READ - Get dosen by ID
    public Dosen getById(int id) {
        String sql = "SELECT * FROM dosen WHERE id_dosen = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Dosen(
                        rs.getInt("id_dosen"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("nama_dosen"),
                        rs.getString("email"),
                        rs.getString("no_telpon")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving dosen by id: " + e.getMessage());
        }
        return null;
    }
    
    // READ - Login dosen by username and password
    public Dosen login(String username, String password) {
        String sql = "SELECT * FROM dosen WHERE username = ? AND password = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Dosen(
                        rs.getInt("id_dosen"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("nama_dosen"),
                        rs.getString("email"),
                        rs.getString("no_telpon")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error during login: " + e.getMessage());
        }
        return null;
    }
    
    // READ - Get dosen by username
    public Dosen getByUsername(String username) {
        String sql = "SELECT * FROM dosen WHERE username = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Dosen(
                        rs.getInt("id_dosen"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("nama_dosen"),
                        rs.getString("email"),
                        rs.getString("no_telpon")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving dosen by username: " + e.getMessage());
        }
        return null;
    }
    
    // UPDATE - Update data dosen
    public boolean update(Dosen dosen) {
        String sql = "UPDATE dosen SET username=?, password=?, nama_dosen=?, email=?, no_telpon=? WHERE id_dosen=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, dosen.getUsername());
            pstmt.setString(2, dosen.getPassword());
            pstmt.setString(3, dosen.getNamaDosen());
            pstmt.setString(4, dosen.getEmail());
            pstmt.setString(5, dosen.getNoTelpon());
            pstmt.setInt(6, dosen.getIdDosen());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error updating dosen: " + e.getMessage());
            return false;
        }
    }
    
    // DELETE - Delete data dosen
    public boolean delete(int id) {
        String sql = "DELETE FROM dosen WHERE id_dosen = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error deleting dosen: " + e.getMessage());
            return false;
        }
    }
    
    // SEARCH - Search dosen by name or username
    public List<Dosen> search(String keyword) {
        List<Dosen> list = new ArrayList<>();
        String sql = "SELECT * FROM dosen WHERE username LIKE ? OR nama_dosen LIKE ? ORDER BY id_dosen DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchKeyword = "%" + keyword + "%";
            pstmt.setString(1, searchKeyword);
            pstmt.setString(2, searchKeyword);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Dosen dosen = new Dosen(
                        rs.getInt("id_dosen"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("nama_dosen"),
                        rs.getString("email"),
                        rs.getString("no_telpon")
                    );
                    list.add(dosen);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error searching dosen: " + e.getMessage());
        }
        return list;
    }
}
