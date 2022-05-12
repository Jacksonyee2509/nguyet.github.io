package entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="TKNV")
public class TKNV {
	@Id
	private String TK;
	@NotNull(message="Invalid!")
	private String MK;
	private boolean TRANGTHAI;
	
	@ManyToOne
	@JoinColumn(name="MANV")
	private NhanVien nhanvien;

	public String getTK() {
		return TK;
	}
	public void setTK(String tK) {
		TK = tK;
	}
	public String getMK() {
		return MK;
	}
	public void setMK(String mK) {
		MK = mK;
	}
	public NhanVien getNhanvien() {
		return nhanvien;
	}
	public void setNhanvien(NhanVien nhanvien) {
		this.nhanvien = nhanvien;
	}
	public boolean getTRANGTHAI() {
		return TRANGTHAI;
	}
	public void setTRANGTHAI(boolean tRANGTHAI) {
		TRANGTHAI = tRANGTHAI;
	}
	
}
