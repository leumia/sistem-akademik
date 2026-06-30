package com.akademik.dao;

import com.akademik.model.Mahasiswa;
import com.akademik.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MahasiswaDAO {
    
    // CREATE - Insert data mahasiswa
    public boolean insert(Mahasiswa mahasiswa) {
        String sql = "INSERT INTO mahasiswa (nim, nama_mahasiswa, email, no_telpon, alamat, tanggal_lahir, jenis_kelamin, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, mahasiswa.getNim());
            pstmt.setString(2, mahasiswa.getNamaMahasiswa());
            pstmt.setString(3, mahasiswa.getEmail());
            pstmt.setString(4, mahasiswa.getNoTelpon());
            pstmt.setString(5, mahasiswa.getAlamat());
            pstmt.setDate(6, mahasiswa.getTanggalLahir());
            pstmt.setString(7, mahasiswa.getJenisKelamin());
            pstmt.setString(8, mahasiswa.getStatus());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error inserting mahasiswa: " + e.getMessage());
            return false;
        }
    }
    
    // READ - Get all mahasiswa
    public List<Mahasiswa> getAll() {
        List<Mahasiswa> list = new ArrayList<>();
        String sql = "SELECT * FROM mahasiswa ORDER BY id_mahasiswa DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Mahasiswa mahasiswa = new Mahasiswa(
                    rs.getInt("id_mahasiswa"),
                    rs.getString("nim"),
                    rs.getString("nama_mahasiswa"),
                    rs.getString("email"),
                    rs.getString("no_telpon"),
                    rs.getString("alamat"),
                    rs.getDate("tanggal_lahir"),
                    rs.getString("jenis_kelamin"),
                    rs.getString("status")
                );
                list.add(mahasiswa);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving mahasiswa: " + e.getMessage());
        }
        return list;
    }
    
    // READ - Get mahasiswa by ID
    public Mahasiswa getById(int id) {
        String sql = "SELECT * FROM mahasiswa WHERE id_mahasiswa = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Mahasiswa(
                        rs.getInt("id_mahasiswa"),
                        rs.getString("nim"),
                        rs.getString("nama_mahasiswa"),
                        rs.getString("email"),
                        rs.getString("no_telpon"),
                        rs.getString("alamat"),
                        rs.getDate("tanggal_lahir"),
                        rs.getString("jenis_kelamin"),
                        rs.getString("status")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving mahasiswa by id: " + e.getMessage());
        }
        return null;
    }
    
    // READ - Get mahasiswa by NIM
    public Mahasiswa getByNim(String nim) {
        String sql = "SELECT * FROM mahasiswa WHERE nim = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, nim);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Mahasiswa(
                        rs.getInt("id_mahasiswa"),
                        rs.getString("nim"),
                        rs.getString("nama_mahasiswa"),
                        rs.getString("email"),
                        rs.getString("no_telpon"),
                        rs.getString("alamat"),
                        rs.getDate("tanggal_lahir"),
                        rs.getString("jenis_kelamin"),
                        rs.getString("status")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving mahasiswa by nim: " + e.getMessage());
        }
        return null;
    }
    
    // UPDATE - Update data mahasiswa
    public boolean update(Mahasiswa mahasiswa) {
        String sql = "UPDATE mahasiswa SET nim=?, nama_mahasiswa=?, email=?, no_telpon=?, " +
                     "alamat=?, tanggal_lahir=?, jenis_kelamin=?, status=? WHERE id_mahasiswa=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, mahasiswa.getNim());
            pstmt.setString(2, mahasiswa.getNamaMahasiswa());
            pstmt.setString(3, mahasiswa.getEmail());
            pstmt.setString(4, mahasiswa.getNoTelpon());
            pstmt.setString(5, mahasiswa.getAlamat());
            pstmt.setDate(6, mahasiswa.getTanggalLahir());
            pstmt.setString(7, mahasiswa.getJenisKelamin());
            pstmt.setString(8, mahasiswa.getStatus());
            pstmt.setInt(9, mahasiswa.getIdMahasiswa());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error updating mahasiswa: " + e.getMessage());
            return false;
        }
    }
    
    // DELETE - Delete data mahasiswa
    public boolean delete(int id) {
        String sql = "DELETE FROM mahasiswa WHERE id_mahasiswa = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error deleting mahasiswa: " + e.getMessage());
            return false;
        }
    }
    
    // SEARCH - Search mahasiswa by name or NIM
    public List<Mahasiswa> search(String keyword) {
        List<Mahasiswa> list = new ArrayList<>();
        String sql = "SELECT * FROM mahasiswa WHERE nim LIKE ? OR nama_mahasiswa LIKE ? ORDER BY id_mahasiswa DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchKeyword = "%" + keyword + "%";
            pstmt.setString(1, searchKeyword);
            pstmt.setString(2, searchKeyword);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Mahasiswa mahasiswa = new Mahasiswa(
                        rs.getInt("id_mahasiswa"),
                        rs.getString("nim"),
                        rs.getString("nama_mahasiswa"),
                        rs.getString("email"),
                        rs.getString("no_telpon"),
                        rs.getString("alamat"),
                        rs.getDate("tanggal_lahir"),
                        rs.getString("jenis_kelamin"),
                        rs.getString("status")
                    );
                    list.add(mahasiswa);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error searching mahasiswa: " + e.getMessage());
        }
        return list;
    }
}
