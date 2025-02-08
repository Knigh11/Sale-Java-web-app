package bo;

import java.util.ArrayList;
import bean.cfbean;
import dao.cfdao;

public class cfbo {
  cfdao cfdao = new cfdao();
  ArrayList<cfbean> ds = cfdao.getcf();

  public ArrayList<cfbean> getcf() {
    return ds;
  }

  public ArrayList<cfbean> timKiemTheoLoai(ArrayList<cfbean> ds, String maLoai) {
    ArrayList<cfbean> dsCungMa = new ArrayList<cfbean>();
    for (cfbean item : ds) {
      if (item.getMaLoai().equals(maLoai)) {
        dsCungMa.add(item);
      }
    }

    return dsCungMa;
  }

  public ArrayList<cfbean> timKiemTheoTen(ArrayList<cfbean> ds, String tencf) {
    ArrayList<cfbean> dsCungTen = new ArrayList<cfbean>();
    for (cfbean item : ds) {
      if (item.getTencafe().toLowerCase().trim().contains(tencf.toLowerCase().trim())
          || item.getMacafe().toLowerCase().trim().contains(tencf.toLowerCase().trim())) {
        dsCungTen.add(item);
      }
    }

    return dsCungTen;
  }

  public void them_sp(cfbean s) {
    try {
      cfdao.them(s);
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

  }

  public void sua(String ten, String maloai, long soluong, long gia, String ma) {
    try {
      cfdao.sua(ten, maloai, soluong, gia, ma);
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

  }

  public void xoa(String ma) {
    try {
      cfdao.xoa(ma);
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }

  }

}
