package entity;

public class ItemGH {
	private SanPham sp;
	private int soluong;
	private int tongtien;
	
	public ItemGH (SanPham sp) {
		this.sp=sp;
		this.soluong=1;
		this.tongtien=sp.getDONGIA()-(int)(sp.getDONGIA()*sp.getKHUYENMAI());
	}
	public ItemGH (SanPham sp,int soluong) {
		this.sp=sp;
		this.soluong=soluong;
		this.tongtien=(sp.getDONGIA()-(int)(sp.getDONGIA()*sp.getKHUYENMAI()))*soluong;
	}
	public SanPham getSp() {
		return sp;
	}

	public void setSp(SanPham sp) {
		this.sp = sp;
	}

	public int getSoluong() {
		return soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public int getTongtien() {
		return (sp.getDONGIA()-(int)(sp.getDONGIA()*sp.getKHUYENMAI()))*this.soluong;
	}

	public void setTongtien(int tongtien) {
		this.tongtien = tongtien;
	}
	
}
