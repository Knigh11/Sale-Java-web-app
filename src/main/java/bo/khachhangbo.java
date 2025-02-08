package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.khachhang;

public class khachhangbo {
  khachhang khgdao = new khachhang();

  public ArrayList<khachhangbean> getdskhachhang() {

    return khgdao.getdskhachhang();
  }

  public khachhangbean kiemtradangnhap(String un, String pass) {
    ArrayList<khachhangbean> dskhg = khgdao.getdskhachhang();
    khachhangbean khg = new khachhangbean();
    if (dskhg != null) {
      for (khachhangbean kh : dskhg) {
        if (un.trim().replaceAll("\\s+", " ").equals(kh.getTendangnhap()) && pass.trim().replaceAll("\\s+", " ").equals(kh.getMatkhau())) {
          khg = kh;
          return khg;
        }
      }
    }
    return null;
  }

  public boolean themkhachhang(String hoten, String diachi, String email, String tendangnhap,
      String matkhau) {
    try {
      ArrayList<khachhangbean> dskhg = khgdao.getdskhachhang();
      for (khachhangbean kh : dskhg) {
        if (email.equals(kh.getEmail()) || tendangnhap.equals(kh.getTendangnhap())) {
          return false;
        }
      }

      khgdao.ThemKhachHang(hoten, diachi, email, tendangnhap, matkhau);
      return true;
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
      return true;
    }


  }

  public static void main(String[] args) {
    khachhangbo khg = new khachhangbo();
    String un = "pctrung";
    String pass = "123";
    khachhangbean khach = khg.kiemtradangnhap(un,pass);
    System.out.println(khach.toString());
    
  }
}
