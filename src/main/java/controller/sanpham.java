package controller;

import java.io.File;
import java.io.IOException;
import bo.cfbo;
import bo.loaibo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class sanpham
 */
@WebServlet("/sanpham")
public class sanpham extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public sanpham() {
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
    cfbo spb = new cfbo();
    loaibo catebo = new loaibo();
    HttpSession ss = request.getSession();

    if (request.getParameter("update2") != null) {
      String ten = request.getParameter("ten");
      String maloai = request.getParameter("ml");
      long soluong = 0;
      String slStr = request.getParameter("sl");
      if (slStr != null && !slStr.trim().isEmpty()) {
        soluong = Long.parseLong(slStr.trim());
      }
      long gia = 0;
      String giaStr = request.getParameter("gia");
      if (giaStr != null && !giaStr.trim().isEmpty()) {
        gia = Long.parseLong(giaStr.trim());
      }
      if (ten != null && maloai != null && soluong != 0 && gia != 0) {
        spb.sua(ten, maloai, soluong, gia, request.getParameter("update2"));
      }
    }
    if (request.getParameter("xoa") != null) {
      spb.xoa(request.getParameter("xoa"));
      deleteImage(request.getParameter("url"));
    }

    ss.setAttribute("dssanpham", spb.getcf());
    ss.setAttribute("dshang", catebo.getloai());
    RequestDispatcher rd = request.getRequestDispatcher("addcafe.jsp");
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

  public void deleteImage(String imagePath) {
    // Chuyển đổi đường dẫn tương đối thành đường dẫn tuyệt đối
    String absolutePath =
        getServletContext().getRealPath("") + File.separator + imagePath.replace("./", "");
    File file = new File(absolutePath);

    if (file.exists()) {
      if (file.delete()) {
        System.out.println("Ảnh đã được xóa: " + absolutePath);
      } else {
        System.out.println("Không thể xóa ảnh: " + absolutePath);
      }
    } else {
      System.out.println("Ảnh không tồn tại: " + absolutePath);
    }
  }
}
