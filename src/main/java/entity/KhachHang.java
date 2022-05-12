package entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.Valid;

@Entity
@Table(name="KHACHHANG")
public class KhachHang {
	@Id
	@GeneratedValue
	@Column(name="MAKH")
	private int MAKH;
	
	private String SDT;
	private String HOTEN;
	private String DIACHI;
	
	@OneToOne(mappedBy ="customer", fetch = FetchType.EAGER)
	private TKKH tkkh;
	 
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getHOTEN() {
		return HOTEN;
	}
	public void setHOTEN(String hOTEN) {
		HOTEN = hOTEN;
	}
	public String getDIACHI() {
		return DIACHI;
	}
	public void setDIACHI(String dIACHI) {
		DIACHI = dIACHI;
	}
//	public Collection<TKKH> getTkkh() {
//		return tkkh;
//	}
//	public void setTkkh(Collection<TKKH> tkkh) {
//		this.tkkh = tkkh;
//	}
	public int getMAKH() {
		return MAKH;
	}
	public void setMAKH(int mAKH) {
		MAKH = mAKH;
	}
	public TKKH getTkkh() {
		return tkkh;
	}
	public void setTkkh(TKKH tkkh) {
		this.tkkh = tkkh;
	}
	
	
}	
