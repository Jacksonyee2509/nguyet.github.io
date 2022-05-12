package controller.admin;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import entity.TKNV;
@Transactional
@Controller
@RequestMapping(value="/")
public class AdminController {
	@Autowired
	SessionFactory factory;

public TKNV loginAuth(String username, String passwd) {
		
		Session session = factory.getCurrentSession(); 
		String hql="FROM TKNV WHERE TK = :username";
		Query qr = session.createQuery(hql);
		TKNV u = (TKNV) qr.setParameter("username",username).uniqueResult();
		if (u != null && u.getMK().equals(passwd)) {
            return u;
        }
		return null;
	}

	@RequestMapping(value="admin")
	public String admin(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if (session.getAttribute("role") == null) {
			return "redirect:admin/login.htm";
		}
		
		return "admin/admin";
	}
	
	@RequestMapping(value="admin/login")
	public String login(HttpSession session, ModelMap model) {
		return "admin/login";
	}
	

	@RequestMapping(value = "admin/login", method = RequestMethod.POST)
	public String login(@RequestParam("username_login") String username,
			@RequestParam("password_login") String password, HttpSession session, ModelMap model) {
		
		TKNV tk = loginAuth(username, password);	
		if (tk != null) {
			session.setAttribute("role", tk.getNhanvien().getChucvu().getMACV());
			return "redirect:admin.htm";
		} 
		else {
			model.addAttribute("message", "Thông tin tài khoản không đúng!");
			return "admin/login";
		}	
	}

	@RequestMapping(value = "logoutAD")
	public String LoginAccount(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("role");
		return "redirect:index.htm";
	}

}
