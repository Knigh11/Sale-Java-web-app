package dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.lichsubean;

public class lichsudao {
	public ArrayList<lichsubean> getlichsu(int makh){
        try {
        	ArrayList<lichsubean> ds= new ArrayList<lichsubean>();
        	CoSodao cs = new CoSodao();
    		cs.KetNoi();
            String sql = "select * from Vlichsu where makh = ?";
           	PreparedStatement cmd = cs.cn.prepareStatement(sql);
	    	cmd.setInt(1, makh);
            
            ResultSet rs = cmd.executeQuery();
            
            while(rs.next()) {
            	
			
				int SoLuongMua = rs.getInt("SoLuongMua");
				boolean damua =rs.getBoolean("damua");
				int gia = rs.getInt("gia");
				int ThanhTien = rs.getInt("Thanhtien");
			
				String tencafe = rs.getString("tencafe");
				Date NgayMua = rs.getDate("NgayMua");
				
				ds.add(new lichsubean(tencafe, SoLuongMua, gia, ThanhTien, damua, NgayMua));
            }
            
            rs.close();
			   
            return ds;
	} catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return null;
	}
    }
}
