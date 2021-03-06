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
		model.addAttribute("message_register_success", "????ng k?? th??nh c??ng");
		} else {
		model.addAttribute("message_register_fail", " ????ng k?? th???t b???i");
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
//				helper.setSubject("H??????? Tr?????? Qu????n M??????t Kh??????u");
//				helper.setText("M??????t kh??????u m???????i c??????a b??????n l???? : " + pass, true);
//				user.setUsers_password(pass);
//				boolean check = adminService.updateUserCus(user);
//				if (check == false) {
//					model.addAttribute("message_user", "Thay ????????????i m??????t kh??????u kh????ng th????nh c????ng");
//					return "forgetpass";
//				}
//				mailer.send(mail);
//				return "login_register";
//			} catch (Exception e) {
//				model.addAttribute("message_mail", " G??????i mail kh????ng th????nh c????ng");
//			}
//		}
//		model.addAttribute("checkuser", "T????i kho??????n kh????ng h??????p l???????!");
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
			// ki??????m tra password trong database v???????i password v??????a l??????y v??????? (????????? m???? h????a)
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
//			// Kh????ng t???????n t??????i username
//			return null;
//		}

	}

	
	
	
	
}
