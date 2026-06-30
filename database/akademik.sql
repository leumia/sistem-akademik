-- Create Database
CREATE DATABASE IF NOT EXISTS akademik_db;
USE akademik_db;

-- Table: dosen
CREATE TABLE dosen (
    id_dosen INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nama_dosen VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    no_telpon VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: mahasiswa
CREATE TABLE mahasiswa (
    id_mahasiswa INT PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR(20) NOT NULL UNIQUE,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    program_studi VARCHAR(100),
    email VARCHAR(100),
    no_telpon VARCHAR(15),
    alamat TEXT,
    tanggal_lahir DATE,
    jenis_kelamin ENUM('Laki-laki', 'Perempuan') NOT NULL,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: mata_kuliah
CREATE TABLE mata_kuliah (
    id_matakuliah INT PRIMARY KEY AUTO_INCREMENT,
    kode_matakuliah VARCHAR(20) NOT NULL UNIQUE,
    nama_matakuliah VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    dosen_pengampu VARCHAR(100),
    deskripsi TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table: nilai
CREATE TABLE nilai (
    id_nilai INT PRIMARY KEY AUTO_INCREMENT,
    id_mahasiswa INT NOT NULL,
    id_matakuliah INT NOT NULL,
    nilai_tugas DECIMAL(5,2),
    nilai_uts DECIMAL(5,2),
    nilai_uas DECIMAL(5,2),
    nilai_akhir DECIMAL(5,2),
    grade VARCHAR(2),
    keterangan VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa) ON DELETE CASCADE,
    FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah) ON DELETE CASCADE,
    UNIQUE KEY unique_mahasiswa_matakuliah (id_mahasiswa, id_matakuliah)
);

-- Insert Sample Data: Dosen
INSERT INTO dosen (username, password, nama_dosen, email, no_telpon) VALUES
('dosen1', '123456', 'Dr. Bambang Suryanto', 'bambang@univ.ac.id', '08123456789'),
('dosen2', '123456', 'Prof. Siti Nurhaliza', 'siti@univ.ac.id', '08234567890'),
('dosen3', '123456', 'Dr. Ahmad Wijaya', 'ahmad@univ.ac.id', '08345678901');

-- Insert Sample Data: Mahasiswa
INSERT INTO mahasiswa (nim, nama_mahasiswa, program_studi, email, no_telpon, alamat, tanggal_lahir, jenis_kelamin, status) VALUES
('2021001', 'Ahmad Rizki', 'Teknik Informatika', 'ahmad@email.com', '08123456789', 'Jl. Merdeka No.1', '2003-05-15', 'Laki-laki', 'Aktif'),
('2021002', 'Siti Nurhaliza', 'Teknik Informatika', 'siti@email.com', '08987654321', 'Jl. Sudirman No.2', '2003-08-20', 'Perempuan', 'Aktif'),
('2021003', 'Budi Santoso', 'Sistem Informasi', 'budi@email.com', '08234567890', 'Jl. Gatot Subroto No.3', '2003-03-10', 'Laki-laki', 'Aktif'),
('2021004', 'Dewi Lestari', 'Sistem Informasi', 'dewi@email.com', '08567891234', 'Jl. Diponegoro No.4', '2003-07-22', 'Perempuan', 'Aktif'),
('2021005', 'Rian Pratama', 'Teknik Informatika', 'rian@email.com', '08765432109', 'Jl. Ahmad Yani No.5', '2003-11-05', 'Laki-laki', 'Aktif');

-- Insert Sample Data: Mata Kuliah
INSERT INTO mata_kuliah (kode_matakuliah, nama_matakuliah, sks, semester, dosen_pengampu, deskripsi) VALUES
('IF101', 'Pemrograman Java', 3, 2, 'Dr. Bambang', 'Belajar dasar-dasar pemrograman Java dan OOP'),
('IF102', 'Basis Data', 3, 2, 'Prof. Siti', 'Desain dan implementasi basis data relasional'),
('IF103', 'Web Programming', 3, 3, 'Dr. Ahmad', 'Pengembangan aplikasi web menggunakan HTML, CSS, JavaScript'),
('IF104', 'Algoritma dan Struktur Data', 3, 1, 'Dr. Bambang', 'Analisis dan implementasi algoritma efisien'),
('IF105', 'Sistem Operasi', 3, 3, 'Prof. Siti', 'Konsep dan implementasi sistem operasi');

-- Insert Sample Data: Nilai (menggunakan formula baru: 20% Tugas + 30% UTS + 50% UAS)
INSERT INTO nilai (id_mahasiswa, id_matakuliah, nilai_tugas, nilai_uts, nilai_uas, nilai_akhir, grade, keterangan) VALUES
(1, 1, 85, 78, 82, 81.40, 'B', 'Lulus'),
(1, 2, 90, 85, 89, 87.80, 'A', 'Lulus'),
(2, 1, 88, 80, 85, 84.00, 'B', 'Lulus'),
(2, 3, 92, 88, 91, 90.30, 'A', 'Lulus'),
(3, 2, 78, 72, 76, 74.80, 'C', 'Lulus'),
(3, 4, 82, 78, 81, 80.60, 'B', 'Lulus'),
(4, 1, 95, 90, 94, 92.80, 'A', 'Lulus'),
(4, 5, 85, 81, 84, 83.60, 'B', 'Lulus'),
(5, 3, 80, 75, 79, 77.80, 'C', 'Lulus'),
(5, 4, 88, 84, 87, 86.20, 'B', 'Lulus');

-- Create Index for better query performance
CREATE INDEX idx_dosen_username ON dosen(username);
CREATE INDEX idx_mahasiswa_nim ON mahasiswa(nim);
CREATE INDEX idx_matakuliah_kode ON mata_kuliah(kode_matakuliah);
CREATE INDEX idx_nilai_mahasiswa ON nilai(id_mahasiswa);
CREATE INDEX idx_nilai_matakuliah ON nilai(id_matakuliah);
