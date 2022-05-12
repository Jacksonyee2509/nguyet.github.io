//package controller.user;
//
//import java.io.BufferedOutputStream;
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Transaction;
//import org.mindrot.jbcrypt.BCrypt;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import entity.Cart;
//import entity.Customer;
//import entity.Order;
//import entity.Users;
//import entity.orderDetails;
//import service.admin.AdminService;
////import service.user.CartService;
//
//
//@Transactional
//@Controller
//@RequestMapping("/user")
//public class UserController {
//	
//	@Autowired
//	AdminService adminService;
//	@Autowired
//	SessionFactory factory;
////	@Autowired
////  CartService cartService;
//	
//	@RequestMapping("profile/{id}")
//	public String profile(@PathVariable("id") int id, ModelMap model, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		Users user = adminService.checkdEdit(id);
////		Cart cart = cartService.getGioHang(session);
////		model.addAttribute("cartCount", cart.getItems().size());
//		if (session.getAttribute("LoginInfo") == null) {
//			return "redirect:/login_register.htm";
//		}
//		int uid = (int) session.getAttribute("userID");
//		if(id != uid) {
//			return "redirect:/index.htm";
//		}
//		model.addAttribute("user", user);
//		return "profile";
//	}
//	
//	@RequestMapping("profile")
//	public String editProfile(HttpServletRequest request, @ModelAttribute("user") Users user, ModelMap model,
//			BindingResult errors, HttpSession session) {
////		Cart cart = cartService.getGioHang(session);
////		model.addAttribute("cartCount", cart.getItems().size());
//		if (user.getUsers_username().trim().length() == 0) {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:/user/profile/"+ user.getUsers_id() +".htm";
//		}
//		if (user.getCustomer() == null) {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:/user/profile/"+ user.getUsers_id() +".htm";
//		}
//		boolean check = adminService.updateUserCus2(user);
//		if (check == true) {
//			model.addAttribute("view_user", adminService.GetAllUserCus());
//			return "redirect:/user/profile/"+ user.getUsers_id() +".htm";
//		} else {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:/userprofile/"+ user.getUsers_id() +".htm";
//		}
//
//	}
//	
//	
//	@RequestMapping("editAvatar")
//	public String editAvatar(ModelMap model, 
//							@RequestParam("image") MultipartFile image,
//							@RequestParam("user_images") String user_images,
//							@RequestParam("id") int id,
//							HttpServletRequest request) throws IOException {
//		
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		Customer cus = (Customer) session.get(Customer.class, id);
//		HttpSession session2 = request.getSession();
////		Cart cart = cartService.getGioHang(session2);
////		model.addAttribute("cartCount", cart.getItems().size());
//		int uid = (int) session2.getAttribute("userID");
//		if(id != uid) {
//			return "redirect:/index.htm";
//		}
//		if(image == null || image.isEmpty()) {
//			cus.setKhachhang_anh(user_images);
//		}
//		else cus.setKhachhang_anh(saveFile(image));
//		try {
//			session.update(cus);
//			t.commit();
//			model.addAttribute("message", "Cập nhật thành công!");
//		}
//		catch(Exception e){
//			t.rollback();
//			model.addAttribute("message", "Cập nhật thất bại");
//		}
//		finally {
//			session.close();
//		}
//		return "redirect:/user/profile/"+ cus.getKhachhang_id()+".htm";
//	}
//	
//	
//	@RequestMapping(value="changePassword/{id}", method=RequestMethod.GET)
//	public String resetPassword(@PathVariable("id") int id, ModelMap model, HttpSession session, HttpServletRequest request) {
////		Cart cart = cartService.getGioHang(session);
////		model.addAttribute("cartCount", cart.getItems().size());
//		Users user = adminService.checkdEdit(id);
//		model.addAttribute("user", user);
//		HttpSession session2 = request.getSession();
//		int uid = (int) session2.getAttribute("userID");
//		if(id != uid) {
//			return "redirect:/index.htm";
//		}
//		return "changePassword";
//	}
//	
//	@RequestMapping(value="changePassword/success", method=RequestMethod.POST)
//	public String _resetPassword(ModelMap model, @RequestParam("oldPassword") String oldPassword,
//													@RequestParam("newPassword") String newPassword,
//													@RequestParam("id") int id,
//													RedirectAttributes rect, HttpServletRequest request) {
//		HttpSession session2 = request.getSession();
//		int uid = (int) session2.getAttribute("userID");
//		if(id != uid) {
//			return "redirect:/index.htm";
//		}
//		Users user = adminService.checkdEdit(id);
//		if (user.getUsers_username().trim().length() == 0) {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:/user/profile/"+ user.getUsers_id() +".htm";
//		}
//		if (user.getCustomer() == null) {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:/user/profile/"+ user.getUsers_id() +".htm";
//		}
//		
//		Session session = factory.openSession();
//		Transaction t = session.beginTransaction();
//		String stored = user.getUsers_password();
//		if(BCrypt.checkpw(oldPassword, stored)) {
//			System.out.println("db match");
//			if (!BCrypt.checkpw(newPassword, stored)) {
//				user.setUsers_password(BCrypt.hashpw(newPassword, BCrypt.gensalt(12)));
//	            System.out.println("new pass ko match");
//	            try {
//	    			session.update(user);
//	    			t.commit();
//	    		} catch (Exception e) {
//	    			t.rollback();
//	    		} finally {
//	    			session.close();
//	    		}
//	        }
//		}
//		else {
//			String message = "Current password incorrect!";
//			rect.addFlashAttribute("message", message);
//            return "redirect:/user/changePassword/"+id+".htm";
//		}
//		return "redirect:/user/profile/"+ user.getUsers_id() +".htm";
//	}
//	
//	@RequestMapping("order/{uid}")
//	public String order(HttpServletRequest request, ModelMap model, @PathVariable("uid") int uid) {
//		HttpSession session2 = request.getSession();
////		Cart cart = cartService.getGioHang(session2);
////		model.addAttribute("cartCount", cart.getItems().size());
//		if (session2.getAttribute("LoginInfo") == null) {
//			return "redirect:/login_register.htm";
//		}
//		
//		int userID = (int) session2.getAttribute("userID");
//		if(uid != userID) {
//			return "redirect:/index.htm";
//		}
//		Session session = factory.getCurrentSession();
//		String hql = "FROM Order WHERE order_owner LIKE '" + uid + "'";
//		Query query = session.createQuery(hql);
//		@SuppressWarnings("unchecked")
//		List<Order> list = query.list();
//		model.addAttribute("order", list);
//		return "order";
//	}
//	
//	@RequestMapping("orderDetails/{id}")
//	public String orderDetails(HttpServletRequest request, ModelMap model, @PathVariable("id") int id) {
//		
//		HttpSession session2 = request.getSession();
////		Cart cart = cartService.getGioHang(session2);
////		model.addAttribute("cartCount", cart.getItems().size());
//		if (session2.getAttribute("LoginInfo") == null) {
//			return "redirect:/login_register.htm";
//		}
//		
//		
//		Session session = factory.getCurrentSession();
//		int userID = (int) session2.getAttribute("userID");
//		Order oid = (Order) session.get(Order.class, id);
//		
//		
//		System.out.println("uid = " + userID);
//		System.out.println("oid = " + oid.getOrder_owner());
//		int s = oid.getOrder_owner();
//		if(userID != s) {
//			return "redirect:/index.htm";
//		}
//		
//		
//		String hql = "FROM orderDetails WHERE order_id LIKE '" + id + "'";
//		Query query = session.createQuery(hql);
//		@SuppressWarnings("unchecked")
//		List<orderDetails> od = query.list();
//		model.addAttribute("od", od);
//		model.addAttribute("id", id);
//		Order order = (Order) session.get(Order.class, id);
//		model.addAttribute("total", order.getTotal());
//		return "orderDetails";
//	}
//	
//	
//	
//	@SuppressWarnings("null")
//	public String saveFile(MultipartFile file) throws IOException {
//		if(file != null || !file.isEmpty()) {
//			try {
//				byte[] bytes = file.getBytes();
//				String rootPath = "C:\\Users\\azhel\\Desktop\\web\\final\\ElectronicComponentsShopMVC\\src\\main\\webapp";
//				//create file locate
//				File dir = new File(rootPath + File.separator + "assets/images/user");
//				if(!dir.exists()) {
//					dir.mkdir();
//				}
//				
//				//create file on server
//				String name = String.valueOf(file.getOriginalFilename());
//				File serverFile = new File(dir.getAbsoluteFile()+File.separator+name);
//				
//				System.out.println("==========Path of image on server: "+serverFile.getPath());
//				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
//				stream.write(bytes);
//				stream.close();
//				
//				return name;
//			} catch (Exception e) {
//				System.out.println("==========Path of image on server: "+e.getMessage());
//			}
//			
//		} 
//		else {
//			System.out.println("=============File not exits=============");
//		}
//		return null;
//	}
//}
