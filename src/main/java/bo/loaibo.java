package bo;

import java.util.ArrayList;
import bean.loaibean;
import dao.loaidao;

public class loaibo {
  loaidao ldao = new loaidao();
  ArrayList<loaibean> ds = ldao.getloai();

  public ArrayList<loaibean> getloai() {

    return ds;
  }

  public int Themloai(String maloai, String tenloai) {
    try {
      return ldao.themloai(maloai, tenloai);
    } catch (Exception e) {
      return 0;
    }
  }


  public int Xoa(String maloai) {
    try {
      return ldao.xoa(maloai);
    } catch (Exception e) {
      return 0;
    }
  }

  public int Update(String ten, String maloai) {
    try {
      return ldao.update(ten, maloai);
    } catch (Exception e) {
      return 0;
    }
  }
}
