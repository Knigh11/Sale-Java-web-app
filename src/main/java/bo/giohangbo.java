package bo;

import java.util.ArrayList;

import bean.giobean;

public class giohangbo {
	public ArrayList<giobean> ds = new ArrayList<giobean>();
	public void Them(String maSach, String tenSach, long giaSach, long soLuong, String anh) {
		for (giobean g:ds) {
			if (g.getMacafe().equals(maSach)) {
				g.setSoLuong(soLuong+ g.getSoLuong());
				return;
			}
		}
		
		ds.add(new giobean(maSach, tenSach, giaSach, soLuong, anh));
		
	}
	
	public void Xoa(String maSach) {
		for (int i=0; i<ds.size(); i++) {
			if (ds.get(i).getMacafe().equals(maSach)) {
				ds.remove(i);
				return;
			}
		}
	}
	
	public void XoaAll() {
		ds.removeAll(ds);
	}
	
	public long TongTien() {
		long Sum = 0;
		for (giobean g: ds) {
			Sum += g.getThanhtien();
		}
		return Sum;
	}
	
	public int count() {
		int count = ds.size();
		return count;
	}
	
	public void XoaNhieu(String [] list) {
		for (String item: list) {
			for (int i=0; i<ds.size(); i++) {
				if (item.equals(ds.get(i).getMacafe())) {
					ds.remove(i);
					i--;
				}
			}
		}
	}
	public void sua(String masach, long sl) {
		for(int i =0; i< ds.size(); i++) {
			if(ds.get(i).getMacafe().equals(masach)) {
				ds.get(i).setSoLuong(sl);;
			}
		}
	}
}
