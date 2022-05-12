package entity;

import java.util.ArrayList;
import java.util.List;

public class GioHang {
	private List<ItemGH> items;
	private int tong;
	private int size;
	private String itemname;

	public GioHang() {
		items = new ArrayList<ItemGH>();
		this.tong=0;
	}
	
	public void additem(SanPham sp,int soluong){
		if(sp.getSOLUONG()>=soluong) {
		ItemGH item= new ItemGH(sp,soluong);
		items.add(item);
		}
		else {
			ItemGH item= new ItemGH(sp,sp.getSOLUONG());
			items.add(item);
		}
	}
	
	public void updateItem(SanPham sp, int soluong) {
		ItemGH item = getItem(sp);
		if(item != null) {
			
			if(soluong<item.getSp().getSOLUONG())
			item.setSoluong(soluong);
			else item.setSoluong(item.getSp().getSOLUONG());
		}
	}
	public ItemGH getItem(SanPham sp) {
		
		for(ItemGH item : items) {
			if (item.getSp().getMASP() == sp.getMASP()) { //kiem tra da ton tai item 			
				return item;
			}
		}	
		return null; //k co item tra ve null
	}
	public List<ItemGH> getItems(){
		return items;
	}
	public void setList(List<ItemGH> list) {
		this.items = list;
	}
	public int getTong() {
		tong=0;
		for(ItemGH item : items)
			tong+= item.getTongtien();
		return tong;
	
	}
public void deleteItem(SanPham sp) {
	ItemGH item = getItem(sp);
	if(item != null) {
		items.remove(item);
	}
	}
	public void setTong(int tong) {
		this.tong = tong;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getItemname() {
			itemname = "";
			for(ItemGH item : items) {
				itemname = itemname + " / " + item.getSp().getTENSP();
			}
		return itemname;
	}
	
	public void clearItem() {
		items.clear();
		tong=0;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	
}
