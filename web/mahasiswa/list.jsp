<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Mahasiswa - Sistem Akademik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="bi bi-mortarboard"></i> Sistem Akademik
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="mahasiswa"><i class="bi bi-people"></i> Mahasiswa</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="matakuliah"><i class="bi bi-book"></i> Mata Kuliah</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="nilai"><i class="bi bi-graph-up"></i> Nilai</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2 class="mb-4"><i class="bi bi-people"></i> Daftar Mahasiswa</h2>

                <!-- Alert Messages -->
                <c:if test="${param.success == 1}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> Data mahasiswa berhasil ditambahkan!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.success == 2}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> Data mahasiswa berhasil diperbarui!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.success == 3}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> Data mahasiswa berhasil dihapus!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 1}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-circle"></i> Terjadi kesalahan saat memproses data!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Search and Add Button -->
                <div class="row mb-3">
                    <div class="col-md-8">
                        <form method="get" action="mahasiswa" class="d-flex">
                            <input type="text" name="keyword" class="form-control" placeholder="Cari berdasarkan NIM, nama, atau program studi..." value="${keyword}">
                            <button type="submit" class="btn btn-primary ms-2">
                                <i class="bi bi-search"></i> Cari
                            </button>
                        </form>
                    </div>
                    <div class="col-md-4 text-end">
                        <a href="mahasiswa?action=add" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Tambah Mahasiswa
                        </a>
                    </div>
                </div>

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-primary">
                            <tr>
                                <th>No</th>
                                <th>NIM</th>
                                <th>Nama</th>
                                <th>Program Studi</th>
                                <th>Email</th>
                                <th>No. Telepon</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty mahasiswas}">
                                <tr>
                                    <td colspan="8" class="text-center text-muted py-4">
                                        <i class="bi bi-inbox"></i> Tidak ada data mahasiswa
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="mahasiswa" items="${mahasiswas}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td><strong>${mahasiswa.nim}</strong></td>
                                    <td>${mahasiswa.namaMahasiswa}</td>
                                    <td>${mahasiswa.programStudi}</td>
                                    <td>${mahasiswa.email}</td>
                                    <td>${mahasiswa.noTelpon}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${mahasiswa.status == 'Aktif'}">
                                                <span class="badge bg-success">Aktif</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">Tidak Aktif</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="mahasiswa?action=edit&id=${mahasiswa.idMahasiswa}" class="btn btn-sm btn-info" title="Edit">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <a href="mahasiswa?action=delete&id=${mahasiswa.idMahasiswa}" class="btn btn-sm btn-danger" onclick="return confirm('Yakin ingin menghapus?')" title="Hapus">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
