<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${mahasiswa != null ? 'Edit' : 'Tambah'} Mahasiswa - Sistem Akademik</title>
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
                            <i class="bi bi-person-plus"></i>
                            <c:choose>
                                <c:when test="${mahasiswa != null}">
                                    Edit Data Mahasiswa
                                </c:when>
                                <c:otherwise>
                                    Tambah Mahasiswa Baru
                                </c:otherwise>
                            </c:choose>
                        </h5>
                    </div>
                    <div class="card-body">
                        <form method="post" action="mahasiswa" class="needs-validation" novalidate>
                            <input type="hidden" name="action" value="${mahasiswa != null ? 'update' : 'save'}">
                            <c:if test="${mahasiswa != null}">
                                <input type="hidden" name="id" value="${mahasiswa.idMahasiswa}">
                            </c:if>

                            <div class="mb-3">
                                <label for="nim" class="form-label">NIM <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="nim" name="nim" value="${mahasiswa != null ? mahasiswa.nim : ''}" required>
                            </div>

                            <div class="mb-3">
                                <label for="nama" class="form-label">Nama Mahasiswa <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="nama" name="nama" value="${mahasiswa != null ? mahasiswa.namaMahasiswa : ''}" required>
                            </div>

                            <div class="mb-3">
                                <label for="prodi" class="form-label">Program Studi <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="prodi" name="prodi" value="${mahasiswa != null ? mahasiswa.programStudi : ''}" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${mahasiswa != null ? mahasiswa.email : ''}">
                            </div>

                            <div class="mb-3">
                                <label for="noTelpon" class="form-label">No. Telepon</label>
                                <input type="tel" class="form-control" id="noTelpon" name="noTelpon" value="${mahasiswa != null ? mahasiswa.noTelpon : ''}">
                            </div>

                            <div class="mb-3">
                                <label for="alamat" class="form-label">Alamat</label>
                                <textarea class="form-control" id="alamat" name="alamat" rows="3">${mahasiswa != null ? mahasiswa.alamat : ''}</textarea>
                            </div>

                            <div class="mb-3">
                                <label for="tglLahir" class="form-label">Tanggal Lahir</label>
                                <input type="date" class="form-control" id="tglLahir" name="tglLahir" value="${mahasiswa != null ? mahasiswa.tanggalLahir : ''}">
                            </div>

                            <div class="mb-3">
                                <label for="jenisKelamin" class="form-label">Jenis Kelamin</label>
                                <select class="form-select" id="jenisKelamin" name="jenisKelamin">
                                    <option value="">-- Pilih --</option>
                                    <option value="Laki-laki" ${mahasiswa != null && mahasiswa.jenisKelamin == 'Laki-laki' ? 'selected' : ''}>Laki-laki</option>
                                    <option value="Perempuan" ${mahasiswa != null && mahasiswa.jenisKelamin == 'Perempuan' ? 'selected' : ''}>Perempuan</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="status" class="form-label">Status <span class="text-danger">*</span></label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="">-- Pilih Status --</option>
                                    <option value="Aktif" ${mahasiswa != null && mahasiswa.status == 'Aktif' ? 'selected' : ''}>Aktif</option>
                                    <option value="Tidak Aktif" ${mahasiswa != null && mahasiswa.status == 'Tidak Aktif' ? 'selected' : ''}>Tidak Aktif</option>
                                    <option value="Lulus" ${mahasiswa != null && mahasiswa.status == 'Lulus' ? 'selected' : ''}>Lulus</option>
                                </select>
                            </div>

                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-lg"></i> Simpan
                                </button>
                                <a href="mahasiswa" class="btn btn-secondary">
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
