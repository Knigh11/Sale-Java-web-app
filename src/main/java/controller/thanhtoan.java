package controller;

import java.io.IOException;
import bean.giobean;
import bean.khachhangbean;
import bo.giohangbo;
import dao.chitiethoadon;
import dao.hoadon;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class thanhtoan
 */
@WebServlet("/thanhtoan")
public class thanhtoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thanhtoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		hoadon hd= new hoadon();
		chitiethoadon  ct = new chitiethoadon();
		HttpSession ss=request.getSession();
		khachhangbean kh= (khachhangbean) ss.getAttribute("kh");
		
			if(kh!=null) {
				giohangbo gh= (giohangbo)ss.getAttribute("gio");
				hd.Them(kh.getMakh());//them vao 1 hoa don;
				int mahd=hd.mahoadon();
				for(giobean g: gh.ds) {
					ct.them(g.getMacafe(), (int) g.getSoLuong(), mahd);
					}
		
				ss.removeAttribute("gio");
				}
		RequestDispatcher rd = request.getRequestDispatcher("home");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
