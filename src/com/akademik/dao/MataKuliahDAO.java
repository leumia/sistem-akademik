package com.akademik.dao;

import com.akademik.model.MataKuliah;
import com.akademik.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MataKuliahDAO {
    
    // CREATE - Insert data mata kuliah
    public boolean insert(MataKuliah mataKuliah) {
        String sql = "INSERT INTO mata_kuliah (kode_matakuliah, nama_matakuliah, sks, semester, dosen_pengampu, deskripsi) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, mataKuliah.getKodeMataKuliah());
            pstmt.setString(2, mataKuliah.getNamaMataKuliah());
            pstmt.setInt(3, mataKuliah.getSks());
            pstmt.setInt(4, mataKuliah.getSemester());
            pstmt.setString(5, mataKuliah.getDosenPengampu());
            pstmt.setString(6, mataKuliah.getDeskripsi());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error inserting mata kuliah: " + e.getMessage());
            return false;
        }
    }
    
    // READ - Get all mata kuliah
    public List<MataKuliah> getAll() {
        List<MataKuliah> list = new ArrayList<>();
        String sql = "SELECT * FROM mata_kuliah ORDER BY id_matakuliah DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                MataKuliah mk = new MataKuliah(
                    rs.getInt("id_matakuliah"),
                    rs.getString("kode_matakuliah"),
                    rs.getString("nama_matakuliah"),
                    rs.getInt("sks"),
                    rs.getInt("semester"),
                    rs.getString("dosen_pengampu"),
                    rs.getString("deskripsi")
                );
                list.add(mk);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving mata kuliah: " + e.getMessage());
        }
        return list;
    }
    
    // READ - Get mata kuliah by ID
    public MataKuliah getById(int id) {
        String sql = "SELECT * FROM mata_kuliah WHERE id_matakuliah = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new MataKuliah(
                        rs.getInt("id_matakuliah"),
                        rs.getString("kode_matakuliah"),
                        rs.getString("nama_matakuliah"),
                        rs.getInt("sks"),
                        rs.getInt("semester"),
                        rs.getString("dosen_pengampu"),
                        rs.getString("deskripsi")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving mata kuliah by id: " + e.getMessage());
        }
        return null;
    }
    
    // READ - Get mata kuliah by Kode
    public MataKuliah getByKode(String kode) {
        String sql = "SELECT * FROM mata_kuliah WHERE kode_matakuliah = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, kode);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new MataKuliah(
                        rs.getInt("id_matakuliah"),
                        rs.getString("kode_matakuliah"),
                        rs.getString("nama_matakuliah"),
                        rs.getInt("sks"),
                        rs.getInt("semester"),
                        rs.getString("dosen_pengampu"),
                        rs.getString("deskripsi")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving mata kuliah by kode: " + e.getMessage());
        }
        return null;
    }
    
    // UPDATE - Update data mata kuliah
    public boolean update(MataKuliah mataKuliah) {
        String sql = "UPDATE mata_kuliah SET kode_matakuliah=?, nama_matakuliah=?, sks=?, " +
                     "semester=?, dosen_pengampu=?, deskripsi=? WHERE id_matakuliah=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, mataKuliah.getKodeMataKuliah());
            pstmt.setString(2, mataKuliah.getNamaMataKuliah());
            pstmt.setInt(3, mataKuliah.getSks());
            pstmt.setInt(4, mataKuliah.getSemester());
            pstmt.setString(5, mataKuliah.getDosenPengampu());
            pstmt.setString(6, mataKuliah.getDeskripsi());
            pstmt.setInt(7, mataKuliah.getIdMataKuliah());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error updating mata kuliah: " + e.getMessage());
            return false;
        }
    }
    
    // DELETE - Delete data mata kuliah
    public boolean delete(int id) {
        String sql = "DELETE FROM mata_kuliah WHERE id_matakuliah = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error deleting mata kuliah: " + e.getMessage());
            return false;
        }
    }
    
    // SEARCH - Search mata kuliah by name or kode
    public List<MataKuliah> search(String keyword) {
        List<MataKuliah> list = new ArrayList<>();
        String sql = "SELECT * FROM mata_kuliah WHERE kode_matakuliah LIKE ? OR nama_matakuliah LIKE ? ORDER BY id_matakuliah DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchKeyword = "%" + keyword + "%";
            pstmt.setString(1, searchKeyword);
            pstmt.setString(2, searchKeyword);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MataKuliah mk = new MataKuliah(
                        rs.getInt("id_matakuliah"),
                        rs.getString("kode_matakuliah"),
                        rs.getString("nama_matakuliah"),
                        rs.getInt("sks"),
                        rs.getInt("semester"),
                        rs.getString("dosen_pengampu"),
                        rs.getString("deskripsi")
                    );
                    list.add(mk);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error searching mata kuliah: " + e.getMessage());
        }
        return list;
    }
    
    // Get mata kuliah by semester
    public List<MataKuliah> getBySemester(int semester) {
        List<MataKuliah> list = new ArrayList<>();
        String sql = "SELECT * FROM mata_kuliah WHERE semester = ? ORDER BY kode_matakuliah";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, semester);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MataKuliah mk = new MataKuliah(
                        rs.getInt("id_matakuliah"),
                        rs.getString("kode_matakuliah"),
                        rs.getString("nama_matakuliah"),
                        rs.getInt("sks"),
                        rs.getInt("semester"),
                        rs.getString("dosen_pengampu"),
                        rs.getString("deskripsi")
                    );
                    list.add(mk);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving mata kuliah by semester: " + e.getMessage());
        }
        return list;
    }
}
