package com.akademik.model;

import java.io.Serializable;

public class MataKuliah implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int idMataKuliah;
    private String kodeMataKuliah;
    private String namaMataKuliah;
    private int sks;
    private int semester;
    private String dosenPengampu;
    private String deskripsi;
    
    // Constructor
    public MataKuliah() {
    }
    
    public MataKuliah(String kodeMataKuliah, String namaMataKuliah, int sks, 
                      int semester, String dosenPengampu, String deskripsi) {
        this.kodeMataKuliah = kodeMataKuliah;
        this.namaMataKuliah = namaMataKuliah;
        this.sks = sks;
        this.semester = semester;
        this.dosenPengampu = dosenPengampu;
        this.deskripsi = deskripsi;
    }
    
    public MataKuliah(int idMataKuliah, String kodeMataKuliah, String namaMataKuliah, 
                      int sks, int semester, String dosenPengampu, String deskripsi) {
        this.idMataKuliah = idMataKuliah;
        this.kodeMataKuliah = kodeMataKuliah;
        this.namaMataKuliah = namaMataKuliah;
        this.sks = sks;
        this.semester = semester;
        this.dosenPengampu = dosenPengampu;
        this.deskripsi = deskripsi;
    }
    
    // Getter and Setter
    public int getIdMataKuliah() {
        return idMataKuliah;
    }
    
    public void setIdMataKuliah(int idMataKuliah) {
        this.idMataKuliah = idMataKuliah;
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
    
    public int getSemester() {
        return semester;
    }
    
    public void setSemester(int semester) {
        this.semester = semester;
    }
    
    public String getDosenPengampu() {
        return dosenPengampu;
    }
    
    public void setDosenPengampu(String dosenPengampu) {
        this.dosenPengampu = dosenPengampu;
    }
    
    public String getDeskripsi() {
        return deskripsi;
    }
    
    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }
    
    @Override
    public String toString() {
        return "MataKuliah{" +
                "idMataKuliah=" + idMataKuliah +
                ", kodeMataKuliah='" + kodeMataKuliah + '\'' +
                ", namaMataKuliah='" + namaMataKuliah + '\'' +
                ", sks=" + sks +
                ", semester=" + semester +
                ", dosenPengampu='" + dosenPengampu + '\'' +
                ", deskripsi='" + deskripsi + '\'' +
                '}';
    }
}
