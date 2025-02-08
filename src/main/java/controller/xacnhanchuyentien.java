package controller;

import java.io.IOException;
import bo.xacnhanbo;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class xacnhanchuyentien
 */
@WebServlet("/xacnhanchuyentien")
public class xacnhanchuyentien extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public xacnhanchuyentien() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub
    xacnhanbo xnbo = new xacnhanbo();
    String mct = request.getParameter("mct");
    long mact = Long.parseLong(mct);
    if (mct != null) {
      xnbo.Xacnhan(mact);
      // request.setAttribute("dsxn", xnbo.getdanhsach());

    }
    RequestDispatcher rd = request.getRequestDispatcher("xacnhanadmin");
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
