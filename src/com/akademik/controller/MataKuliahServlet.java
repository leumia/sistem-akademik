package com.akademik.controller;

import com.akademik.dao.MataKuliahDAO;
import com.akademik.model.MataKuliah;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/matakuliah")
public class MataKuliahServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
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
            listMataKuliah(request, response);
        } else if (action.equals("add")) {
            showAddForm(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        } else if (action.equals("delete")) {
            deleteMataKuliah(request, response);
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
            saveMataKuliah(request, response);
        } else if (action.equals("update")) {
            updateMataKuliah(request, response);
        }
    }
    
    private void listMataKuliah(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String keyword = request.getParameter("keyword");
        List<MataKuliah> list;
        
        if (keyword != null && !keyword.isEmpty()) {
            list = mataKuliahDAO.search(keyword);
        } else {
            list = mataKuliahDAO.getAll();
        }
        
        request.setAttribute("mataKuliahs", list);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("matakuliah/list.jsp").forward(request, response);
    }
    
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("matakuliah/form.jsp").forward(request, response);
    }
    
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        MataKuliah mataKuliah = mataKuliahDAO.getById(id);
        request.setAttribute("mataKuliah", mataKuliah);
        request.getRequestDispatcher("matakuliah/form.jsp").forward(request, response);
    }
    
    private void saveMataKuliah(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        String kode = request.getParameter("kode");
        String nama = request.getParameter("nama");
        int sks = Integer.parseInt(request.getParameter("sks"));
        int semester = Integer.parseInt(request.getParameter("semester"));
        String dosen = request.getParameter("dosen");
        String deskripsi = request.getParameter("deskripsi");
        
        MataKuliah mataKuliah = new MataKuliah();
        mataKuliah.setKodeMataKuliah(kode);
        mataKuliah.setNamaMataKuliah(nama);
        mataKuliah.setSks(sks);
        mataKuliah.setSemester(semester);
        mataKuliah.setDosenPengampu(dosen);
        mataKuliah.setDeskripsi(deskripsi);
        
        if (mataKuliahDAO.insert(mataKuliah)) {
            response.sendRedirect("matakuliah?success=1");
        } else {
            response.sendRedirect("matakuliah?error=1");
        }
    }
    
    private void updateMataKuliah(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String kode = request.getParameter("kode");
        String nama = request.getParameter("nama");
        int sks = Integer.parseInt(request.getParameter("sks"));
        int semester = Integer.parseInt(request.getParameter("semester"));
        String dosen = request.getParameter("dosen");
        String deskripsi = request.getParameter("deskripsi");
        
        MataKuliah mataKuliah = new MataKuliah();
        mataKuliah.setIdMataKuliah(id);
        mataKuliah.setKodeMataKuliah(kode);
        mataKuliah.setNamaMataKuliah(nama);
        mataKuliah.setSks(sks);
        mataKuliah.setSemester(semester);
        mataKuliah.setDosenPengampu(dosen);
        mataKuliah.setDeskripsi(deskripsi);
        
        if (mataKuliahDAO.update(mataKuliah)) {
            response.sendRedirect("matakuliah?success=2");
        } else {
            response.sendRedirect("matakuliah?error=1");
        }
    }
    
    private void deleteMataKuliah(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        if (mataKuliahDAO.delete(id)) {
            response.sendRedirect("matakuliah?success=3");
        } else {
            response.sendRedirect("matakuliah?error=1");
        }
    }
}
