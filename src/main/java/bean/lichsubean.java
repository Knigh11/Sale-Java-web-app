package bean;

import java.util.Date;

public class lichsubean {
	
	String tencafe;
	int SoLuongMua;
	int gia;
	int ThanhTien;
	boolean damua;
	Date Ngaymua;
	
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public lichsubean(String tencafe, int soLuongMua, int gia, int thanhTien, boolean damua, Date ngaymua) {
		super();
		this.tencafe = tencafe;
		SoLuongMua = soLuongMua;
		this.gia = gia;
		ThanhTien = thanhTien;
		this.damua = damua;
		Ngaymua = ngaymua;
	}










	public String getTencafe() {
		return tencafe;
	}


	public void setTencafe(String tencafe) {
		this.tencafe = tencafe;
	}


	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public int getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(int thanhTien) {
		ThanhTien = thanhTien;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}


	public Date getNgaymua() {
		return Ngaymua;
	}


	public void setNgaymua(Date ngaymua) {
		Ngaymua = ngaymua;
	}
	
	
	
	
}
