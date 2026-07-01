<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Surat Apps - Sistem Akademik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f4c75 0%, #1b7a8d 50%, #2a9d6f 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        /* Animated Background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120"><path d="M0,50 Q300,0 600,50 T1200,50 L1200,120 L0,120 Z" fill="rgba(255,255,255,0.05)"/></svg>');
            animation: wave 15s linear infinite;
            z-index: 0;
        }

        @keyframes wave {
            0% { transform: translateX(0); }
            100% { transform: translateX(1200px); }
        }

        .container-login {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 500px;
            padding: 20px;
        }

        .card-login {
            border: none;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            backdrop-filter: blur(10px);
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card-header-login {
            background: linear-gradient(135deg, #0f4c75 0%, #1b7a8d 100%);
            padding: 40px 20px;
            text-align: center;
            color: white;
            position: relative;
        }

        .logo-circle {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            animation: bounce 0.6s ease-out;
        }

        @keyframes bounce {
            0% {
                transform: scale(0);
            }
            50% {
                transform: scale(1.1);
            }
            100% {
                transform: scale(1);
            }
        }

        .logo-circle i {
            font-size: 40px;
            color: #0f4c75;
        }

        .card-header-login h2 {
            font-weight: 700;
            font-size: 28px;
            margin: 10px 0;
            letter-spacing: 1px;
        }

        .card-header-login p {
            font-size: 13px;
            margin: 0;
            opacity: 0.9;
            letter-spacing: 0.5px;
        }

        .card-body-login {
            padding: 40px;
            background: white;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            font-weight: 600;
            color: #0f4c75;
            margin-bottom: 10px;
            font-size: 14px;
            display: block;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 12px 15px;
            font-size: 14px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        .form-control:focus {
            border-color: #0f4c75;
            background-color: #fff;
            box-shadow: 0 0 0 0.2rem rgba(15, 76, 117, 0.15);
            outline: none;
        }

        .form-control::placeholder {
            color: #aaa;
        }

        .input-group-text {
            border: 2px solid #e0e0e0;
            border-right: none;
            background-color: #f8f9fa;
            border-radius: 10px 0 0 10px;
        }

        .input-group-text.focus-input {
            border-color: #0f4c75;
        }

        .form-control.focus-input {
            border-color: #0f4c75;
            border-left: none;
            border-radius: 0 10px 10px 0;
        }

        .btn-login {
            background: linear-gradient(135deg, #0f4c75 0%, #2a9d6f 100%);
            border: none;
            padding: 14px;
            font-weight: 700;
            border-radius: 10px;
            color: white;
            transition: all 0.3s ease;
            font-size: 16px;
            width: 100%;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(15, 76, 117, 0.3);
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(15, 76, 117, 0.4);
            color: white;
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .alert {
            border-radius: 10px;
            border: none;
            animation: slideIn 0.4s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .form-check {
            margin-bottom: 20px;
        }

        .form-check-input {
            width: 18px;
            height: 18px;
            border-radius: 4px;
            border: 2px solid #0f4c75;
            cursor: pointer;
        }

        .form-check-input:checked {
            background-color: #0f4c75;
            border-color: #0f4c75;
        }

        .form-check-label {
            margin-left: 8px;
            color: #333;
            cursor: pointer;
            font-size: 14px;
        }

        .footer-login {
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            margin-top: 30px;
            font-size: 12px;
            position: relative;
            z-index: 1;
        }

        .footer-login p {
            margin: 5px 0;
        }

        /* Icon for password toggle */
        .password-toggle {
            cursor: pointer;
            color: #0f4c75;
        }

        .password-toggle:hover {
            color: #2a9d6f;
        }

        /* Error styling */
        .invalid-feedback {
            display: block;
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
        }

        /* Responsive */
        @media (max-width: 576px) {
            .container-login {
                max-width: 100%;
            }

            .card-header-login {
                padding: 30px 20px;
            }

            .card-body-login {
                padding: 30px 20px;
            }

            .card-header-login h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container-login">
        <div class="card card-login">
            <!-- Header -->
            <div class="card-header-login">
                <div class="logo-circle">
                    <i class="bi bi-envelope-at"></i>
                </div>
                <h2>E-SURAT APPS</h2>
                <p>SISTEM AKADEMIK MANAJEMEN DATA</p>
            </div>

            <!-- Body -->
            <div class="card-body-login">
                <!-- Alert Messages -->
                <c:if test="${param.error == 'invalid'}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-circle"></i>
                        <strong>Login Gagal!</strong> Email atau password salah.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.error == 'session'}">
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        <i class="bi bi-exclamation-triangle"></i>
                        <strong>Akses Ditolak!</strong> Silakan login terlebih dahulu.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>
                <c:if test="${param.logout == 'success'}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="bi bi-check-circle"></i>
                        <strong>Logout Berhasil!</strong> Anda telah keluar dari sistem.
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Login Form -->
                <form method="post" action="login" class="needs-validation" novalidate>
                    <!-- Email Field -->
                    <div class="form-group">
                        <label for="email" class="form-label">
                            <i class="bi bi-envelope"></i> Email
                        </label>
                        <input type="email" class="form-control" id="email" name="email" 
                               placeholder="admin@teknik.com / staff@teknik.com" required>
                        <div class="invalid-feedback">Email harus diisi dan valid.</div>
                    </div>

                    <!-- Password Field -->
                    <div class="form-group">
                        <label for="password" class="form-label">
                            <i class="bi bi-lock"></i> Password
                        </label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" name="password" 
                                   placeholder="Masukkan password" required>
                            <span class="input-group-text">
                                <i class="bi bi-eye password-toggle" id="togglePassword" 
                                   onclick="togglePasswordVisibility()"></i>
                            </span>
                        </div>
                        <div class="invalid-feedback">Password harus diisi.</div>
                    </div>

                    <!-- Remember Me -->
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember">
                        <label class="form-check-label" for="remember">
                            Ingat saya di perangkat ini
                        </label>
                    </div>

                    <!-- Login Button -->
                    <button type="submit" class="btn btn-login">
                        <i class="bi bi-box-arrow-in-right"></i> Login
                    </button>
                </form>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer-login">
            <p><strong>Demo Credentials:</strong></p>
            <p>Email: <strong>admin@teknik.com</strong> | Password: <strong>admin123</strong></p>
            <p>&copy; 2026 Sistem Akademik. All rights reserved.</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation
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

        // Toggle password visibility
        function togglePasswordVisibility() {
            var passwordInput = document.getElementById('password');
            var toggleIcon = document.getElementById('togglePassword');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('bi-eye');
                toggleIcon.classList.add('bi-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('bi-eye-slash');
                toggleIcon.classList.add('bi-eye');
            }
        }
    </script>
</body>
</html>
