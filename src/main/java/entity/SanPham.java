package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;



@Entity
@Table(name="SANPHAM")
public class SanPham{
   @Id
   @GeneratedValue
   private int MASP;
   //@NotNull(message="Invalid!")
   private String TENSP;
   //@NotNull(message="Invalid!")
   //@DecimalMin(value="1000", message="Invalid!")
   private int DONGIA;
   //@DecimalMin(value="0",message="Invalid!")
   //@DecimalMax(value="1",message="Invalid!")
   private float KHUYENMAI;
   //@DecimalMin(value="0",message="Invalid!")
   private int SOLUONG;
   private boolean TINHTRANG;
   private String HINHANH;
   private String MOTA;
   private String HANG;
   @ManyToOne
   @JoinColumn(name="MALOAI")
   private LoaiSP loaisp;
	
   public int getMASP() {
		return MASP;
	}
	public void setMASP(int mASP) {
		MASP = mASP;
	}
	public String getTENSP() {
		return TENSP;
	}
	public void setTENSP(String tENSP) {
		TENSP = tENSP;
	}
	public int getDONGIA() {
		return DONGIA;
	}
	public void setDONGIA(int dONGIA) {
		DONGIA = dONGIA;
	}
	public int getSOLUONG() {
		return SOLUONG;
	}
	public void setSOLUONG(int sOLUONG) {
		SOLUONG = sOLUONG;
	}
	public boolean isTINHTRANG() {
		return TINHTRANG;
	}
	public void setTINHTRANG(boolean tINHTRANG) {
		TINHTRANG = tINHTRANG;
	}
	public String getHINHANH() {
		return HINHANH;
	}
	public void setHINHANH(String hINHANH) {
		HINHANH = hINHANH;
	}
	public String getMOTA() {
		return MOTA;
	}
	public void setMOTA(String mOTA) {
		MOTA = mOTA;
	}
	public String getHANG() {
		return HANG;
	}
	public void setHANG(String hANG) {
		HANG = hANG;
	}
	public LoaiSP getLoaisp() {
		return loaisp;
	}
	public void setLoaisp(LoaiSP loaisp) {
		this.loaisp = loaisp;
	}
	
	public float getKHUYENMAI() {
		return KHUYENMAI;
	}
	public void setKHUYENMAI(float kHUYENMAI) {
		KHUYENMAI = kHUYENMAI;
	}

}