package bean;

public class khachhangbean {
    @Override
  public String toString() {
    return "khachhangbean [makh=" + makh + ", hoten=" + hoten + ", diachi=" + diachi + ", email="
        + email + ", tendangnhap=" + tendangnhap + ", matkhau=" + matkhau + "]";
  }

    int makh;
    String hoten;
    String diachi;
    String email;
    String tendangnhap;
    String matkhau;
    
    public khachhangbean() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    public khachhangbean(int makh, String hoten, String diachi, String email, String tendangnhap, String matkhau) {
        super();
        this.makh = makh;
        this.hoten = hoten;
        this.diachi = diachi;
        this.email = email;
        this.tendangnhap = tendangnhap;
        this.matkhau = matkhau;
    }
    


    public int getMakh() {
        return makh;
    }


    public void setMakh(int makh) {
        this.makh = makh;
    }


    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTendangnhap() {
        return tendangnhap;
    }

    public void setTendangnhap(String tendangnhap) {
        this.tendangnhap = tendangnhap;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }
}
