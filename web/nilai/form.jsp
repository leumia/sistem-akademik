<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${nilai != null ? 'Edit' : 'Tambah'} Nilai - Sistem Akademik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="bi bi-mortarboard"></i> Sistem Akademik
            </a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">
                            <i class="bi bi-graph-up"></i>
                            <c:choose>
                                <c:when test="${nilai != null}">
                                    Edit Data Nilai
                                </c:when>
                                <c:otherwise>
                                    Tambah Nilai Baru
                                </c:otherwise>
                            </c:choose>
                        </h5>
                    </div>
                    <div class="card-body">
                        <form method="post" action="nilai" class="needs-validation" novalidate>
                            <input type="hidden" name="action" value="${nilai != null ? 'update' : 'save'}">
                            <c:if test="${nilai != null}">
                                <input type="hidden" name="id" value="${nilai.idNilai}">
                            </c:if>

                            <div class="mb-3">
                                <label for="idMahasiswa" class="form-label">Mahasiswa <span class="text-danger">*</span></label>
                                <select class="form-select" id="idMahasiswa" name="idMahasiswa" required>
                                    <option value="">-- Pilih Mahasiswa --</option>
                                    <c:forEach var="mahasiswa" items="${mahasiswas}">
                                        <option value="${mahasiswa.idMahasiswa}" 
                                            ${nilai != null && nilai.idMahasiswa == mahasiswa.idMahasiswa ? 'selected' : ''}>
                                            ${mahasiswa.nim} - ${mahasiswa.namaMahasiswa}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="idMataKuliah" class="form-label">Mata Kuliah <span class="text-danger">*</span></label>
                                <select class="form-select" id="idMataKuliah" name="idMataKuliah" required>
                                    <option value="">-- Pilih Mata Kuliah --</option>
                                    <c:forEach var="mataKuliah" items="${mataKuliahs}">
                                        <option value="${mataKuliah.idMataKuliah}" 
                                            ${nilai != null && nilai.idMataKuliah == mataKuliah.idMataKuliah ? 'selected' : ''}>
                                            ${mataKuliah.kodeMataKuliah} - ${mataKuliah.namaMataKuliah}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="nilaiTugas" class="form-label">Nilai Tugas (20%) <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="nilaiTugas" name="nilaiTugas" 
                                       value="${nilai != null ? nilai.nilaiTugas : ''}" min="0" max="100" step="0.01" required>
                                <small class="text-muted">Masukkan nilai 0-100</small>
                            </div>

                            <div class="mb-3">
                                <label for="nilaiUts" class="form-label">Nilai UTS (30%) <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="nilaiUts" name="nilaiUts" 
                                       value="${nilai != null ? nilai.nilaiUts : ''}" min="0" max="100" step="0.01" required>
                                <small class="text-muted">Masukkan nilai 0-100</small>
                            </div>

                            <div class="mb-3">
                                <label for="nilaiUas" class="form-label">Nilai UAS (50%) <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="nilaiUas" name="nilaiUas" 
                                       value="${nilai != null ? nilai.nilaiUas : ''}" min="0" max="100" step="0.01" required>
                                <small class="text-muted">Masukkan nilai 0-100</small>
                            </div>

                            <div class="alert alert-info" role="alert">
                                <i class="bi bi-info-circle"></i> 
                                <strong>Perhitungan Nilai Akhir:</strong><br>
                                Nilai Akhir = (Tugas × 20%) + (UTS × 30%) + (UAS × 50%)
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-lg"></i> Simpan
                                </button>
                                <a href="nilai" class="btn btn-secondary">
                                    <i class="bi bi-x-lg"></i> Batal
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        (function() {
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
</body>
</html>
