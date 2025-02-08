package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.cfbean;

public class cfdao {

  public ArrayList<cfbean> getcf() {

    try {
      ArrayList<cfbean> dscf = new ArrayList<cfbean>();
      // b1: ket noi vao csdl
      CoSodao cs = new CoSodao();
      cs.KetNoi();

      // b2: Lay du lieu ve
      String sql = "select * from cafe";
      PreparedStatement cmd = cs.cn.prepareStatement(sql);
      ResultSet rs = cmd.executeQuery();
      while (rs.next()) {
        String macafe = rs.getString("macafe");
        String tencafe = rs.getString("tencafe");
        long soLuong = rs.getLong("soluong");
        long gia = rs.getLong("gia");
        String anh = rs.getString("anh");
        String maLoai = rs.getString("maloai");
        dscf.add(new cfbean(macafe, tencafe, soLuong, gia, anh, maLoai));

      }

      rs.close();
      cs.cn.close();

      return dscf;
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
      return null;
    }


  }

  public int them(cfbean s) throws Exception {
    CoSodao cs = new CoSodao();
    cs.KetNoi();
    System.out.println("Đường dẫn ảnh: " + s.getAnh());

    String sql = "insert into cafe(macafe,tencafe, soluong, maloai,anh, gia)\r\n"
        + "values(?, ?, ?, ?, ?,?)";
    PreparedStatement cmd = cs.cn.prepareStatement(sql);
    cmd.setString(1, s.getMacafe());
    cmd.setString(2, s.getTencafe());
    cmd.setLong(3, s.getSoLuong());
    cmd.setString(4, s.getMaLoai());
    cmd.setString(5, s.getAnh());
    cmd.setLong(6, s.getGia());
    int kq = cmd.executeUpdate();
    cmd.close();
    return kq;

  }

  public int sua(String ten, String maloai, long soluong, long gia, String ma) throws Exception {
    CoSodao cs = new CoSodao();
    cs.KetNoi();

    String sql = "update cafe\r\n" + "set tencafe = ?, maloai = ?, soluong = ?, gia = ?\r\n"
        + "where macafe = ?";
    PreparedStatement cmd = cs.cn.prepareStatement(sql);
    cmd.setString(1, ten);
    cmd.setString(2, maloai);
    cmd.setLong(3, soluong);
    cmd.setLong(4, gia);
    cmd.setString(5, ma);
    int kq = cmd.executeUpdate();
    cmd.close();
    return kq;
  }

  public int xoa(String masp) throws Exception {
    CoSodao cs = new CoSodao();
    cs.KetNoi();
    String sql = "delete from ChiTietHoaDon where macafe=?;" + "delete from cafe where macafe=?";
    PreparedStatement cmd = cs.cn.prepareStatement(sql);
    cmd.setString(1, masp);
    cmd.setString(2, masp);
    int kq = cmd.executeUpdate();
    cmd.close();
    return kq;

  }


}
