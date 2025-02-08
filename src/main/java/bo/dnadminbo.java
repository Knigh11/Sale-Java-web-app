package bo;

import bean.dnadminbean;
import dao.dnadmin;

public class dnadminbo {
	dnadmin dndao= new dnadmin();
	  public dnadminbean ktdn(String tendn, String pass) {
		  return dndao.ktdn(tendn, pass);
	  }
}
