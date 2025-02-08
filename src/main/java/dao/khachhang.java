package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.khachhangbean;

public class khachhang {
	public ArrayList<khachhangbean> getdskhachhang(){
		   try {
			   ArrayList<khachhangbean> dskhachhang= new ArrayList<khachhangbean>();
//			   b1: ket noi vao csdl
			   CoSodao cs = new CoSodao();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from KhachHang";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				   int makh = rs.getInt("makh");
				   String hoten = rs.getString("hoten");
				   String diachi = rs.getString("diachi");
				   String email = rs.getString("email");
				   String TenDangNhap = rs.getString("tendn");
				   String MatKhau = rs.getString("pass");
				   dskhachhang.add(new khachhangbean(makh,hoten, diachi, email, TenDangNhap, MatKhau));
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   
			   return dskhachhang;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	   }
	public int ThemKhachHang(String hoten, String diachi, String email, String tendangnhap, String matkhau) throws Exception{
		CoSodao cs = new CoSodao();
		cs.KetNoi();
		
     String sql = "insert into KhachHang (hoten, diachi, email, tendn, pass) values (?,?,?,?,?)";
     PreparedStatement cmd = cs.cn.prepareStatement(sql);    
     
     cmd.setString(1, hoten);
     cmd.setString(2, diachi);

     cmd.setString(3, email);
     cmd.setString(4, tendangnhap);
     cmd.setString(5, matkhau);
     
     return cmd.executeUpdate();
 }
	public static void main(String [] ts) {
		try {
			ArrayList<khachhangbean> dskhachhang= new ArrayList<khachhangbean>();
//			   b1: ket noi vao csdl
			   CoSodao cs = new CoSodao();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from KhachHang";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				   int makh = rs.getInt("makh");
				   String hoten = rs.getString("hoten");
				   String diachi = rs.getString("diachi");
				   String email = rs.getString("email");
				   String TenDangNhap = rs.getString("tendn");
				   String MatKhau = rs.getString("pass");
				   dskhachhang.add(new khachhangbean(makh,hoten, diachi, email, TenDangNhap, MatKhau));
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   
			   System.out.println(dskhachhang);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
