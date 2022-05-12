package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="CTPD")
public class CTPD {
	@Id 
	@GeneratedValue
	private int MACTPD;
	private int SOLUONG;
	private int GIA;
	@ManyToOne
	@JoinColumn(name="MASP")
	private SanPham sp;
	@ManyToOne
	@JoinColumn(name="MAPD")
	private PhieuDat pd;
	public int getMACTPD() {
		return MACTPD;
	}
	public void setMACTPD(int mACTPD) {
		MACTPD = mACTPD;
	}
	public int getSOLUONG() {
		return SOLUONG;
	}
	public void setSOLUONG(int sOLUONG) {
		SOLUONG = sOLUONG;
	}
	public int getGIA() {
		return GIA;
	}
	public void setGIA(int gIA) {
		GIA = gIA;
	}
	public SanPham getSp() {
		return sp;
	}
	public void setSp(SanPham sp) {
		this.sp = sp;
	}
	public PhieuDat getPd() {
		return pd;
	}
	public void setPd(PhieuDat pd) {
		this.pd = pd;
	}
	
}
