package bo;

import dao.hoadon;

public class hoadonbo {
	hoadon hddao= new hoadon();
	public int maxhoadon() {
		return hddao.mahoadon();
	}
	public int them(int makh) {
		return hddao.Them(makh);
	}
}
