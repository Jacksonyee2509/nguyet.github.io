package controller.user;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.SystemException;
import org.hibernate.*;

import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import entity.KhachHang;
import entity.TKKH;

@Transactional
@Controller
public class Login_RegisterController {

//	@Autowired
//	@Qualifier(value = "userService")
//	UserService userService;
//
//	@Autowired
//	RegisterCustomerService registerCustomerService;
//
//	@Autowired
//	JavaMailSender mailer;
//
//	@Autowired
//	AdminService adminService;
//	
////	@Autowired
////	CartService cartService;
	@Autowired
	private SessionFactory factory;

	@RequestMapping(value = "/login_register")
	public String login_register(HttpSession session, ModelMap model) {
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		if (session.getAttribute("LoginInfo") != null) {
			return "redirect:/index.htm";
		}
		return "user/login_register";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam("username_login") String username,
			@RequestParam("password_login") String password, HttpSession session, ModelMap model) {
		
////		Cart cart = cartService.getGioHang(session);
////		model.addAttribute("cartCount", cart.getItems().size());
        	TKKH user = checkUserLogin(username, password);
     	if (user != null) {
	 session.setAttribute("LoginInfo", user);
     session.setAttribute("isLogin", true);
//			session.setAttribute("role", user.getRole().getRole_name());
//			session.setAttribute("userID", user.getUsers_id());
			return "redirect:/home.htm";
		} else {
			model.addAttribute("Status_login", "========");
		}
		return "user/login_register";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String LoginAccount(HttpSession session, HttpServletRequest request) {
		//session.removeAttribute("LoginInfo");
		session = request.getSession(false);
	    session.invalidate();
		return "redirect:/index.htm";
	}

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(@RequestParam("sdt_register") String sdt,
			@RequestParam("password_register") String password, @RequestParam("name_register") String name,
			@RequestParam("gender_register") boolean gender, @RequestParam("address_register") String diachi,
			HttpSession session, ModelMap model) {
////		Cart cart = cartService.getGioHang(session);
////		model.addAttribute("cartCount", cart.getItems().size());
    	boolean result = addCustomer_test(sdt, password, name,diachi, gender);
    	if (result == true) {
		model.addAttribute("message_register_success", "đăng kí thành công");
		} else {
		model.addAttribute("message_register_fail", " đăng kí thất bại");
	}
		return "user/login_register";
	}

	@RequestMapping(value = "forgetpass")
	public String forgetPass(ModelMap model) {
		return "forgetpass";
	}

//	@RequestMapping(value = "forgetpass", method = RequestMethod.POST)
//	public String forgetPass_(@RequestParam("username_login") String username, ModelMap model, HttpSession session) {
//		String pass = RandomStringUtils.randomAlphanumeric(12);
//		Users user = userService.checkUsernameForgetPass(username);
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
//		if (user != null && user.getRole().getRole_id() == 3) {
//			try {
//				MimeMessage mail = mailer.createMimeMessage();
//				MimeMessageHelper helper = new MimeMessageHelper(mail);
//				helper.setFrom("tu01202880908@gmail.com", "ADMIN ELECTRONIC COMPONENTS SHOP");
//				helper.setTo(user.getUsers_username());
//				helper.setReplyTo("admin@gmail.com", "ADMIN ELECTRONIC COMPONENTS SHOP");
//				helper.setSubject("Há»— Trá»£ QuÃªn Máº­t Kháº©u");
//				helper.setText("Máº­t kháº©u má»›i cá»§a báº¡n lÃ  : " + pass, true);
//				user.setUsers_password(pass);
//				boolean check = adminService.updateUserCus(user);
//				if (check == false) {
//					model.addAttribute("message_user", "Thay Ä‘á»•i máº­t kháº©u khÃ´ng thÃ nh cÃ´ng");
//					return "forgetpass";
//				}
//				mailer.send(mail);
//				return "login_register";
//			} catch (Exception e) {
//				model.addAttribute("message_mail", " Gá»­i mail khÃ´ng thÃ nh cÃ´ng");
//			}
//		}
//		model.addAttribute("checkuser", "TÃ i khoáº£n khÃ´ng há»£p lá»‡!");
//		return "forgetpass";
//	}
	public boolean addCustomer_test(String sdt, String password, String name, String diachi, boolean gender) {
		TKKH user = new TKKH();
		KhachHang customer = new KhachHang();
		
		
		customer.setHOTEN(name);
		customer.setDIACHI(diachi);
		customer.setSDT(sdt);
	
			user.setTK(sdt);
		//	user.setMK(BCrypt.hashpw(password, BCrypt.gensalt(12)));
			user.setMK(password);
			customer.setTkkh(user);
			user.setCustomer(customer);

		return addCustomer(user, customer);
	}
	@Transactional
	public boolean addCustomer(TKKH user, KhachHang customer) {
		boolean check = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		//Transaction t = (Transaction) session.beginTransaction();
		try {
			
			session.save(customer);
			session.save(user);
			t.commit();
		} catch (Exception e) {
			
				t.rollback();
			check = false;
		} finally {
			session.close();
		}
		return check;
	}
	
	
	public TKKH checkUserLogin(String username, String password) {
		TKKH user = getUserByUserName(username);
		if (user != null) {
			// kiá»ƒm tra password trong database vá»›i password vá»«a láº¥y vá»� (Ä‘Ã£ mÃ£ hÃ³a)
			if(password.equals(user.getMK())) {
			//if  (BCrypt.checkpw(password, user.getTK())) {
				return user;
			} else {
				return null;
			}
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public TKKH getUserByUserName(String username) {
		//try {
			Session session = factory.getCurrentSession();
			String hql = "FROM TKKH WHERE TK LIKE '" + username + "'";
			Query query = session.createQuery(hql);
			List<TKKH> list = query.list();
			return list.get(0);

//		} catch (Exception e) {
//			// KhÃ´ng tá»“n táº¡i username
//			return null;
//		}

	}

	
	
	
	
}
