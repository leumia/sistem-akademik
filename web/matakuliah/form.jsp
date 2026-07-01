<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${mataKuliah != null ? 'Edit' : 'Tambah'} Mata Kuliah - Sistem Akademik</title>
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
                            <i class="bi bi-book-plus"></i>
                            <c:choose>
                                <c:when test="${mataKuliah != null}">
                                    Edit Data Mata Kuliah
                                </c:when>
                                <c:otherwise>
                                    Tambah Mata Kuliah Baru
                                </c:otherwise>
                            </c:choose>
                        </h5>
                    </div>
                    <div class="card-body">
                        <form method="post" action="matakuliah" class="needs-validation" novalidate>
                            <input type="hidden" name="action" value="${mataKuliah != null ? 'update' : 'save'}">
                            <c:if test="${mataKuliah != null}">
                                <input type="hidden" name="id" value="${mataKuliah.idMataKuliah}">
                            </c:if>

                            <div class="mb-3">
                                <label for="kode" class="form-label">Kode Mata Kuliah <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="kode" name="kode" value="${mataKuliah != null ? mataKuliah.kodeMataKuliah : ''}" required>
                            </div>

                            <div class="mb-3">
                                <label for="nama" class="form-label">Nama Mata Kuliah <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="nama" name="nama" value="${mataKuliah != null ? mataKuliah.namaMataKuliah : ''}" required>
                            </div>

                            <div class="mb-3">
                                <label for="sks" class="form-label">SKS <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="sks" name="sks" value="${mataKuliah != null ? mataKuliah.sks : ''}" min="1" max="6" required>
                            </div>

                            <div class="mb-3">
                                <label for="semester" class="form-label">Semester <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="semester" name="semester" value="${mataKuliah != null ? mataKuliah.semester : ''}" min="1" max="8" required>
                            </div>

                            <div class="mb-3">
                                <label for="dosen" class="form-label">Dosen Pengampu</label>
                                <input type="text" class="form-control" id="dosen" name="dosen" value="${mataKuliah != null ? mataKuliah.dosenPengampu : ''}">
                            </div>

                            <div class="mb-3">
                                <label for="deskripsi" class="form-label">Deskripsi</label>
                                <textarea class="form-control" id="deskripsi" name="deskripsi" rows="4">${mataKuliah != null ? mataKuliah.deskripsi : ''}</textarea>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-lg"></i> Simpan
                                </button>
                                <a href="matakuliah" class="btn btn-secondary">
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
