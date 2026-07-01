<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Sistem Akademik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,.1);
        }
        .card-stat {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,.1);
            transition: all 0.3s ease;
        }
        .card-stat:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,.15);
        }
        .card-stat .card-body {
            padding: 25px;
        }
        .stat-icon {
            font-size: 2.5rem;
            opacity: 0.8;
        }
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            margin: 10px 0;
        }
        .stat-label {
            font-size: 0.9rem;
            color: #6c757d;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #fff;
            border-right: 1px solid #e9ecef;
        }
        .nav-link {
            color: #6c757d;
            border-radius: 5px;
            margin-bottom: 8px;
            transition: all 0.3s ease;
        }
        .nav-link:hover {
            background-color: #f8f9fa;
            color: #667eea;
        }
        .nav-link.active {
            background-color: #667eea;
            color: white;
        }
        .welcome-banner {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 10px;
            padding: 30px;
            margin-bottom: 30px;
        }
        .quick-action-btn {
            border-radius: 8px;
            padding: 15px;
            transition: all 0.3s ease;
            text-decoration: none;
            color: #fff;
        }
        .quick-action-btn:hover {
            transform: translateY(-3px);
            color: #fff;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="dashboard">
                <i class="bi bi-mortarboard"></i> <strong>Sistem Akademik</strong>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                            <i class="bi bi-person-circle"></i> 
                            <c:if test="${not empty sessionScope.dosenName}">
                                ${sessionScope.dosenName}
                            </c:if>
                            <c:if test="${empty sessionScope.dosenName}">
                                Admin
                            </c:if>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="#"><i class="bi bi-gear"></i> Pengaturan</a></li>
                            <li><a class="dropdown-item" href="#"><i class="bi bi-person"></i> Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="logout"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 sidebar p-3">
                <nav class="nav flex-column mt-3">
                    <a href="dashboard" class="nav-link active">
                        <i class="bi bi-speedometer2"></i> Dashboard
                    </a>
                    <a href="mahasiswa" class="nav-link">
                        <i class="bi bi-people"></i> Mahasiswa
                    </a>
                    <a href="matakuliah" class="nav-link">
                        <i class="bi bi-book"></i> Mata Kuliah
                    </a>
                    <a href="nilai" class="nav-link">
                        <i class="bi bi-graph-up"></i> Nilai
                    </a>
                    <hr class="my-3">
                    <a href="logout" class="nav-link">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 p-4">
                <!-- Welcome Banner -->
                <div class="welcome-banner">
                    <h4><i class="bi bi-hand-thumbs-up"></i> Selamat Datang!</h4>
                    <p class="mb-0">Anda login sebagai <strong>
                        <c:if test="${not empty sessionScope.dosenName}">
                            ${sessionScope.dosenName}
                        </c:if>
                        <c:if test="${empty sessionScope.dosenName}">
                            Administrator
                        </c:if>
                    </strong></p>
                </div>

                <!-- Statistics Cards -->
                <h5 class="mb-4"><i class="bi bi-graph-up"></i> Statistik Sistem</h5>
                <div class="row mb-4">
                    <!-- Card Mahasiswa -->
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card card-stat bg-primary text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <div class="stat-label">Total Mahasiswa</div>
                                        <div class="stat-number">${totalMahasiswa != null ? totalMahasiswa : 0}</div>
                                    </div>
                                    <i class="bi bi-people stat-icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card Mata Kuliah -->
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card card-stat bg-success text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <div class="stat-label">Total Mata Kuliah</div>
                                        <div class="stat-number">${totalMataKuliah != null ? totalMataKuliah : 0}</div>
                                    </div>
                                    <i class="bi bi-book stat-icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card Nilai -->
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card card-stat bg-info text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <div class="stat-label">Total Nilai</div>
                                        <div class="stat-number">${totalNilai != null ? totalNilai : 0}</div>
                                    </div>
                                    <i class="bi bi-graph-up stat-icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card Semester -->
                    <div class="col-md-6 col-lg-3 mb-3">
                        <div class="card card-stat bg-warning text-white">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start">
                                    <div>
                                        <div class="stat-label">Semester Aktif</div>
                                        <div class="stat-number">6</div>
                                    </div>
                                    <i class="bi bi-calendar stat-icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <h5 class="mb-4 mt-5"><i class="bi bi-lightning"></i> Akses Cepat</h5>
                <div class="row">
                    <div class="col-md-6 col-lg-3 mb-3">
                        <a href="mahasiswa?action=add" class="quick-action-btn bg-primary text-decoration-none d-block">
                            <i class="bi bi-person-plus"></i><br>
                            <small>Tambah Mahasiswa</small>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-3">
                        <a href="matakuliah?action=add" class="quick-action-btn bg-success text-decoration-none d-block">
                            <i class="bi bi-plus-circle"></i><br>
                            <small>Tambah Mata Kuliah</small>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-3">
                        <a href="nilai?action=add" class="quick-action-btn bg-info text-decoration-none d-block">
                            <i class="bi bi-graph-up"></i><br>
                            <small>Input Nilai</small>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-3 mb-3">
                        <a href="mahasiswa" class="quick-action-btn bg-warning text-decoration-none d-block">
                            <i class="bi bi-list-check"></i><br>
                            <small>Lihat Data</small>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-light text-center py-4 mt-5">
        <p class="mb-0">&copy; 2026 Sistem Akademik. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
