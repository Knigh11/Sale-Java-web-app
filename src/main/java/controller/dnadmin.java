package controller;

import java.io.IOException;
import bean.dnadminbean;
import bo.dnadminbo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class dnadmin
 */
@WebServlet("/dnadmin")
public class dnadmin extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public dnadmin() {
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
    dnadminbo dnbo = new dnadminbo();
    dnadminbean dn = null;
    RequestDispatcher rd;
    if (un != null && pass != null) {
      // Tao doi tuong session
      HttpSession session = request.getSession();
      // Neu chua tao session
      if (session.getAttribute("admin") == null) {
        dn = new dnadminbean();
        // session.setAttribute("kh", kh);//Tao bien session dn
      }
      dn = dnbo.ktdn(un, pass);
      if (dn == null)
        rd = request.getRequestDispatcher("dnadmin.jsp?kt=1");
      else {
        session.setAttribute("admin", dn);
        rd = request.getRequestDispatcher("admin");
      }
    } else
      rd = request.getRequestDispatcher("dnadmin.jsp");

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
