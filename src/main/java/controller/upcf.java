package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import bean.cfbean;
import bean.loaibean;
import bo.cfbo;
import bo.loaibo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/upcf")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 10, // 10 MB
    maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class upcf extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public upcf() {
    super();
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    cfbo spb = new cfbo();
    loaibo catebo = new loaibo();
    HttpSession session = request.getSession();

    try {
      // Lấy dữ liệu từ session
      String ma = (String) session.getAttribute("ma");
      String ten = (String) session.getAttribute("ten");
      String maloai = (String) session.getAttribute("maloai");
      Long soluong = null;
      Long gia = null;
      if (session.getAttribute("soluong") != null) {
        soluong = (Long) session.getAttribute("soluong");
      }
      if (session.getAttribute("gia") != null) {
        gia = (Long) session.getAttribute("gia");
      }
      String anh = (String) session.getAttribute("uploadedFileName");
      if (ma != null && ten != null && maloai != null && soluong != null && gia != null
          && anh != null) {
        spb.them_sp(new cfbean(ma, ten, soluong, gia, anh, maloai));

        // Xóa session sau khi lưu
        session.removeAttribute("ten");
        session.removeAttribute("uploadedFileName");
        session.removeAttribute("soluong");
        session.removeAttribute("ma");
        session.removeAttribute("maloai");
        session.removeAttribute("gia");
      }
      System.out.println("Ma: " + ma);
      System.out.println("Ten: " + ten);
      System.out.println("Maloai: " + maloai);
      System.out.println("Soluong: " + soluong);
      System.out.println("Gia: " + gia);
      System.out.println("Anh: " + anh);

      // Lấy danh sách sản phẩm
      ArrayList<cfbean> dssanpham = (ArrayList<cfbean>) spb.getcf();
      ArrayList<loaibean> dshang = (ArrayList<loaibean>) catebo.getloai();
      session.setAttribute("dssanpham", dssanpham);
      session.setAttribute("dshang", dshang);
      RequestDispatcher rd = request.getRequestDispatcher("addcafe.jsp");
      rd.forward(request, response);

    } catch (Exception e) {
      response.getWriter().println("Lỗi trong quá trình xử lý: " + e.getMessage());
      e.printStackTrace();
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");

    try {
      // Lấy dữ liệu từ form
      String ma = request.getParameter("txtmsp");
      String ten = request.getParameter("txttensp");
      String maloai = request.getParameter("txtmh");
      Long soluong = 0L;
      String slStr = request.getParameter("txtsl");
      if (slStr != null && !slStr.trim().isEmpty()) {
        soluong = Long.parseLong(slStr.trim());
      }

      // Thêm kiểm tra null và empty cho giá
      Long gia = 0L;
      String giaStr = request.getParameter("txtgia");
      if (giaStr != null && !giaStr.trim().isEmpty()) {
        gia = Long.parseLong(giaStr.trim());
      }

      // Upload file
      String uploadedFileName = null;
      for (Part part : request.getParts()) {
        if ("txtfile".equals(part.getName())) {
          String fileName = part.getSubmittedFileName();
          if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "anh";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists())
              uploadDir.mkdir();

            uploadedFileName = "./anh/" + fileName;
            part.write(uploadPath + File.separator + fileName);
          } else {
            System.out.println("Không có file nào được upload!");
          }
        }
      }
      if (ma == null || ten == null || maloai == null || uploadedFileName == null) {
        response.getWriter().println("Vui lòng điền đầy đủ thông tin");
        return;
      }

      // Lưu thông tin vào session
      HttpSession session = request.getSession();
      session.setAttribute("ma", ma);
      session.setAttribute("ten", ten);
      session.setAttribute("maloai", maloai);
      session.setAttribute("soluong", soluong);
      session.setAttribute("gia", gia);
      session.setAttribute("uploadedFileName", uploadedFileName);

      // Chuyển hướng đến doGet
      response.sendRedirect(request.getContextPath() + "/upcf");

    } catch (Exception e) {
      response.getWriter().println("Lỗi trong quá trình xử lý: " + e.getMessage());
    }
  }
}
