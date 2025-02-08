package bo;

import java.util.ArrayList;

import bean.xacnhanbean;

import dao.xacnhandao;

public class xacnhanbo {
	 xacnhandao xdao= new xacnhandao();
	  public ArrayList<xacnhanbean> getdanhsach(){
		return  xdao.getdanhsach();
	  }
	  public ArrayList<xacnhanbean> getdsxn(){
		  return xdao.getdsxn();
	  }
	  public void Xacnhan(long mct) {
			for(xacnhanbean ad:xdao.getdanhsach()) {
				if(ad.getMaChiTietHD()==(mct)) {
					xdao.xacnhan(mct);
				}
			}
		}

}
