package controller;

import java.io.IOException;
import java.util.ArrayList;
import bean.cfbean;
import bean.loaibean;
import bo.cfbo;
import bo.loaibo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class home
 */
@WebServlet("/home")
public class home extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public home() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub

    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    loaibo lbo = new loaibo();
    ArrayList<loaibean> dsloai = lbo.getloai();

    request.setAttribute("dsloai", dsloai);

    cfbo sbo = new cfbo();
    ArrayList<cfbean> ds = sbo.getcf();


    if (request.getParameter("search") != null) {
      ds = sbo.timKiemTheoTen(ds, request.getParameter("search"));

    } else if (request.getParameter("ml") != null)

    {
      ds = sbo.timKiemTheoLoai(ds, request.getParameter("ml"));

    }
    int trang;
    if (request.getParameter("trang") == null) {
      trang = 1;
    } else {
      trang = Integer.parseInt(request.getParameter("trang"));
    }
    request.setAttribute("search", request.getParameter("search"));
    request.setAttribute("trang", trang);
    request.setAttribute("ds", ds);
    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
    rd.forward(request, response);
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
