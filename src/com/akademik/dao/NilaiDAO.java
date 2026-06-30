package com.akademik.dao;

import com.akademik.model.Nilai;
import com.akademik.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NilaiDAO {
    
    // CREATE - Insert data nilai
    public boolean insert(Nilai nilai) {
        String sql = "INSERT INTO nilai (id_mahasiswa, id_mata_kuliah, nilai_tugas, nilai_uts, nilai_uas, " +
                     "nilai_akhir, grade, keterangan) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, nilai.getIdMahasiswa());
            pstmt.setInt(2, nilai.getIdMataKuliah());
            pstmt.setDouble(3, nilai.getNilaiTugas());
            pstmt.setDouble(4, nilai.getNilaiUts());
            pstmt.setDouble(5, nilai.getNilaiUas());
            pstmt.setDouble(6, nilai.getNilaiAkhir());
            pstmt.setString(7, nilai.getGrade());
            pstmt.setString(8, nilai.getKeterangan());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error inserting nilai: " + e.getMessage());
            return false;
        }
    }
    
    // READ - Get all nilai
    public List<Nilai> getAll() {
        List<Nilai> list = new ArrayList<>();
        String sql = "SELECT n.*, m.nim, m.nama_mahasiswa, m.program_studi, " +
                     "mk.kode_mata_kuliah, mk.nama_mata_kuliah, mk.sks " +
                     "FROM nilai n " +
                     "JOIN mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa " +
                     "JOIN mata_kuliah mk ON n.id_mata_kuliah = mk.id_mata_kuliah " +
                     "ORDER BY n.id_nilai DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Nilai nilai = new Nilai(
                    rs.getInt("id_nilai"),
                    rs.getInt("id_mahasiswa"),
                    rs.getInt("id_mata_kuliah"),
                    rs.getDouble("nilai_tugas"),
                    rs.getDouble("nilai_uts"),
                    rs.getDouble("nilai_uas"),
                    rs.getDouble("nilai_akhir"),
                    rs.getString("grade"),
                    rs.getString("keterangan")
                );
                nilai.setNim(rs.getString("nim"));
                nilai.setNamaMahasiswa(rs.getString("nama_mahasiswa"));
                nilai.setProgramStudi(rs.getString("program_studi"));
                nilai.setKodeMataKuliah(rs.getString("kode_mata_kuliah"));
                nilai.setNamaMataKuliah(rs.getString("nama_mata_kuliah"));
                nilai.setSks(rs.getInt("sks"));
                list.add(nilai);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving nilai: " + e.getMessage());
        }
        return list;
    }
    
    // READ - Get nilai by ID
    public Nilai getById(int id) {
        String sql = "SELECT n.*, m.nim, m.nama_mahasiswa, m.program_studi, " +
                     "mk.kode_mata_kuliah, mk.nama_mata_kuliah, mk.sks " +
                     "FROM nilai n " +
                     "JOIN mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa " +
                     "JOIN mata_kuliah mk ON n.id_mata_kuliah = mk.id_mata_kuliah " +
                     "WHERE n.id_nilai = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Nilai nilai = new Nilai(
                        rs.getInt("id_nilai"),
                        rs.getInt("id_mahasiswa"),
                        rs.getInt("id_mata_kuliah"),
                        rs.getDouble("nilai_tugas"),
                        rs.getDouble("nilai_uts"),
                        rs.getDouble("nilai_uas"),
                        rs.getDouble("nilai_akhir"),
                        rs.getString("grade"),
                        rs.getString("keterangan")
                    );
                    nilai.setNim(rs.getString("nim"));
                    nilai.setNamaMahasiswa(rs.getString("nama_mahasiswa"));
                    nilai.setProgramStudi(rs.getString("program_studi"));
                    nilai.setKodeMataKuliah(rs.getString("kode_mata_kuliah"));
                    nilai.setNamaMataKuliah(rs.getString("nama_mata_kuliah"));
                    nilai.setSks(rs.getInt("sks"));
                    return nilai;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving nilai by id: " + e.getMessage());
        }
        return null;
    }
    
    // READ - Get nilai by mahasiswa ID
    public List<Nilai> getByMahasiswa(int idMahasiswa) {
        List<Nilai> list = new ArrayList<>();
        String sql = "SELECT n.*, m.nim, m.nama_mahasiswa, m.program_studi, " +
                     "mk.kode_mata_kuliah, mk.nama_mata_kuliah, mk.sks " +
                     "FROM nilai n " +
                     "JOIN mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa " +
                     "JOIN mata_kuliah mk ON n.id_mata_kuliah = mk.id_mata_kuliah " +
                     "WHERE n.id_mahasiswa = ? ORDER BY n.id_nilai DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, idMahasiswa);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Nilai nilai = new Nilai(
                        rs.getInt("id_nilai"),
                        rs.getInt("id_mahasiswa"),
                        rs.getInt("id_mata_kuliah"),
                        rs.getDouble("nilai_tugas"),
                        rs.getDouble("nilai_uts"),
                        rs.getDouble("nilai_uas"),
                        rs.getDouble("nilai_akhir"),
                        rs.getString("grade"),
                        rs.getString("keterangan")
                    );
                    nilai.setNim(rs.getString("nim"));
                    nilai.setNamaMahasiswa(rs.getString("nama_mahasiswa"));
                    nilai.setProgramStudi(rs.getString("program_studi"));
                    nilai.setKodeMataKuliah(rs.getString("kode_mata_kuliah"));
                    nilai.setNamaMataKuliah(rs.getString("nama_mata_kuliah"));
                    nilai.setSks(rs.getInt("sks"));
                    list.add(nilai);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving nilai by mahasiswa: " + e.getMessage());
        }
        return list;
    }
    
    // UPDATE - Update data nilai
    public boolean update(Nilai nilai) {
        String sql = "UPDATE nilai SET nilai_tugas=?, nilai_uts=?, nilai_uas=?, " +
                     "nilai_akhir=?, grade=?, keterangan=? WHERE id_nilai=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setDouble(1, nilai.getNilaiTugas());
            pstmt.setDouble(2, nilai.getNilaiUts());
            pstmt.setDouble(3, nilai.getNilaiUas());
            pstmt.setDouble(4, nilai.getNilaiAkhir());
            pstmt.setString(5, nilai.getGrade());
            pstmt.setString(6, nilai.getKeterangan());
            pstmt.setInt(7, nilai.getIdNilai());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error updating nilai: " + e.getMessage());
            return false;
        }
    }
    
    // DELETE - Delete data nilai
    public boolean delete(int id) {
        String sql = "DELETE FROM nilai WHERE id_nilai = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error deleting nilai: " + e.getMessage());
            return false;
        }
    }
}
