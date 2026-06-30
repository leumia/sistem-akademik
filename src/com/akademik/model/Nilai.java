package com.akademik.model;

import java.io.Serializable;

public class Nilai implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int idNilai;
    private int idMahasiswa;
    private int idMataKuliah;
    private double nilaiTugas;
    private double nilaiUts;
    private double nilaiUas;
    private double nilaiAkhir;
    private String grade;
    private String keterangan;
    
    // Data tambahan untuk display
    private String nim;
    private String namaMahasiswa;
    private String programStudi;
    private String kodeMataKuliah;
    private String namaMataKuliah;
    private int sks;
    
    // Constructor
    public Nilai() {
    }
    
    public Nilai(int idMahasiswa, int idMataKuliah, double nilaiTugas, double nilaiUts, double nilaiUas) {
        this.idMahasiswa = idMahasiswa;
        this.idMataKuliah = idMataKuliah;
        this.nilaiTugas = nilaiTugas;
        this.nilaiUts = nilaiUts;
        this.nilaiUas = nilaiUas;
        calculateFinalGrade();
    }
    
    public Nilai(int idNilai, int idMahasiswa, int idMataKuliah, double nilaiTugas, 
                 double nilaiUts, double nilaiUas, double nilaiAkhir, String grade, String keterangan) {
        this.idNilai = idNilai;
        this.idMahasiswa = idMahasiswa;
        this.idMataKuliah = idMataKuliah;
        this.nilaiTugas = nilaiTugas;
        this.nilaiUts = nilaiUts;
        this.nilaiUas = nilaiUas;
        this.nilaiAkhir = nilaiAkhir;
        this.grade = grade;
        this.keterangan = keterangan;
    }
    
    // Calculate final grade: 20% Tugas + 30% UTS + 50% UAS
    public void calculateFinalGrade() {
        this.nilaiAkhir = (0.2 * nilaiTugas) + (0.3 * nilaiUts) + (0.5 * nilaiUas);
        this.grade = determineGrade(nilaiAkhir);
        this.keterangan = nilaiAkhir >= 50 ? "Lulus" : "Tidak Lulus";
    }
    
    // Determine letter grade based on final score
    private String determineGrade(double score) {
        if (score >= 85) return "A";
        if (score >= 70) return "B";
        if (score >= 60) return "C";
        if (score >= 50) return "D";
        return "E";
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
        calculateFinalGrade();
    }
    
    public double getNilaiUts() {
        return nilaiUts;
    }
    
    public void setNilaiUts(double nilaiUts) {
        this.nilaiUts = nilaiUts;
        calculateFinalGrade();
    }
    
    public double getNilaiUas() {
        return nilaiUas;
    }
    
    public void setNilaiUas(double nilaiUas) {
        this.nilaiUas = nilaiUas;
        calculateFinalGrade();
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
    
    public String getNim() {
        return nim;
    }
    
    public void setNim(String nim) {
        this.nim = nim;
    }
    
    public String getNamaMahasiswa() {
        return namaMahasiswa;
    }
    
    public void setNamaMahasiswa(String namaMahasiswa) {
        this.namaMahasiswa = namaMahasiswa;
    }
    
    public String getProgramStudi() {
        return programStudi;
    }
    
    public void setProgramStudi(String programStudi) {
        this.programStudi = programStudi;
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
    
    public int getSks() {
        return sks;
    }
    
    public void setSks(int sks) {
        this.sks = sks;
    }
    
    @Override
    public String toString() {
        return "Nilai{" +
                "idNilai=" + idNilai +
                ", idMahasiswa=" + idMahasiswa +
                ", idMataKuliah=" + idMataKuliah +
                ", nilaiTugas=" + nilaiTugas +
                ", nilaiUts=" + nilaiUts +
                ", nilaiUas=" + nilaiUas +
                ", nilaiAkhir=" + nilaiAkhir +
                ", grade='" + grade + '\'' +
                ", keterangan='" + keterangan + '\'' +
                '}';
    }
}
