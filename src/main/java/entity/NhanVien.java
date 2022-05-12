package entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="NHANVIEN")
public class NhanVien {
	@Id
	@GeneratedValue
	private int MANV;
	@NotNull(message="Invalid!")
	private String HOTEN;

	private String SDT;

	private String DIACHI;
	@ManyToOne
	@JoinColumn(name="MACV")
	private ChucVu chucvu;
	
	@OneToOne(mappedBy ="nhanvien", fetch = FetchType.EAGER)
	private TKNV tknv;
	
//	@Transient //bien tam khong luu vao db
//	private boolean tk = false; // xac dinh xem nhan vien co tai khoan hay chua
	
//	public boolean getTk() {
//		return tk;
//	}
//	public void setTk(boolean tk) {
//		this.tk = tk;
//	}
	
	public int getMANV() {
		return MANV;
	}
	public void setMANV(int mANV) {
		MANV = mANV;
	}
	public String getHOTEN() {
		return HOTEN;
	}
	public void setHOTEN(String hOTEN) {
		HOTEN = hOTEN;
	}

	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}
	public String getDIACHI() {
		return DIACHI;
	}
	public void setDIACHI(String dIACHI) {
		DIACHI = dIACHI;
	}
	public ChucVu getChucvu() {
		return chucvu;
	}
	public void setChucvu(ChucVu chucvu) {
		this.chucvu = chucvu;
	}

	public TKNV getTknv() {
		return tknv;
	}
	public void setTknv(TKNV tknv) {
		this.tknv = tknv;
	}
	
}
