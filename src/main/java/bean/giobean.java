package bean;

public class giobean {
	String macafe, tencafe;
	long gia, soLuong, thanhtien;
	String anh;
	
	
	public giobean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public giobean(String macafe, String tencafe, long gia, long soLuong, String anh) {
		super();
		this.macafe = macafe;
		this.tencafe = tencafe;
		this.gia = gia;
		this.soLuong = soLuong;
		this.anh = anh;
		this.thanhtien = soLuong*gia;
	}

	
	public long getThanhtien() {
		return soLuong*gia;
	}
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}

	public String getMacafe() {
		return macafe;
	}

	public void setMacafe(String macafe) {
		this.macafe = macafe;
	}

	public String getTencafe() {
		return tencafe;
	}

	public void setTencafe(String tencafe) {
		this.tencafe = tencafe;
	}

	public long getGia() {
		return gia;
	}

	public void setGia(long gia) {
		this.gia = gia;
	}

	public long getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(long soLuong) {
		this.soLuong = soLuong;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}
	
}
