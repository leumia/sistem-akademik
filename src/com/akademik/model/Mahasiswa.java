package com.akademik.model;

import java.io.Serializable;
import java.sql.Date;

public class Mahasiswa implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int idMahasiswa;
    private String nim;
    private String namaMahasiswa;
    private String email;
    private String noTelpon;
    private String alamat;
    private Date tanggalLahir;
    private String jenisKelamin;
    private String status;
    
    // Constructor
    public Mahasiswa() {
    }
    
    public Mahasiswa(String nim, String namaMahasiswa, String email, String noTelpon,
                     String alamat, Date tanggalLahir, String jenisKelamin, String status) {
        this.nim = nim;
        this.namaMahasiswa = namaMahasiswa;
        this.email = email;
        this.noTelpon = noTelpon;
        this.alamat = alamat;
        this.tanggalLahir = tanggalLahir;
        this.jenisKelamin = jenisKelamin;
        this.status = status;
    }
    
    public Mahasiswa(int idMahasiswa, String nim, String namaMahasiswa, String email, 
                     String noTelpon, String alamat, Date tanggalLahir, String jenisKelamin, String status) {
        this.idMahasiswa = idMahasiswa;
        this.nim = nim;
        this.namaMahasiswa = namaMahasiswa;
        this.email = email;
        this.noTelpon = noTelpon;
        this.alamat = alamat;
        this.tanggalLahir = tanggalLahir;
        this.jenisKelamin = jenisKelamin;
        this.status = status;
    }
    
    // Getter and Setter
    public int getIdMahasiswa() {
        return idMahasiswa;
    }
    
    public void setIdMahasiswa(int idMahasiswa) {
        this.idMahasiswa = idMahasiswa;
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
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getNoTelpon() {
        return noTelpon;
    }
    
    public void setNoTelpon(String noTelpon) {
        this.noTelpon = noTelpon;
    }
    
    public String getAlamat() {
        return alamat;
    }
    
    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }
    
    public Date getTanggalLahir() {
        return tanggalLahir;
    }
    
    public void setTanggalLahir(Date tanggalLahir) {
        this.tanggalLahir = tanggalLahir;
    }
    
    public String getJenisKelamin() {
        return jenisKelamin;
    }
    
    public void setJenisKelamin(String jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    @Override
    public String toString() {
        return "Mahasiswa{" +
                "idMahasiswa=" + idMahasiswa +
                ", nim='" + nim + '\'' +
                ", namaMahasiswa='" + namaMahasiswa + '\'' +
                ", email='" + email + '\'' +
                ", noTelpon='" + noTelpon + '\'' +
                ", alamat='" + alamat + '\'' +
                ", tanggalLahir=" + tanggalLahir +
                ", jenisKelamin='" + jenisKelamin + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
