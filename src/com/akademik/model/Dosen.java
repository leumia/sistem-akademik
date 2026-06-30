package com.akademik.model;

import java.io.Serializable;

public class Dosen implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int idDosen;
    private String username;
    private String password;
    private String namaDosen;
    private String email;
    private String noTelpon;
    
    // Constructor
    public Dosen() {
    }
    
    public Dosen(String username, String password, String namaDosen, String email, String noTelpon) {
        this.username = username;
        this.password = password;
        this.namaDosen = namaDosen;
        this.email = email;
        this.noTelpon = noTelpon;
    }
    
    public Dosen(int idDosen, String username, String password, String namaDosen, String email, String noTelpon) {
        this.idDosen = idDosen;
        this.username = username;
        this.password = password;
        this.namaDosen = namaDosen;
        this.email = email;
        this.noTelpon = noTelpon;
    }
    
    // Getter and Setter
    public int getIdDosen() {
        return idDosen;
    }
    
    public void setIdDosen(int idDosen) {
        this.idDosen = idDosen;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getNamaDosen() {
        return namaDosen;
    }
    
    public void setNamaDosen(String namaDosen) {
        this.namaDosen = namaDosen;
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
    
    @Override
    public String toString() {
        return "Dosen{" +
                "idDosen=" + idDosen +
                ", username='" + username + '\'' +
                ", namaDosen='" + namaDosen + '\'' +
                ", email='" + email + '\'' +
                ", noTelpon='" + noTelpon + '\'' +
                '}';
    }
}
