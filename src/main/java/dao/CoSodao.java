package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import bean.lichsubean;

public class CoSodao {
  public Connection cn;

  public void KetNoi() {
    try {
      // b1: xac dinh he quan tri csdl
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
      System.out.println("Atue dz nhất xóm mã");
      cn = DriverManager.getConnection(
          "jdbc:sqlserver://HAHA\\SQLEXPRESS:1433;databaseName=QLCF;user=sa;password=123;trustServerCertificate=true");


      System.out.println("Atue quá dz");
    } catch (Exception e) {
      // TODO: handle exception
      e.printStackTrace();
    }
  }

  public static void main(String[] ts) {
    try {
      CoSodao cs = new CoSodao();
      cs.KetNoi(); // Gọi kết nối trước khi sử dụng

      lichsudao lsdao = new lichsudao();
      ArrayList<lichsubean> ds = lsdao.getlichsu(1);
      for (lichsubean item : ds) {
        System.out.println(item.getGia());
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
