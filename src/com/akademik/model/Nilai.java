package com.akademik.model;

import java.io.Serializable;

public class Nilai implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int idNilai;
    private int idMahasiswa;
    private int idMataKuliah;
    private double nilaiTugas;
    private double nilaiKuis;
    private double nilaiUts;
    private double nilaiUas;
    private double nilaiAkhir;
    private String grade;
    private String keterangan;
    
    // Additional fields for display
    private String nimMahasiswa;
    private String namaMahasiswa;
    private String kodeMataKuliah;
    private String namaMataKuliah;
    
    // Constructor
    public Nilai() {
    }
    
    public Nilai(int idMahasiswa, int idMataKuliah, double nilaiTugas, 
                 double nilaiKuis, double nilaiUts, double nilaiUas) {
        this.idMahasiswa = idMahasiswa;
        this.idMataKuliah = idMataKuliah;
        this.nilaiTugas = nilaiTugas;
        this.nilaiKuis = nilaiKuis;
        this.nilaiUts = nilaiUts;
        this.nilaiUas = nilaiUas;
    }
    
    public Nilai(int idNilai, int idMahasiswa, int idMataKuliah, double nilaiTugas, 
                 double nilaiKuis, double nilaiUts, double nilaiUas, double nilaiAkhir, 
                 String grade, String keterangan) {
        this.idNilai = idNilai;
        this.idMahasiswa = idMahasiswa;
        this.idMataKuliah = idMataKuliah;
        this.nilaiTugas = nilaiTugas;
        this.nilaiKuis = nilaiKuis;
        this.nilaiUts = nilaiUts;
        this.nilaiUas = nilaiUas;
        this.nilaiAkhir = nilaiAkhir;
        this.grade = grade;
        this.keterangan = keterangan;
    }
    
    // Method to calculate final grade
    public void hitungNilaiAkhir() {
        // Formula: Tugas 20%, Kuis 20%, UTS 30%, UAS 30%
        this.nilaiAkhir = (nilaiTugas * 0.2) + (nilaiKuis * 0.2) + 
                          (nilaiUts * 0.3) + (nilaiUas * 0.3);
        setGrade();
    }
    
    // Method to set grade based on nilai akhir
    private void setGrade() {
        if (nilaiAkhir >= 85) {
            this.grade = "A";
        } else if (nilaiAkhir >= 75) {
            this.grade = "B";
        } else if (nilaiAkhir >= 65) {
            this.grade = "C";
        } else if (nilaiAkhir >= 55) {
            this.grade = "D";
        } else {
            this.grade = "E";
        }
    }
    
    // Getter and Setter
    public int getIdNilai() {
        return idNilai;
    }
    
    public void setIdNilai(int idNilai) {
        this.idNilai = idNilai;
    }
    
    public int getIdMahasiswa() {
        return idMahasiswa;
    }
    
    public void setIdMahasiswa(int idMahasiswa) {
        this.idMahasiswa = idMahasiswa;
    }
    
    public int getIdMataKuliah() {
        return idMataKuliah;
    }
    
    public void setIdMataKuliah(int idMataKuliah) {
        this.idMataKuliah = idMataKuliah;
    }
    
    public double getNilaiTugas() {
        return nilaiTugas;
    }
    
    public void setNilaiTugas(double nilaiTugas) {
        this.nilaiTugas = nilaiTugas;
    }
    
    public double getNilaiKuis() {
        return nilaiKuis;
    }
    
    public void setNilaiKuis(double nilaiKuis) {
        this.nilaiKuis = nilaiKuis;
    }
    
    public double getNilaiUts() {
        return nilaiUts;
    }
    
    public void setNilaiUts(double nilaiUts) {
        this.nilaiUts = nilaiUts;
    }
    
    public double getNilaiUas() {
        return nilaiUas;
    }
    
    public void setNilaiUas(double nilaiUas) {
        this.nilaiUas = nilaiUas;
    }
    
    public double getNilaiAkhir() {
        return nilaiAkhir;
    }
    
    public void setNilaiAkhir(double nilaiAkhir) {
        this.nilaiAkhir = nilaiAkhir;
    }
    
    public String getGrade() {
        return grade;
    }
    
    public void setGrade(String grade) {
        this.grade = grade;
    }
    
    public String getKeterangan() {
        return keterangan;
    }
    
    public void setKeterangan(String keterangan) {
        this.keterangan = keterangan;
    }
    
    public String getNimMahasiswa() {
        return nimMahasiswa;
    }
    
    public void setNimMahasiswa(String nimMahasiswa) {
        this.nimMahasiswa = nimMahasiswa;
    }
    
    public String getNamaMahasiswa() {
        return namaMahasiswa;
    }
    
    public void setNamaMahasiswa(String namaMahasiswa) {
        this.namaMahasiswa = namaMahasiswa;
    }
    
    public String getKodeMataKuliah() {
        return kodeMataKuliah;
    }
    
    public void setKodeMataKuliah(String kodeMataKuliah) {
        this.kodeMataKuliah = kodeMataKuliah;
    }
    
    public String getNamaMataKuliah() {
        return namaMataKuliah;
    }
    
    public void setNamaMataKuliah(String namaMataKuliah) {
        this.namaMataKuliah = namaMataKuliah;
    }
    
    @Override
    public String toString() {
        return "Nilai{" +
                "idNilai=" + idNilai +
                ", idMahasiswa=" + idMahasiswa +
                ", idMataKuliah=" + idMataKuliah +
                ", nilaiTugas=" + nilaiTugas +
                ", nilaiKuis=" + nilaiKuis +
                ", nilaiUts=" + nilaiUts +
                ", nilaiUas=" + nilaiUas +
                ", nilaiAkhir=" + nilaiAkhir +
                ", grade='" + grade + '\'' +
                ", keterangan='" + keterangan + '\'' +
                '}';
    }
}
