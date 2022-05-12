package entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="CHUCVU")
public class ChucVu {
	@Id
	private int MACV;
	private String TENCV;
	@OneToMany(mappedBy ="CHUCVU", fetch = FetchType.EAGER)
//	private Collection<NhanVien> nhanvien;
	public int getMACV() {
		return MACV;
	}
	public void setMACV(int mACV) {
		MACV = mACV;
	}
	public String getTENCV() {
		return TENCV;
	}
	public void setTENCV(String tENCV) {
		TENCV = tENCV;
	}
//	public Collection<NhanVien> getNhanvien() {
//		return nhanvien;
//	}
//	public void setNhanvien(Collection<NhanVien> nhanvien) {
//		this.nhanvien = nhanvien;
//	}

}
