package com.akademik.controller;

import com.akademik.dao.DosenDAO;
import com.akademik.model.Dosen;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cek apakah sudah login
        HttpSession session = request.getSession();
        if (session.getAttribute("dosen") != null) {
            response.sendRedirect("index.jsp");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        DosenDAO dosenDAO = new DosenDAO();
        Dosen dosen = dosenDAO.login(username, password);
        
        if (dosen != null) {
            // Login berhasil, simpan dalam session
            HttpSession session = request.getSession();
            session.setAttribute("dosen", dosen);
            response.sendRedirect("index.jsp");
        } else {
            // Login gagal
            request.setAttribute("error", "Username atau Password salah!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
