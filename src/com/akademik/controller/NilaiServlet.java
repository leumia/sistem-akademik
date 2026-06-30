package com.akademik.controller;

import com.akademik.dao.MahasiswaDAO;
import com.akademik.dao.MataKuliahDAO;
import com.akademik.dao.NilaiDAO;
import com.akademik.model.Mahasiswa;
import com.akademik.model.MataKuliah;
import com.akademik.model.Nilai;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/nilai")
public class NilaiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NilaiDAO nilaiDAO = new NilaiDAO();
    private MahasiswaDAO mahasiswaDAO = new MahasiswaDAO();
    private MataKuliahDAO mataKuliahDAO = new MataKuliahDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        if (session.getAttribute("dosen") == null) {
            response.sendRedirect("login");
            return;
        }
        
        String action = request.getParameter("action");
        
        if (action == null || action.equals("list")) {
            listNilai(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        } else if (action.equals("delete")) {
            deleteNilai(request, response);
        } else if (action.equals("transcript")) {
            showTranscript(request, response);
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
            saveNilai(request, response);
        } else if (action.equals("update")) {
            updateNilai(request, response);
        }
    }
    
    private void listNilai(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Nilai> list = nilaiDAO.getAll();
        
        request.setAttribute("nilais", list);
        request.getRequestDispatcher("nilai/list.jsp").forward(request, response);
    }
    
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Mahasiswa> mahasiswas = mahasiswaDAO.getAll();
        List<MataKuliah> mataKuliahs = mataKuliahDAO.getAll();
        
        request.setAttribute("mahasiswas", mahasiswas);
        request.setAttribute("mataKuliahs", mataKuliahs);
        request.getRequestDispatcher("nilai/form.jsp").forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        Nilai nilai = nilaiDAO.getById(id);
        
        List<Mahasiswa> mahasiswas = mahasiswaDAO.getAll();
        List<MataKuliah> mataKuliahs = mataKuliahDAO.getAll();
        
        request.setAttribute("nilai", nilai);
        request.setAttribute("mahasiswas", mahasiswas);
        request.setAttribute("mataKuliahs", mataKuliahs);
        request.getRequestDispatcher("nilai/form.jsp").forward(request, response);
    }
    
    private void showTranscript(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idMahasiswa = Integer.parseInt(request.getParameter("id"));
        Mahasiswa mahasiswa = mahasiswaDAO.getById(idMahasiswa);
        List<Nilai> nilais = nilaiDAO.getByMahasiswa(idMahasiswa);
        
        request.setAttribute("mahasiswa", mahasiswa);
        request.setAttribute("nilais", nilais);
        request.getRequestDispatcher("nilai/transcript.jsp").forward(request, response);
    }
    
    private void saveNilai(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int idMahasiswa = Integer.parseInt(request.getParameter("idMahasiswa"));
        int idMataKuliah = Integer.parseInt(request.getParameter("idMataKuliah"));
        double nilaiTugas = Double.parseDouble(request.getParameter("nilaiTugas"));
        double nilaiUts = Double.parseDouble(request.getParameter("nilaiUts"));
        double nilaiUas = Double.parseDouble(request.getParameter("nilaiUas"));
        
        Nilai nilai = new Nilai(idMahasiswa, idMataKuliah, nilaiTugas, nilaiUts, nilaiUas);
        
        if (nilaiDAO.insert(nilai)) {
            response.sendRedirect("nilai?success=1");
        } else {
            response.sendRedirect("nilai?error=1");
        }
    }
    
    private void updateNilai(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        double nilaiTugas = Double.parseDouble(request.getParameter("nilaiTugas"));
        double nilaiUts = Double.parseDouble(request.getParameter("nilaiUts"));
        double nilaiUas = Double.parseDouble(request.getParameter("nilaiUas"));
        
        Nilai nilai = nilaiDAO.getById(id);
        nilai.setNilaiTugas(nilaiTugas);
        nilai.setNilaiUts(nilaiUts);
        nilai.setNilaiUas(nilaiUas);
        
        if (nilaiDAO.update(nilai)) {
            response.sendRedirect("nilai?success=2");
        } else {
            response.sendRedirect("nilai?error=1");
        }
    }
    
    private void deleteNilai(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        if (nilaiDAO.delete(id)) {
            response.sendRedirect("nilai?success=3");
        } else {
            response.sendRedirect("nilai?error=1");
        }
    }
}
