package controller.user;


import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entity.PhieuDat;
//import dao.UserDao;
//import entity.Cart;


@Controller
public class HomeController {
//	@Autowired
//	ProductService productService;
//	@Autowired
//	CategoryService categoryService;
//	@Autowired
//	UserService userService;
//	@Autowired
//	UserDao userDao;
//	@Autowired
//	AdminService adminService;
//	@Autowired
//	SessionFactory factory;
//	@Autowired
//	CartService cartService;
	
	
	@RequestMapping(value = "index")
	public String Index(ModelMap model, HttpServletRequest request) {
		HttpSession session = request.getSession();
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
//		model.addAttribute("all_category", categoryService.getAllCategory());
//		model.addAttribute("all_product", productService.getAllProductFeature());
//		model.addAttribute("user", session.getAttribute("LoginInfo"));
		
		return "index";
	}

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String load(ModelMap model, HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		model.addAttribute("all_product", productService.getAllProductFeature());
//		model.addAttribute("all_category", categoryService.getAllCategory());
//		model.addAttribute("user", session.getAttribute("LoginInfo"));
//		
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
//PhieuDat pd= new PhieuDat();
//	pd.show();
		return "index";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String checkout(HttpSession session,ModelMap model, HttpServletRequest request) {
//		session = request.getSession();
//		model.addAttribute("user", session.getAttribute("LoginInfo"));
//		model.addAttribute("all_category", categoryService.getAllCategory());
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		if (session.getAttribute("LoginInfo") == null) {
			return "redirect:/login_register.htm";
		}
		return "checkout";
	}
}
