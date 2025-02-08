package controller;

import java.io.IOException;
import java.util.ArrayList;
import bean.cfbean;
import bean.khachhangbean;
import bo.cfbo;
import bo.giohangbo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class giohang
 */
@WebServlet("/giohang")
public class giohang extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public giohang() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    HttpSession session = request.getSession();
    khachhangbean kh = (khachhangbean) session.getAttribute("kh");
    cfbo sbo = new cfbo();
    ArrayList<cfbean> ds2 = sbo.getcf();


    if (request.getParameter("search") != null) {
      ds2 = sbo.timKiemTheoTen(ds2, request.getParameter("search"));

    }

    request.setAttribute("ds", ds2);

    giohangbo gh = new giohangbo();

    if (kh == null) {
      request.setAttribute("kh", true);
      RequestDispatcher rd = request.getRequestDispatcher("ktdn");
      rd.forward(request, response);
    } else {

      if (session.getAttribute("gio") == null) {
        gh = new giohangbo();
        session.setAttribute("gio", gh);
      }
      // b1: gan session vao 1 bien
      gh = (giohangbo) session.getAttribute("gio");
      // b2: thao tac tren bien
      if (request.getParameter("remove") != null) {
        String ma = request.getParameter("mcf");
        gh.Xoa(ma);

      } else if (request.getParameter("add") != null) {
        String macf = request.getParameter("mcf");
        long soLuong = (long) 1;
        if (request.getParameter("quantity") != null)
          soLuong = Long.parseLong(request.getParameter("quantity"));

        String ten = request.getParameter("ten");
        long gia = Long.parseLong(request.getParameter("gia"));
        String anh = request.getParameter("anh");
        gh.Them(macf, ten, gia, soLuong, anh);
      }

      else if (request.getParameter("removeall") != null) {
        gh.XoaAll();


      } else if (request.getParameter("suanhieu") != null
          && request.getParameter("delete") != null) {

        gh.XoaNhieu(request.getParameterValues("delete"));
      } else if (request.getParameter("mcf2") != null) {
        long soLuong = Long.parseLong(request.getParameter("quantity"));
        gh.sua(request.getParameter("mcf2"), soLuong);
      }
    }

    // RequestDispatcher rd = request.getRequestDispatcher("htgio");
    // rd.forward(request, response);
    response.sendRedirect("htgio");
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }

}
