package controller;

import java.io.IOException;
import bean.khachhangbean;
import bo.khachhangbo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ktdn
 */
@WebServlet("/ktdn")
public class ktdn extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public ktdn() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    String un = request.getParameter("txtun");
    String pass = request.getParameter("txtpass");

    if (un != null && pass != null) {
      // Tao doi tuong seesion
      HttpSession session = request.getSession();
      khachhangbo khgbo = new khachhangbo();
      // Neu chua tao session
      khachhangbean kh = khgbo.kiemtradangnhap(un, pass);

      if (kh != null) {
        if (session.getAttribute("kh") == null) {
          session.setAttribute("kh", null);
        }
        session.setAttribute("kh", kh);

        // Chuyen tiep ve trang htsach
        RequestDispatcher rd = request.getRequestDispatcher("home");
        rd.forward(request, response);
      } else {
        RequestDispatcher rd = request.getRequestDispatcher("dangnhapsai.jsp");
        rd.forward(request, response);
      }

    } else {
      // Chuyen tiep ve trang dangnhap
      RequestDispatcher rd = request.getRequestDispatcher("dangnhap.jsp");
      rd.forward(request, response);

    }
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
