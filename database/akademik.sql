-- Create Database
CREATE DATABASE IF NOT EXISTS akademik_db;
USE akademik_db;

-- Table: mahasiswa
CREATE TABLE mahasiswa (
    id_mahasiswa INT PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR(20) NOT NULL UNIQUE,
    nama_mahasiswa VARCHAR(100) NOT NULL,
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
    nilai_kuis DECIMAL(5,2),
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

-- Insert Sample Data: Mahasiswa
INSERT INTO mahasiswa (nim, nama_mahasiswa, email, no_telpon, alamat, tanggal_lahir, jenis_kelamin, status) VALUES
('2021001', 'Ahmad Rizki', 'ahmad@email.com', '08123456789', 'Jl. Merdeka No.1', '2003-05-15', 'Laki-laki', 'Aktif'),
('2021002', 'Siti Nurhaliza', 'siti@email.com', '08987654321', 'Jl. Sudirman No.2', '2003-08-20', 'Perempuan', 'Aktif'),
('2021003', 'Budi Santoso', 'budi@email.com', '08234567890', 'Jl. Gatot Subroto No.3', '2003-03-10', 'Laki-laki', 'Aktif'),
('2021004', 'Dewi Lestari', 'dewi@email.com', '08567891234', 'Jl. Diponegoro No.4', '2003-07-22', 'Perempuan', 'Aktif'),
('2021005', 'Rian Pratama', 'rian@email.com', '08765432109', 'Jl. Ahmad Yani No.5', '2003-11-05', 'Laki-laki', 'Aktif');

-- Insert Sample Data: Mata Kuliah
INSERT INTO mata_kuliah (kode_matakuliah, nama_matakuliah, sks, semester, dosen_pengampu, deskripsi) VALUES
('IF101', 'Pemrograman Java', 3, 2, 'Dr. Bambang', 'Belajar dasar-dasar pemrograman Java dan OOP'),
('IF102', 'Basis Data', 3, 2, 'Prof. Siti', 'Desain dan implementasi basis data relasional'),
('IF103', 'Web Programming', 3, 3, 'Dr. Ahmad', 'Pengembangan aplikasi web menggunakan HTML, CSS, JavaScript'),
('IF104', 'Algoritma dan Struktur Data', 3, 1, 'Dr. Rini', 'Analisis dan implementasi algoritma efisien'),
('IF105', 'Sistem Operasi', 3, 3, 'Prof. Hendra', 'Konsep dan implementasi sistem operasi');

-- Insert Sample Data: Nilai
INSERT INTO nilai (id_mahasiswa, id_matakuliah, nilai_tugas, nilai_kuis, nilai_uts, nilai_uas, nilai_akhir, grade, keterangan) VALUES
(1, 1, 85, 80, 78, 82, 81.25, 'B', 'Lulus'),
(1, 2, 90, 88, 85, 89, 88, 'A', 'Lulus'),
(2, 1, 88, 85, 80, 85, 84.5, 'B', 'Lulus'),
(2, 3, 92, 90, 88, 91, 90.25, 'A', 'Lulus'),
(3, 2, 78, 75, 72, 76, 75.25, 'C', 'Lulus'),
(3, 4, 82, 80, 78, 81, 80.25, 'B', 'Lulus'),
(4, 1, 95, 92, 90, 94, 92.75, 'A', 'Lulus'),
(4, 5, 85, 83, 81, 84, 83.25, 'B', 'Lulus'),
(5, 3, 80, 78, 75, 79, 78, 'C', 'Lulus'),
(5, 4, 88, 86, 84, 87, 86.25, 'B', 'Lulus');

-- Create Index for better query performance
CREATE INDEX idx_mahasiswa_nim ON mahasiswa(nim);
CREATE INDEX idx_matakuliah_kode ON mata_kuliah(kode_matakuliah);
CREATE INDEX idx_nilai_mahasiswa ON nilai(id_mahasiswa);
CREATE INDEX idx_nilai_matakuliah ON nilai(id_matakuliah);
