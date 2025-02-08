
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.loaibean;

public class loaidao {
  public ArrayList<loaibean> getloai() {
    try {
      ArrayList<loaibean> dsloai = new ArrayList<loaibean>();
      // b1: ket noi vao csdl
      CoSodao cs = new CoSodao();
      cs.KetNoi();
      // b2: Lay du lieu ve
      String sql = "select * from loai";
      PreparedStatement cmd = cs.cn.prepareStatement(sql);
      ResultSet rs = cmd.executeQuery();
      while (rs.next()) {
        String maloai = rs.getString("maloai");
        String tenloai = rs.getString("tenloai");
        dsloai.add(new loaibean(maloai, tenloai));
      }

      rs.close();
      cs.cn.close();

      return dsloai;
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
      return null;
    }
  }

  public int themloai(String maloai, String tenloai) throws Exception {
    CoSodao cs = new CoSodao();
    cs.KetNoi();

    String sql = "insert into loai(maloai, tenloai) values (?,?)";
    PreparedStatement cmd = cs.cn.prepareStatement(sql);
    cmd.setString(1, maloai);
    cmd.setString(2, tenloai);

    return cmd.executeUpdate();
  }

  public int xoa(String maloai) throws Exception {
    // Ket Noi
    CoSodao cs = new CoSodao();
    cs.KetNoi();
    String sql = "delete from loai where maloai=?";
    PreparedStatement cmd = cs.cn.prepareStatement(sql);
    cmd.setString(1, maloai);
    int kq = cmd.executeUpdate();
    cmd.close();
    return kq;
  }

  public int update(String ten, String maloai) throws Exception {
    // Ket Noi
    CoSodao cs = new CoSodao();
    cs.KetNoi();
    String sql = "update loai set tenloai =? " + " where maloai=?";
    PreparedStatement cmd = cs.cn.prepareStatement(sql);
    cmd.setString(1, ten);
    cmd.setString(2, maloai);

    int kq = cmd.executeUpdate();
    cmd.close();
    return kq;

  }

  public static void main(String[] args) throws Exception {

  }


}
