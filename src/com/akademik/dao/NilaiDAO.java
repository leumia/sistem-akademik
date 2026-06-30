package com.akademik.dao;

import com.akademik.model.Nilai;
import com.akademik.util.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NilaiDAO {
    
    // CREATE - Insert data nilai
    public boolean insert(Nilai nilai) {
        String sql = "INSERT INTO nilai (id_mahasiswa, id_matakuliah, nilai_tugas, nilai_kuis, nilai_uts, nilai_uas, nilai_akhir, grade, keterangan) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, nilai.getIdMahasiswa());
            pstmt.setInt(2, nilai.getIdMataKuliah());
            pstmt.setDouble(3, nilai.getNilaiTugas());
            pstmt.setDouble(4, nilai.getNilaiKuis());
            pstmt.setDouble(5, nilai.getNilaiUts());
            pstmt.setDouble(6, nilai.getNilaiUas());
            pstmt.setDouble(7, nilai.getNilaiAkhir());
            pstmt.setString(8, nilai.getGrade());
            pstmt.setString(9, nilai.getKeterangan());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error inserting nilai: " + e.getMessage());
            return false;
        }
    }
    
    // READ - Get all nilai
    public List<Nilai> getAll() {
        List<Nilai> list = new ArrayList<>();
        String sql = "SELECT n.*, m.nim, m.nama_mahasiswa, mk.kode_matakuliah, mk.nama_matakuliah " +
                     "FROM nilai n " +
                     "JOIN mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa " +
                     "JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah " +
                     "ORDER BY n.id_nilai DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Nilai nilai = new Nilai(
                    rs.getInt("id_nilai"),
                    rs.getInt("id_mahasiswa"),
                    rs.getInt("id_matakuliah"),
                    rs.getDouble("nilai_tugas"),
                    rs.getDouble("nilai_kuis"),
                    rs.getDouble("nilai_uts"),
                    rs.getDouble("nilai_uas"),
                    rs.getDouble("nilai_akhir"),
                    rs.getString("grade"),
                    rs.getString("keterangan")
                );
                nilai.setNimMahasiswa(rs.getString("nim"));
                nilai.setNamaMahasiswa(rs.getString("nama_mahasiswa"));
                nilai.setKodeMataKuliah(rs.getString("kode_matakuliah"));
                nilai.setNamaMataKuliah(rs.getString("nama_matakuliah"));
                list.add(nilai);
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving nilai: " + e.getMessage());
        }
        return list;
    }
    
    // READ - Get nilai by ID
    public Nilai getById(int id) {
        String sql = "SELECT n.*, m.nim, m.nama_mahasiswa, mk.kode_matakuliah, mk.nama_matakuliah " +
                     "FROM nilai n " +
                     "JOIN mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa " +
                     "JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah " +
                     "WHERE n.id_nilai = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Nilai nilai = new Nilai(
                        rs.getInt("id_nilai"),
                        rs.getInt("id_mahasiswa"),
                        rs.getInt("id_matakuliah"),
                        rs.getDouble("nilai_tugas"),
                        rs.getDouble("nilai_kuis"),
                        rs.getDouble("nilai_uts"),
                        rs.getDouble("nilai_uas"),
                        rs.getDouble("nilai_akhir"),
                        rs.getString("grade"),
                        rs.getString("keterangan")
                    );
                    nilai.setNimMahasiswa(rs.getString("nim"));
                    nilai.setNamaMahasiswa(rs.getString("nama_mahasiswa"));
                    nilai.setKodeMataKuliah(rs.getString("kode_matakuliah"));
                    nilai.setNamaMataKuliah(rs.getString("nama_matakuliah"));
                    return nilai;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving nilai by id: " + e.getMessage());
        }
        return null;
    }
    
    // UPDATE - Update data nilai
    public boolean update(Nilai nilai) {
        String sql = "UPDATE nilai SET nilai_tugas=?, nilai_kuis=?, nilai_uts=?, nilai_uas=?, " +
                     "nilai_akhir=?, grade=?, keterangan=? WHERE id_nilai=?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setDouble(1, nilai.getNilaiTugas());
            pstmt.setDouble(2, nilai.getNilaiKuis());
            pstmt.setDouble(3, nilai.getNilaiUts());
            pstmt.setDouble(4, nilai.getNilaiUas());
            pstmt.setDouble(5, nilai.getNilaiAkhir());
            pstmt.setString(6, nilai.getGrade());
            pstmt.setString(7, nilai.getKeterangan());
            pstmt.setInt(8, nilai.getIdNilai());
            
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
    
    // Get nilai by Mahasiswa ID
    public List<Nilai> getByMahasiswaId(int idMahasiswa) {
        List<Nilai> list = new ArrayList<>();
        String sql = "SELECT n.*, m.nim, m.nama_mahasiswa, mk.kode_matakuliah, mk.nama_matakuliah " +
                     "FROM nilai n " +
                     "JOIN mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa " +
                     "JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah " +
                     "WHERE n.id_mahasiswa = ? ORDER BY mk.kode_matakuliah";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, idMahasiswa);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Nilai nilai = new Nilai(
                        rs.getInt("id_nilai"),
                        rs.getInt("id_mahasiswa"),
                        rs.getInt("id_matakuliah"),
                        rs.getDouble("nilai_tugas"),
                        rs.getDouble("nilai_kuis"),
                        rs.getDouble("nilai_uts"),
                        rs.getDouble("nilai_uas"),
                        rs.getDouble("nilai_akhir"),
                        rs.getString("grade"),
                        rs.getString("keterangan")
                    );
                    nilai.setNimMahasiswa(rs.getString("nim"));
                    nilai.setNamaMahasiswa(rs.getString("nama_mahasiswa"));
                    nilai.setKodeMataKuliah(rs.getString("kode_matakuliah"));
                    nilai.setNamaMataKuliah(rs.getString("nama_matakuliah"));
                    list.add(nilai);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving nilai by mahasiswa id: " + e.getMessage());
        }
        return list;
    }
    
    // Get nilai by Mata Kuliah ID
    public List<Nilai> getByMataKuliahId(int idMataKuliah) {
        List<Nilai> list = new ArrayList<>();
        String sql = "SELECT n.*, m.nim, m.nama_mahasiswa, mk.kode_matakuliah, mk.nama_matakuliah " +
                     "FROM nilai n " +
                     "JOIN mahasiswa m ON n.id_mahasiswa = m.id_mahasiswa " +
                     "JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah " +
                     "WHERE n.id_matakuliah = ? ORDER BY m.nim";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, idMataKuliah);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Nilai nilai = new Nilai(
                        rs.getInt("id_nilai"),
                        rs.getInt("id_mahasiswa"),
                        rs.getInt("id_matakuliah"),
                        rs.getDouble("nilai_tugas"),
                        rs.getDouble("nilai_kuis"),
                        rs.getDouble("nilai_uts"),
                        rs.getDouble("nilai_uas"),
                        rs.getDouble("nilai_akhir"),
                        rs.getString("grade"),
                        rs.getString("keterangan")
                    );
                    nilai.setNimMahasiswa(rs.getString("nim"));
                    nilai.setNamaMahasiswa(rs.getString("nama_mahasiswa"));
                    nilai.setKodeMataKuliah(rs.getString("kode_matakuliah"));
                    nilai.setNamaMataKuliah(rs.getString("nama_matakuliah"));
                    list.add(nilai);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving nilai by mata kuliah id: " + e.getMessage());
        }
        return list;
    }
    
    // Check if nilai already exists
    public boolean exists(int idMahasiswa, int idMataKuliah) {
        String sql = "SELECT COUNT(*) FROM nilai WHERE id_mahasiswa = ? AND id_matakuliah = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, idMahasiswa);
            pstmt.setInt(2, idMataKuliah);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error checking nilai existence: " + e.getMessage());
        }
        return false;
    }
}
