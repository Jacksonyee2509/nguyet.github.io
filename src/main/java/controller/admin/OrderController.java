package controller.admin;

import java.util.List;

import org.hibernate.Query;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.CTPD;
import entity.NhanVien;
import entity.PhieuDat;
import entity.SanPham;


@Transactional
@Controller
@RequestMapping("/admin/order")
public class OrderController {
	@Autowired
	SessionFactory factory;
	///////function////////
	public List<PhieuDat> getWaitingOrder() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhieuDat WHERE TRANGTHAI=1";
		Query query = session.createQuery(hql);
		List<PhieuDat> list = query.list();
		return list;
}
	////
	public List<CTPD> getCTPD(int mapd) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CTPD WHERE MAPD LIKE '" + mapd + "'";
		Query query = session.createQuery(hql);
		List<CTPD> list = query.list();
		return list;
}
	//////
	public List<PhieuDat> getConfirmedOrders() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhieuDat WHERE TRANGTHAI=2";
		Query query = session.createQuery(hql);
		List<PhieuDat> list = query.list();
		return list;
}
	public List<PhieuDat> getDenyOrders() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhieuDat WHERE TRANGTHAI=0";
		Query query = session.createQuery(hql);
		List<PhieuDat> list = query.list();
		return list;
}
	
	////controller///////
	
	
	@RequestMapping(value="/manager_order")
	public String managerOrder(ModelMap model) {
		model.addAttribute("waitingOrder", this.getWaitingOrder());
		return "admin/order-manager/orderManager";
	}
	
	@RequestMapping(value="/confirmedOrder")
	public String confirmedOrder(ModelMap model) {

model.addAttribute("confirmedOrder", getConfirmedOrders());
		return "admin/order-manager/confirmedOrder";
	}
//	
	@RequestMapping(value="/denyOrder")
	public String denyOrder(ModelMap model) {
		model.addAttribute("denyOrder", getDenyOrders());
		return "admin/order-manager/denyOrder";
	}
	
	@RequestMapping(value="/orderDetails/{id}")
	public String orderDetails(ModelMap model, @PathVariable("id") int id, HttpServletRequest request) {
		
		Session session = factory.getCurrentSession();
		String hql = "FROM CTPD WHERE MAPD LIKE '" + id + "'";
		Query query = session.createQuery(hql);
		@SuppressWarnings("unchecked")
		List<CTPD> od = query.list();
		//System.out.println(od.get(0).getSp().getTENSP());
		model.addAttribute("od", od);
		model.addAttribute("id", id);
		model.addAttribute("size", od.size());
		//PhieuDat order = (PhieuDat) session.get(PhieuDat.class, id);
		int total=0;
		for(CTPD item : od) total +=item.getGIA()*item.getSOLUONG(); 
		model.addAttribute("total", total);
		return "admin/order-manager/orderDetails";
	}
//	
//	
	@RequestMapping(value="accept/{order_id}")
	public String accept(ModelMap model, @PathVariable("order_id") int order_id) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		PhieuDat pd = (PhieuDat) session.get(PhieuDat.class,order_id);
		/// duyệt đơn : TRANGTHAI=2///////
		
		pd.setTRANGTHAI(2);
		try {
			session.update(pd);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công");
		}
		catch(Exception e){
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại");
		}
		finally {
			session.close();
		}
		return "redirect:/admin/order/manager_order.htm";
	}

	@RequestMapping(value="deny/{order_id}")
	public String deny(ModelMap model, @PathVariable("order_id") int order_id) {

		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		PhieuDat pd = (PhieuDat) session.get(PhieuDat.class,order_id);
		/// HUY đơn : TRANGTHAI=0///////

		pd.setTRANGTHAI(0);
		List<CTPD> listct=getCTPD(pd.getMAPD());
//		System.out.println("===========");
		for(CTPD item : listct) {

			Session session2 = factory.openSession();
			Transaction t2 = session2.beginTransaction();
			SanPham sp = (SanPham)session2.get(SanPham.class,item.getSp().getMASP());
			sp.setSOLUONG(sp.getSOLUONG()+item.getSOLUONG());
//			System.out.println(sp.getSOLUONG());
			try {
				session2.update(sp);
				t2.commit();
				model.addAttribute("message", "Cập nhật thành công");
			}
			catch(Exception e){
				t2.rollback();
				model.addAttribute("message", "Cập nhật thất bại");
			}
			finally {
				session2.close();
			}
		/////
		}
//		System.out.println("===========");
		try {
			session.update(pd);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công");
		}
		catch(Exception e){
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại");
		}
		finally {
			session.close();
		}
		
		
		//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		Order order = (Order) session.get(Order.class, order_id);
//		order.setOrder_status("0");
//		try {
//			session.update(order);
//			t.commit();
//			model.addAttribute("message", "Cáº­p nháº­t thÃ nh cÃ´ng!");
//		}
//		catch(Exception e){
//			t.rollback();
//			model.addAttribute("message", "Cáº­p nháº­t tháº¥t báº¡i");
//		}
//		finally {
//			session.close();
//		}
		return "redirect:/admin/order/manager_order.htm";
	}
	
	
}
