package dao;

import java.sql.PreparedStatement;

public class chitiethoadon {
	public int them(String macf, int soluongmua, int mahoadon) {
		try {
			CoSodao cs= new CoSodao();
			cs.KetNoi();
			String sql="insert into ChiTietHoaDon(MaCafe,SoLuongMua,MaHoaDon,DaMua) values(?,?,?,?)";
			PreparedStatement cmd= cs.cn.prepareStatement(sql);
			cmd.setString(1, macf);
			cmd.setInt(2,soluongmua);
			cmd.setInt(3,mahoadon);
			cmd.setBoolean(4, false);
			int kq= cmd.executeUpdate();
			cs.cn.close();
			return kq;
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	
	}
}
