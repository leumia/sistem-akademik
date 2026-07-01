-- Create Database
CREATE DATABASE IF NOT EXISTS akademik_db;
USE akademik_db;

-- Table: dosen (Users/Admin)
CREATE TABLE IF NOT EXISTS dosen (
    id_dosen INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    nama_dosen VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    no_telpon VARCHAR(15),
    alamat TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: mahasiswa
CREATE TABLE IF NOT EXISTS mahasiswa (
    id_mahasiswa INT PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR(20) UNIQUE NOT NULL,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    program_studi VARCHAR(100),
    email VARCHAR(100),
    no_telpon VARCHAR(15),
    alamat TEXT,
    tanggal_lahir DATE,
    jenis_kelamin VARCHAR(20),
    status VARCHAR(50) DEFAULT 'Aktif',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: mata_kuliah
CREATE TABLE IF NOT EXISTS mata_kuliah (
    id_mata_kuliah INT PRIMARY KEY AUTO_INCREMENT,
    kode_mata_kuliah VARCHAR(50) UNIQUE NOT NULL,
    nama_mata_kuliah VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    dosen_pengampu VARCHAR(100),
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: nilai
CREATE TABLE IF NOT EXISTS nilai (
    id_nilai INT PRIMARY KEY AUTO_INCREMENT,
    id_mahasiswa INT NOT NULL,
    id_mata_kuliah INT NOT NULL,
    nilai_tugas DECIMAL(5, 2),
    nilai_uts DECIMAL(5, 2),
    nilai_uas DECIMAL(5, 2),
    nilai_akhir DECIMAL(5, 2),
    grade VARCHAR(2),
    keterangan VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa) ON DELETE CASCADE,
    FOREIGN KEY (id_mata_kuliah) REFERENCES mata_kuliah(id_mata_kuliah) ON DELETE CASCADE,
    UNIQUE KEY unique_nilai (id_mahasiswa, id_mata_kuliah)
);

-- Create Indexes
CREATE INDEX idx_mahasiswa_nim ON mahasiswa(nim);
CREATE INDEX idx_mahasiswa_status ON mahasiswa(status);
CREATE INDEX idx_mata_kuliah_kode ON mata_kuliah(kode_mata_kuliah);
CREATE INDEX idx_mata_kuliah_semester ON mata_kuliah(semester);
CREATE INDEX idx_nilai_mahasiswa ON nilai(id_mahasiswa);
CREATE INDEX idx_nilai_mata_kuliah ON nilai(id_mata_kuliah);

-- Insert Sample Data: Dosen (Default Admin)
INSERT INTO dosen (username, password, nama_dosen, email) 
VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin@akademik.ac.id');

-- Insert Sample Data: Mahasiswa
INSERT INTO mahasiswa (nim, nama_mahasiswa, program_studi, email, status) 
VALUES 
('2021001', 'Ahmad Rizki Pratama', 'Teknik Informatika', 'ahmad@student.ac.id', 'Aktif'),
('2021002', 'Siti Nurhaliza', 'Teknik Informatika', 'siti@student.ac.id', 'Aktif'),
('2021003', 'Budi Santoso', 'Sistem Informasi', 'budi@student.ac.id', 'Aktif'),
('2021004', 'Rina Wijaya', 'Sistem Informasi', 'rina@student.ac.id', 'Aktif'),
('2021005', 'Hendra Kusuma', 'Teknik Informatika', 'hendra@student.ac.id', 'Aktif');

-- Insert Sample Data: Mata Kuliah
INSERT INTO mata_kuliah (kode_mata_kuliah, nama_mata_kuliah, sks, semester, dosen_pengampu, deskripsi)
VALUES 
('TI101', 'Algoritma dan Pemrograman', 3, 1, 'Dr. Budi Santoso', 'Dasar algoritma dan pemrograman menggunakan bahasa C'),
('TI102', 'Basis Data', 3, 2, 'Prof. Andi Wijaya', 'Perancangan dan implementasi basis data relasional'),
('TI103', 'Pemrograman Web', 3, 3, 'Ir. Siti Nurhaliza', 'Pengembangan aplikasi web menggunakan HTML, CSS, PHP'),
('TI104', 'Sistem Operasi', 3, 3, 'Dr. Hendra Kusuma', 'Konsep dan implementasi sistem operasi'),
('TI201', 'Jaringan Komputer', 3, 4, 'Eng. Rena Wijaya', 'Fundamental jaringan komputer dan protokol komunikasi'),
('TI202', 'Keamanan Informasi', 3, 5, 'Dr. Budi Santoso', 'Praktik keamanan sistem informasi dan enkripsi');

-- Insert Sample Data: Nilai
INSERT INTO nilai (id_mahasiswa, id_mata_kuliah, nilai_tugas, nilai_uts, nilai_uas, nilai_akhir, grade, keterangan)
VALUES 
(1, 1, 85, 80, 82, 81.70, 'A', 'Lulus'),
(1, 2, 90, 88, 85, 87.00, 'A', 'Lulus'),
(1, 3, 75, 78, 80, 78.70, 'B', 'Lulus'),
(2, 1, 80, 85, 88, 85.20, 'A', 'Lulus'),
(2, 2, 70, 72, 75, 72.70, 'B', 'Lulus'),
(3, 1, 65, 68, 70, 68.20, 'C', 'Lulus'),
(3, 3, 75, 80, 82, 79.70, 'B', 'Lulus'),
(4, 2, 85, 87, 90, 87.70, 'A', 'Lulus'),
(5, 1, 72, 75, 78, 75.20, 'B', 'Lulus'),
(5, 4, 88, 85, 83, 84.70, 'A', 'Lulus');
