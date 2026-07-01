<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Nilai - Sistem Akademik</title>
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
                        <a class="nav-link active" href="nilai"><i class="bi bi-graph-up"></i> Nilai</a>
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
                <h2 class="mb-4"><i class="bi bi-graph-up"></i> Daftar Nilai</h2>

                <!-- Alert Messages -->
                <c:if test="${param.success == 1}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> Data nilai berhasil ditambahkan!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.success == 2}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> Data nilai berhasil diperbarui!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.success == 3}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i> Data nilai berhasil dihapus!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 1}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-circle"></i> Terjadi kesalahan saat memproses data!
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Add Button -->
                <div class="row mb-3">
                    <div class="col-md-12 text-end">
                        <a href="nilai?action=add" class="btn btn-success">
                            <i class="bi bi-plus-circle"></i> Tambah Nilai
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
                                <th>Nama Mahasiswa</th>
                                <th>Kode Mata Kuliah</th>
                                <th>Nama Mata Kuliah</th>
                                <th>Tugas</th>
                                <th>UTS</th>
                                <th>UAS</th>
                                <th>Nilai Akhir</th>
                                <th>Grade</th>
                                <th>Keterangan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty nilais}">
                                <tr>
                                    <td colspan="12" class="text-center text-muted py-4">
                                        <i class="bi bi-inbox"></i> Tidak ada data nilai
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="nilai" items="${nilais}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td><strong>${nilai.nim}</strong></td>
                                    <td>${nilai.namaMahasiswa}</td>
                                    <td>${nilai.kodeMataKuliah}</td>
                                    <td>${nilai.namaMataKuliah}</td>
                                    <td>${nilai.nilaiTugas}</td>
                                    <td>${nilai.nilaiUts}</td>
                                    <td>${nilai.nilaiUas}</td>
                                    <td><strong>${String.format("%.2f", nilai.nilaiAkhir)}</strong></td>
                                    <td>
                                        <span class="badge 
                                            <c:choose>
                                                <c:when test="${nilai.grade == 'A'}">bg-success</c:when>
                                                <c:when test="${nilai.grade == 'B'}">bg-info</c:when>
                                                <c:when test="${nilai.grade == 'C'}">bg-warning</c:when>
                                                <c:when test="${nilai.grade == 'D'}">bg-danger</c:when>
                                                <c:otherwise>bg-dark</c:otherwise>
                                            </c:choose>
                                        ">${nilai.grade}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${nilai.keterangan == 'Lulus'}">
                                                <span class="badge bg-success">Lulus</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Tidak Lulus</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="nilai?action=edit&id=${nilai.idNilai}" class="btn btn-sm btn-info" title="Edit">
                                            <i class="bi bi-pencil"></i>
                                        </a>
                                        <a href="nilai?action=delete&id=${nilai.idNilai}" class="btn btn-sm btn-danger" onclick="return confirm('Yakin ingin menghapus?')" title="Hapus">
                                            <i class="bi bi-trash"></i>
                                        </a>
                                        <a href="nilai?action=transcript&id=${nilai.idMahasiswa}" class="btn btn-sm btn-secondary" title="Lihat Transkrip">
                                            <i class="bi bi-file-text"></i>
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
