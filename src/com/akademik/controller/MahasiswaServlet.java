package com.akademik.controller;

import com.akademik.dao.MahasiswaDAO;
import com.akademik.model.Mahasiswa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/mahasiswa")
public class MahasiswaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MahasiswaDAO mahasiswaDAO = new MahasiswaDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session.getAttribute("dosen") == null) {
            response.sendRedirect("login");
            return;
        }
        
        String action = request.getParameter("action");
        
        if (action == null || action.equals("list")) {
            listMahasiswa(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        } else if (action.equals("delete")) {
            deleteMahasiswa(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session.getAttribute("dosen") == null) {
            response.sendRedirect("login");
            return;
        }
        
        String action = request.getParameter("action");
        
        if (action.equals("save")) {
            saveMahasiswa(request, response);
        } else if (action.equals("update")) {
            updateMahasiswa(request, response);
        }
    }
    
    private void listMahasiswa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String keyword = request.getParameter("keyword");
        List<Mahasiswa> list;
        
        if (keyword != null && !keyword.isEmpty()) {
            list = mahasiswaDAO.search(keyword);
        } else {
            list = mahasiswaDAO.getAll();
        }
        
        request.setAttribute("mahasiswas", list);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("mahasiswa/list.jsp").forward(request, response);
    }
    
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("mahasiswa/form.jsp").forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Mahasiswa mahasiswa = mahasiswaDAO.getById(id);
        request.setAttribute("mahasiswa", mahasiswa);
        request.getRequestDispatcher("mahasiswa/form.jsp").forward(request, response);
    }
    
    private void saveMahasiswa(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        String prodi = request.getParameter("prodi");
        String email = request.getParameter("email");
        String noTelpon = request.getParameter("noTelpon");
        String alamat = request.getParameter("alamat");
        String tglLahirStr = request.getParameter("tglLahir");
        String jenisKelamin = request.getParameter("jenisKelamin");
        String status = request.getParameter("status");
        
        Date tglLahir = null;
        if (tglLahirStr != null && !tglLahirStr.isEmpty()) {
            tglLahir = Date.valueOf(tglLahirStr);
        }
        
        Mahasiswa mahasiswa = new Mahasiswa();
        mahasiswa.setNim(nim);
        mahasiswa.setNamaMahasiswa(nama);
        mahasiswa.setProgramStudi(prodi);
        mahasiswa.setEmail(email);
        mahasiswa.setNoTelpon(noTelpon);
        mahasiswa.setAlamat(alamat);
        mahasiswa.setTanggalLahir(tglLahir);
        mahasiswa.setJenisKelamin(jenisKelamin);
        mahasiswa.setStatus(status);
        
        if (mahasiswaDAO.insert(mahasiswa)) {
            response.sendRedirect("mahasiswa?success=1");
        } else {
            response.sendRedirect("mahasiswa?error=1");
        }
    }
    
    private void updateMahasiswa(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        String prodi = request.getParameter("prodi");
        String email = request.getParameter("email");
        String noTelpon = request.getParameter("noTelpon");
        String alamat = request.getParameter("alamat");
        String tglLahirStr = request.getParameter("tglLahir");
        String jenisKelamin = request.getParameter("jenisKelamin");
        String status = request.getParameter("status");
        
        Date tglLahir = null;
        if (tglLahirStr != null && !tglLahirStr.isEmpty()) {
            tglLahir = Date.valueOf(tglLahirStr);
        }
        
        Mahasiswa mahasiswa = new Mahasiswa();
        mahasiswa.setIdMahasiswa(id);
        mahasiswa.setNim(nim);
        mahasiswa.setNamaMahasiswa(nama);
        mahasiswa.setProgramStudi(prodi);
        mahasiswa.setEmail(email);
        mahasiswa.setNoTelpon(noTelpon);
        mahasiswa.setAlamat(alamat);
        mahasiswa.setTanggalLahir(tglLahir);
        mahasiswa.setJenisKelamin(jenisKelamin);
        mahasiswa.setStatus(status);
        
        if (mahasiswaDAO.update(mahasiswa)) {
            response.sendRedirect("mahasiswa?success=2");
        } else {
            response.sendRedirect("mahasiswa?error=1");
        }
    }
    
    private void deleteMahasiswa(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        if (mahasiswaDAO.delete(id)) {
            response.sendRedirect("mahasiswa?success=3");
        } else {
            response.sendRedirect("mahasiswa?error=1");
        }
    }
}
