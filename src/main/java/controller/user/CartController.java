package controller.user;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
//
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//
////import entity.Cart;
////import entity.Order;
////import entity.Product;
////import entity.cartItem;
////import entity.orderDetails;
////import service.admin.OrderService;
////import service.user.CartService;
////import service.user.CategoryService;
////import service.user.ProductService;
//
//
//
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import entity.CTPD;
import entity.GioHang;
import entity.ItemGH;
import entity.KhachHang;
import entity.PhieuDat;
import entity.SanPham;

@Transactional
@Controller
public class CartController {
////	@Autowired
////	CartService cartService;
//	
////	@Autowired
////	CategoryService categoryService;
////
////	@Autowired
////	ProductService productService;
////
////	@Autowired
////	OrderService orderService;
////	
	@Autowired
	SessionFactory factory;
	
	
	@RequestMapping(value="/addToCart/{product-id}")
	public String add(HttpSession session, @PathVariable("product-id") int masp, ModelMap model) {
		Session ss = factory.getCurrentSession();
		SanPham sp = (SanPham) ss.get(SanPham.class, masp);
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		int soluong = 1;
		boolean flag = true;
		for(ItemGH item : gh.getItems()) {
			if(item.getSp().getMASP()==sp.getMASP()) {
				if(item.getSoluong()<sp.getSOLUONG())
					item.setSoluong(item.getSoluong()+1);
				else item.setSoluong(sp.getSOLUONG());
				flag = false;
			}
		}
		if(flag) gh.additem(sp, soluong);
		model.addAttribute("gioHang",gh);
//		gh.additem(sp, soluong);
		//		Cart cart = cartService.getGioHang(session);
//		int quantity = 1;
//		Product product = productService.getProductID(product_id); //lay san pham	
//		cart.addItem(product, quantity);		
		
		return "redirect:/product.htm";
	}
	
	@RequestMapping(value="/addToCart/")
	public String add(HttpSession session, @RequestParam("product_id") int masp,
			@RequestParam(value="quantity", required = false, defaultValue="1") int soluong, ModelMap model) {
		Session ss = factory.getCurrentSession();
		SanPham sp = (SanPham) ss.get(SanPham.class, masp);
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		model.addAttribute("cartCount", gh.getItems().size());
//		boolean flag = true;
//		for(ItemGH item : gh.getItems()) {
//			if(item.getSp().getMASP()==sp.getMASP()) {
//				item.setSoluong(item.getSoluong()+1);
//				flag = false;
//			}
//		}
//		if(flag) gh.additem(sp, soluong);
//		model.addAttribute("gioHang",gh);
		
		
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
//		Product product = productService.getProductID(product_id); //lay san pham	
//		cart.addItem(product, quantity);	
		boolean flag = true;
		for(ItemGH item : gh.getItems()) {
			if(item.getSp().getMASP()==sp.getMASP()) {
				if(item.getSoluong()+soluong<sp.getSOLUONG())
					item.setSoluong(item.getSoluong()+soluong);
				else item.setSoluong(sp.getSOLUONG());
				flag = false;
			}
		}
		if(flag) gh.additem(sp, soluong);
		model.addAttribute("gioHang",gh);
		return "redirect:/product.htm";
	}
////	
	@RequestMapping(value="cart/delete")
	public String delete(RedirectAttributes redirect, HttpSession session, @RequestParam(value="product_id") int masp, ModelMap model) {
		Session ss = factory.getCurrentSession();
		SanPham sp = (SanPham) ss.get(SanPham.class, masp);
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		gh.deleteItem(sp);
		model.addAttribute("cartCount", gh.getItems().size());
		
//		//		Product product = productService.getProductID(product_id);
////		Cart cart = cartService.getGioHang(session);
////		cart.deleteItem(product);
////		model.addAttribute("cartCount", cart.getItems().size());
		redirect.addFlashAttribute("tb", "Sản phẩm đã xóa!");
		
		return "redirect:/cart.htm";
	}
////	
////	//sua sp trong gio hang
	@RequestMapping(value="cart/update")
	public String update(HttpSession session, @RequestParam("product_id") int masp, @RequestParam(value="quantity") int soluong, ModelMap model) {
		Session ss = factory.getCurrentSession();
		SanPham sp = (SanPham) ss.get(SanPham.class, masp);
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		gh.updateItem(sp, soluong);
		model.addAttribute("cartCount", gh.getItems().size());
//		Product product = productService.getProductID(product_id);
//		Cart cart = cartService.getGioHang(session);
//		cart.updateItem(product, quantity);
//		model.addAttribute("cartCount", cart.getItems().size());
		return "redirect:/cart.htm";
	}
	
	@RequestMapping(value="ttoan")
	public String checkout(HttpSession session) {	
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		boolean flag = false;
//		for(ItemGH item : gh.getItems()) {
//			System.out.println(item.getSoluong());
//			System.out.println(getSP(item.getSp().getMASP()).getSOLUONG());
//			
//			if (item.getSoluong() > getSP(item.getSp().getMASP()).getSOLUONG()) {
//				System.out.println(item.getSoluong());
//				System.out.println(getSP(item.getSp().getMASP()).getSOLUONG());
//				gh.deleteItem(getSP(item.getSp().getMASP()));
//				flag=true;
//			}
//		}
		List <ItemGH> out = new ArrayList<>();
		for(ItemGH item : gh.getItems()) {		
			if (item.getSoluong() > getSP(item.getSp().getMASP()).getSOLUONG()) {
				System.out.println(item.getSoluong());
				System.out.println(getSP(item.getSp().getMASP()).getSOLUONG());
				out.add(item);
				flag=true;
			}
		}
		System.out.println(flag);
		if(flag) {
			gh.getItems().removeAll(out);
			System.out.println(flag);
			session.setAttribute("gioHang",gh);
			return "redirect:/cart.htm";
			}
		return "checkout";
	}
//	
//	@RequestMapping(value="reviewOrder")
//	public String reviewOrder(HttpSession session, ModelMap model, @RequestParam("order_owner") int id,		
//												@RequestParam("order_ownername") String name,
//												@RequestParam("order_email") String email,
//												@RequestParam("order_address") String address,
//												@RequestParam("order_phone") String phone,
//												@RequestParam("order_note") String note,
//												@ModelAttribute("Order") Order order) {
//		Cart cart = cartService.getGioHang(session);
//		Session session2 = factory.openSession();
//		Transaction t = session2.beginTransaction();
//		try {
//			order.setTotal((int) cart.getTotal());
//			session2.save(order);
//			t.commit();
//			model.addAttribute("message", "Thêm Thành Công");
//			
//		} catch (Exception e) {
//			t.rollback();
//			model.addAttribute("message", "ThÃªm tháº¥t báº¡i!");
//		} finally {
//			session2.close();
//		}
//		model.addAttribute("name", name);
//		model.addAttribute("email", email);
//		model.addAttribute("address", address);
//		model.addAttribute("phone", phone);
//		model.addAttribute("note", note);
//		
//		cart.clearItem();
//		return "reviewOrder";
//	}
//GioHang gh = (GioHang)session.getAttribute("gioHang");
//	if(gh == null) {
//		gh= new GioHang();
//		session.setAttribute("gioHang",gh);
//	}
//	boolean flag = false;
////	
//	List <ItemGH> out = new ArrayList<>();
//	for(ItemGH item : gh.getItems()) {		
//		if (item.getSoluong() > getSP(item.getSp().getMASP()).getSOLUONG()) {
//			System.out.println(item.getSoluong());
//			System.out.println(getSP(item.getSp().getMASP()).getSOLUONG());
//			out.add(item);
//			flag=true;
//		}
//	}
//	System.out.println(flag);
//	if(flag) {
//		gh.getItems().removeAll(out);
//		System.out.println(flag);
//		session.setAttribute("gioHang",gh);
//		return "redirect:/cart.htm";
//		}	
//	
//	
//	@RequestMapping(value="reviewOrder")
//	public String reviewOrder(HttpSession session2, ModelMap model, @RequestParam("order_owner") int makh,
//												@RequestParam("order_ownername") String hoten,
//												@RequestParam("order_email") String email,
//												@RequestParam("order_address") String diachi,
//												@RequestParam("order_phone") String sdt,
//												@RequestParam("order_note") String note,
//												@RequestParam("order_items") String order_items,
//												@ModelAttribute("Order") PhieuDat pd) {
//		
//		
//		GioHang gh = (GioHang)session2.getAttribute("gioHang");
//		if(gh == null) {
//			gh= new GioHang();
//			session2.setAttribute("gioHang",gh);
//		}
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		pd.setMAKH(makh);
//		pd.setNGAYDAT(new Date());
//		pd.setNGAYGIAO(DateUtils.addDays(pd.getNGAYDAT(),7));
//		try {
//			session.save(pd);
//			t.commit();
//			model.addAttribute("message", "ThÃªm thÃ nh cÃ´ng!");
//			
//		} catch (Exception e) {
//			t.rollback();
//			model.addAttribute("message", "ThÃªm tháº¥t báº¡i!");
//		} 
//		finally {
//			session.close();
//		}
//		model.addAttribute("name", hoten);
//		model.addAttribute("email", email);
//		model.addAttribute("address", diachi);
//		model.addAttribute("phone", sdt);
//		model.addAttribute("note", note);
//		
//		CTPD ct = new CTPD();
//		int z = pd.getMAKH();
//		for(ItemGH item : gh.getItems()) {
//			Session sessionz = factory.openSession();
//			Transaction t2 = sessionz.beginTransaction();
//			PhieuDat pdm = (PhieuDat) sessionz.get(PhieuDat.class, z);
//			SanPham sp = item.getSp();
//			int sl = item.getSoluong();
//			int gia=item.getTongtien();
//			ct.setSp(sp);;
//			ct.setSOLUONG(sl);
//			ct.setGIA(gia);
//			ct.setPd(pd);
//			try {
//			sessionz.save(ct);
//			t2.commit();
//			System.out.println("thÃ nh cÃ´ng");
//		}
//		catch(Exception e){
//			t2.rollback();
//			System.out.println("tháº¥t báº¡i");
//		}
//		}
//		
	/// Sếp Hoàng làm
	
	@RequestMapping(value="reviewOrder", method = RequestMethod.POST)
	public String reviewOrder(HttpSession session2, ModelMap model
			,
			@RequestParam("order_ownername") String hoten,
			@RequestParam("order_email") String email,
			@RequestParam("order_address") String diachi,
			@RequestParam("order_phone") String sdt,
			@RequestParam("order_note") String note,
			@RequestParam("order_items") String order_items,
			@ModelAttribute("Order") PhieuDat pd, RedirectAttributes redirect) {
//		@RequestParam("order_owner") int makh,
//		@RequestParam("order_ownername") String hoten,
//		@RequestParam("order_email") String email,
//		@RequestParam("order_address") String diachi,
//		@RequestParam("order_phone") String sdt,
//		@RequestParam("order_note") String note,
//		@RequestParam("order_items") String order_items,
//		@ModelAttribute("Order") PhieuDat pd
		

		GioHang gh = (GioHang)session2.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session2.setAttribute("gioHang",gh);
		}
		boolean flag = false;
	//	
		List <ItemGH> out = new ArrayList<>();
		for(ItemGH item : gh.getItems()) {		
			if (item.getSoluong() > getSP(item.getSp().getMASP()).getSOLUONG()) {
				System.out.println(item.getSoluong());
				System.out.println(getSP(item.getSp().getMASP()).getSOLUONG());
				out.add(item);
				flag=true;
			}
		}
		System.out.println(flag);
		if(flag) {
			gh.getItems().removeAll(out);
			System.out.println(flag);
			session2.setAttribute("gioHang",gh);
			redirect.addFlashAttribute("successMessage", "Sản phẩm đã hết!");
			return "redirect:/cart.htm";
			}	
//		System.out.println(hoten);
//		System.out.println(email);
//		System.out.println(diachi);
//		System.out.println(sdt);
//		System.out.println(note);
//		System.out.println(order_items +"\n" );
		
		int makh;
		if (this.findKHbySDT(sdt)==null) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				KhachHang kh = new KhachHang();
				kh.setHOTEN(hoten);
				kh.setSDT(sdt);
				kh.setDIACHI(diachi);
				//kh.setEMAIL(email);
				session.save(kh);
				t.commit();
				//model.addAttribute("message", "Thêm thành công!");
			} catch (Exception e) {
				t.rollback();
				//model.addAttribute("message", "Thêm thất bại!");
			} 
			finally {
				session.close();
			}
			makh = this.findKHbySDT(sdt).getMAKH();
		}
		else {
			makh = this.findKHbySDT(sdt).getMAKH();
		}
		
//		boolean flag = true;
//		for(ItemGH item : gh.getItems()) {
//			if (item.getSoluong() > item.getSp().getSOLUONG()) {
//				gh.deleteItem(item.getSp());
//				flag=false;
//			}
//		}
//		if(!flag) {
//			session2.setAttribute("gioHang",gh);
//			return "redirect:/cart.htm";
//			}
		
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {	
				pd.setMAKH(makh);
				pd.setHOTEN(hoten);
				pd.setSDT(sdt);
				pd.setEMAIL(email);
				pd.setDIACHI(diachi);
				pd.setTRANGTHAI(1);
				
				Calendar ngaydat = Calendar.getInstance();
				Calendar ngaygiao = Calendar.getInstance();
				ngaygiao.add(Calendar.DATE, 7);
			    Date nd = ngaydat.getTime();
			    Date ng = ngaygiao.getTime();
				pd.setNGAYDAT(nd);
				pd.setNGAYGIAO(ng);
				
				System.out.println(pd.getEMAIL());
				System.out.println(pd.getHOTEN());
				System.out.println(pd.getSDT());
				//System.out.println(pd.getDIACHI());
				session.save(pd);
				t.commit();
				model.addAttribute("message", "Thêm thành công!");
				
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("message", "Thêm thất bại!");
			} 
			finally {
				session.close();
			}
		
		model.addAttribute("name", hoten);
		model.addAttribute("email", email);
		model.addAttribute("address", diachi);
		model.addAttribute("phone", sdt);
		model.addAttribute("note", note);
		
			CTPD ct = new CTPD();
			int z = pd.getMAKH();
			for(ItemGH item : gh.getItems()) {
				Session sessionz = factory.openSession();
				Transaction t2 = sessionz.beginTransaction();
				PhieuDat pdm = (PhieuDat) sessionz.get(PhieuDat.class, z);
				SanPham sp = item.getSp();
				int sl = item.getSoluong();
				int gia=item.getSp().getDONGIA()-(int)(item.getSp().getDONGIA()*item.getSp().getKHUYENMAI());
				
				ct.setSp(sp);;
				ct.setSOLUONG(sl);
				ct.setGIA(gia);
				ct.setPd(pd);
				sp.setSOLUONG(sp.getSOLUONG()-sl);
				try {
				sessionz.save(ct);
				t2.commit();
				System.out.println("Thành công");
			}
			catch(Exception e){
				t2.rollback();
				System.out.println("Thất bại");
			}
				finally {
					sessionz.close();
				}
//				
				Session session3 = factory.openSession();
				Transaction t3 = session3.beginTransaction();
				try {
				session3.update(sp);
					t3.commit();
					System.out.println("Thành công");
				}
				catch(Exception e){
					t3.rollback();
					System.out.println("Thất bại");
			}
				finally {
					session3.close();
				}
		}

	
	
		
//		Cart cart = cartService.getGioHang(session2);
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		order.setOrder_owner(id);
//		try {
//			order.setTotal((int) cart.getTotal());
//			session.save(order);
//			t.commit();
//			model.addAttribute("message", "ThÃªm thÃ nh cÃ´ng!");
//			
//		} catch (Exception e) {
//			t.rollback();
//			model.addAttribute("message", "ThÃªm tháº¥t báº¡i!");
//		} 
//		finally {
//			session.close();
//		}
//		model.addAttribute("name", name);
//		model.addAttribute("email", email);
//		model.addAttribute("address", address);
//		model.addAttribute("phone", phone);
//		model.addAttribute("note", note);	
//		
//		//post order_details
//		orderDetails od = new orderDetails();
//		int z = order.getOrder_id();
//		for(cartItem item : cart.getItems()) {
//			Session sessionz = factory.openSession();
//			Transaction t2 = sessionz.beginTransaction();
//			Order orderz = (Order) sessionz.get(Order.class, z);
//			Product prod = item.getProd();
//			int quantity = item.getQuantity();
//			od.setProduct(prod);
//			od.setQuantity(quantity);
//			od.setOrder(orderz);
//			
//			
//			od.setCreate_at(new Date());
//			try {
//				sessionz.save(od);
//				t2.commit();
//				System.out.println("thÃ nh cÃ´ng");
//			}
//			catch(Exception e){
//				t2.rollback();
//				System.out.println("tháº¥t báº¡i");
//			}
//		}
			
		gh.clearItem();
		redirect.addFlashAttribute("tb", "Sản phẩm đã hết!");
		return "redirect:" + "cart.htm";
	}
	
	//// function////
	
	public KhachHang findKHbySDT(String sdt) {
		Session session = factory.getCurrentSession(); 
		String hql="FROM KhachHang WHERE SDT = :sdt";
		Query qr = session.createQuery(hql);
		KhachHang kh = (KhachHang) qr.setParameter("sdt", sdt).uniqueResult();
		return kh;
	}
	
	///
	public SanPham getSP(int masp) {
		try {
			Session session = factory.getCurrentSession();
			SanPham sp=(SanPham)session.get(SanPham.class,masp);
			return sp;

		} catch (Exception e) {
			return null;
		}
	}
}
