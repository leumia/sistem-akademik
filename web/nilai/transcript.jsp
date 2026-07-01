<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transkrip Nilai - Sistem Akademik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        @media print {
            .no-print { display: none; }
            body { margin: 0; padding: 20px; }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary no-print">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="bi bi-mortarboard"></i> Sistem Akademik
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="nilai"><i class="bi bi-arrow-left"></i> Kembali</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5 mb-5">
        <!-- Header -->
        <div class="row mb-4 text-center">
            <div class="col-md-12">
                <h3 class="mb-1"><strong>TRANSKRIP NILAI AKADEMIK</strong></h3>
                <p class="text-muted mb-3">Universitas / Sekolah Tinggi</p>
            </div>
        </div>

        <!-- Student Info -->
        <div class="row mb-4">
            <div class="col-md-6">
                <table class="table table-borderless">
                    <tr>
                        <td style="width: 150px;"><strong>NIM</strong></td>
                        <td>: ${mahasiswa.nim}</td>
                    </tr>
                    <tr>
                        <td><strong>Nama Mahasiswa</strong></td>
                        <td>: ${mahasiswa.namaMahasiswa}</td>
                    </tr>
                    <tr>
                        <td><strong>Program Studi</strong></td>
                        <td>: ${mahasiswa.programStudi}</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6">
                <table class="table table-borderless">
                    <tr>
                        <td style="width: 150px;"><strong>Jenis Kelamin</strong></td>
                        <td>: ${mahasiswa.jenisKelamin}</td>
                    </tr>
                    <tr>
                        <td><strong>Status</strong></td>
                        <td>: ${mahasiswa.status}</td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- Grades Table -->
        <div class="row mb-4">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <thead class="table-primary">
                        <tr>
                            <th width="5%">No</th>
                            <th width="15%">Kode MK</th>
                            <th width="30%">Nama Mata Kuliah</th>
                            <th width="5%">SKS</th>
                            <th width="10%">Nilai Akhir</th>
                            <th width="8%">Grade</th>
                            <th width="12%">Keterangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty nilais}">
                            <tr>
                                <td colspan="7" class="text-center text-muted py-4">
                                    <i class="bi bi-inbox"></i> Tidak ada data nilai
                                </td>
                            </tr>
                        </c:if>
                        <c:forEach var="nilai" items="${nilais}" varStatus="status">
                            <tr>
                                <td class="text-center">${status.count}</td>
                                <td>${nilai.kodeMataKuliah}</td>
                                <td>${nilai.namaMataKuliah}</td>
                                <td class="text-center">${nilai.sks}</td>
                                <td class="text-center"><strong>${String.format("%.2f", nilai.nilaiAkhir)}</strong></td>
                                <td class="text-center">
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
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${nilai.keterangan == 'Lulus'}">
                                            <span class="badge bg-success">Lulus</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger">Tidak Lulus</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Grade Explanation -->
        <div class="row">
            <div class="col-md-12">
                <div class="alert alert-light border" role="alert">
                    <strong>Keterangan Grade:</strong><br>
                    A (85-100) | B (70-84) | C (60-69) | D (50-59) | E (0-49)
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="row mt-4 no-print">
            <div class="col-md-12 text-center">
                <button onclick="window.print()" class="btn btn-primary">
                    <i class="bi bi-printer"></i> Cetak
                </button>
                <a href="nilai" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Kembali
                </a>
            </div>
        </div>
    </div>

    <footer class="text-center text-muted mt-5 mb-3">
        <p>Dicetak dari Sistem Akademik pada: <span id="printDate"></span></p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('printDate').textContent = new Date().toLocaleString('id-ID');
    </script>
</body>
</html>
