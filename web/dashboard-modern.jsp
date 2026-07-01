<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - E-Surat Apps</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #0f4c75 0%, #1b7a8d 50%, #2a9d6f 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }

        .wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background: white;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
        }

        .sidebar-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #f0f0f0;
        }

        .logo-circle {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #0f4c75 0%, #1b7a8d 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
            margin-right: 12px;
        }

        .sidebar-title {
            flex: 1;
        }

        .sidebar-title h5 {
            margin: 0;
            color: #0f4c75;
            font-weight: 700;
            font-size: 14px;
        }

        .sidebar-title p {
            margin: 0;
            color: #999;
            font-size: 11px;
            line-height: 1.3;
        }

        .nav-menu {
            list-style: none;
            margin-bottom: 30px;
        }

        .nav-menu li {
            margin-bottom: 8px;
        }

        .nav-menu a {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            color: #666;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .nav-menu a i {
            margin-right: 12px;
            font-size: 18px;
            width: 20px;
            text-align: center;
        }

        .nav-menu a:hover {
            background-color: #f0f0f0;
            color: #0f4c75;
        }

        .nav-menu a.active {
            background: linear-gradient(135deg, #0f4c75 0%, #1b7a8d 100%);
            color: white;
        }

        .user-section {
            border-top: 2px solid #f0f0f0;
            padding-top: 20px;
            margin-top: auto;
        }

        .user-info {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #0f4c75 0%, #1b7a8d 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 18px;
            margin-right: 10px;
        }

        .user-detail h6 {
            margin: 0;
            color: #0f4c75;
            font-weight: 600;
            font-size: 13px;
        }

        .user-detail p {
            margin: 0;
            color: #999;
            font-size: 11px;
        }

        .btn-logout {
            width: 100%;
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background-color: #c82333;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            flex: 1;
            padding: 30px;
        }

        .content-wrapper {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.15);
        }

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #333;
            margin-bottom: 30px;
        }

        /* Statistics Cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .stat-card {
            border-radius: 15px;
            padding: 25px;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .stat-card.card-blue {
            background: linear-gradient(135deg, #0f4c75 0%, #1b7a8d 100%);
        }

        .stat-card.card-green {
            background: linear-gradient(135deg, #2a9d6f 0%, #1a6f50 100%);
        }

        .stat-card.card-yellow {
            background: linear-gradient(135deg, #b8d43f 0%, #9ec020 100%);
        }

        .stat-icon {
            font-size: 40px;
            opacity: 0.8;
        }

        .stat-content {
            flex: 1;
            margin-left: 20px;
        }

        .stat-content h6 {
            margin: 0 0 8px 0;
            font-size: 14px;
            font-weight: 500;
            opacity: 0.9;
        }

        .stat-number {
            font-size: 32px;
            font-weight: 700;
            margin: 0;
        }

        /* Activity Section */
        .activity-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 0 0 15px 0;
            border-bottom: 2px solid #f0f0f0;
        }

        .activity-title {
            display: flex;
            align-items: center;
            font-size: 18px;
            font-weight: 700;
            color: #333;
        }

        .activity-title i {
            margin-right: 10px;
            color: #b8d43f;
            font-size: 24px;
        }

        .real-time-badge {
            background-color: #e3f2fd;
            color: #0f4c75;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        /* Table */
        .activity-table {
            width: 100%;
            border-collapse: collapse;
        }

        .activity-table thead th {
            background-color: #f8f9fa;
            border: none;
            padding: 15px;
            text-align: left;
            font-weight: 600;
            color: #333;
            font-size: 13px;
        }

        .activity-table tbody td {
            padding: 15px;
            border-bottom: 1px solid #f0f0f0;
            color: #666;
            font-size: 13px;
        }

        .activity-table tbody tr:hover {
            background-color: #f8f9fa;
        }

        .badge {
            border-radius: 20px;
            padding: 6px 12px;
            font-size: 11px;
            font-weight: 600;
        }

        .badge-masuk {
            background-color: #cfe9ff;
            color: #0f4c75;
        }

        .badge-keluar {
            background-color: #d4f4dd;
            color: #2a9d6f;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .main-content {
                margin-left: 0;
                padding: 20px;
            }

            .content-wrapper {
                padding: 20px;
            }

            .stats-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <div class="logo-circle">
                    <i class="bi bi-envelope-at"></i>
                </div>
                <div class="sidebar-title">
                    <h5>E-SURAT APPS</h5>
                    <p>SISTEM AKADEMIK MANAJEMEN</p>
                </div>
            </div>

            <ul class="nav-menu">
                <li><a href="dashboard" class="active"><i class="bi bi-speedometer2"></i> Dashboard</a></li>
                <li><a href="mahasiswa"><i class="bi bi-people"></i> Mahasiswa</a></li>
                <li><a href="matakuliah"><i class="bi bi-book"></i> Mata Kuliah</a></li>
                <li><a href="nilai"><i class="bi bi-graph-up"></i> Nilai</a></li>
                <li><a href="#"><i class="bi bi-bell"></i> Notifikasi</a></li>
                <li><a href="#"><i class="bi bi-arrow-repeat"></i> Sinkron</a></li>
            </ul>

            <div class="user-section">
                <div class="user-info">
                    <div class="user-avatar">
                        <i class="bi bi-person"></i>
                    </div>
                    <div class="user-detail">
                        <h6>ADMIN</h6>
                        <p>Administrator</p>
                    </div>
                </div>
                <a href="logout" class="btn-logout">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="content-wrapper">
                <h1 class="page-title">Dashboard</h1>

                <!-- Statistics Cards -->
                <div class="stats-container">
                    <!-- Total Mahasiswa -->
                    <div class="stat-card card-blue">
                        <i class="bi bi-inbox stat-icon"></i>
                        <div class="stat-content">
                            <h6>Total Mahasiswa</h6>
                            <p class="stat-number">${totalMahasiswa != null ? totalMahasiswa : 0}</p>
                        </div>
                    </div>

                    <!-- Total Mata Kuliah -->
                    <div class="stat-card card-green">
                        <i class="bi bi-inbox stat-icon"></i>
                        <div class="stat-content">
                            <h6>Total Mata Kuliah</h6>
                            <p class="stat-number">${totalMataKuliah != null ? totalMataKuliah : 0}</p>
                        </div>
                    </div>

                    <!-- Total Nilai -->
                    <div class="stat-card card-yellow">
                        <i class="bi bi-gear stat-icon"></i>
                        <div class="stat-content">
                            <h6>Total Perintah Kerja</h6>
                            <p class="stat-number">${totalNilai != null ? totalNilai : 0}</p>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="activity-header">
                    <div class="activity-title">
                        <i class="bi bi-folder"></i>
                        Aktivitas Unggahan Terbaru
                    </div>
                    <span class="real-time-badge"><i class="bi bi-broadcast"></i> Real-time</span>
                </div>

                <table class="activity-table">
                    <thead>
                        <tr>
                            <th>Pengguna</th>
                            <th>Tipe Dokumen</th>
                            <th>Nomor/ID</th>
                            <th>Perihal / Tentang</th>
                            <th>Tanggal Upload</th>
                            <th>File</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${empty recentActivities}">
                            <tr>
                                <td colspan="6" style="text-align: center; padding: 30px; color: #999;">
                                    <i class="bi bi-inbox"></i> Tidak ada aktivitas terbaru
                                </td>
                            </tr>
                        </c:if>
                        <c:forEach var="activity" items="${recentActivities}" varStatus="status">
                            <tr>
                                <td><strong>Admin</strong></td>
                                <td>
                                    <span class="badge badge-masuk">MAHASISWA</span>
                                </td>
                                <td>${activity.nim}</td>
                                <td>${activity.nama}</td>
                                <td>29 Juni 2026 - 21.00 WIB</td>
                                <td>-</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
