package controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin")
public class CustomerManager {

//
//	@RequestMapping("manager_customer")
//	public String dataTable(Model model) {
//		model.addAttribute("view_user", adminService.GetAllUserCus());
//		return "manager_customer";
//	}
//
//	@RequestMapping(value = "insertCus", method = RequestMethod.GET)
//	public String insertCustomer(Model model) {
//		model.addAttribute("insertCustomer", new Users());
//		return "customer-manager/insertCus";
//	}
//
//	@RequestMapping(value = "insertCus", method = RequestMethod.POST)
//	public String insertCustomer_(HttpServletRequest request, Model model,
//			@Validated @ModelAttribute("insertCustomer") Users user, BindingResult errors) {
//		if (errors.hasErrors()) {
//			model.addAttribute("massage_insert", "Thêm không thành công");
//			return "customer-manager/insertCus";
//		} else {
//			boolean check = adminService.addCustomer(user);
//			if (check == true) {
//				model.addAttribute("view_user", adminService.GetAllUserCus());
//				return "redirect:manager_customer.htm";
//			} else {
//				model.addAttribute("massage_insert", "Thêm không thành công");
//				return "redirect:" + request.getHeader("Referer");
//			}
//		}
//
//	}
//
//	@RequestMapping("edit/{user-id}")
//	public String editCustomer(@PathVariable("user-id") int userId, ModelMap model) {
//		Users user = adminService.checkdEdit(userId);
//		model.addAttribute("userCus", user);
//		return "customer-manager/editCus";
//	}
//
//	@RequestMapping("edit")
//	public String editCustomer_(HttpServletRequest request, @ModelAttribute("userCus") Users user, ModelMap model,
//			BindingResult errors) {
//		if (user.getUsers_username().trim().length() == 0) {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:" + request.getHeader("Referer");
//		}
//		if (user.getCustomer() == null) {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:" + request.getHeader("Referer");
//		}
//		boolean check = adminService.updateUserCus(user);
//		if (check == true) {
//			model.addAttribute("view_user", adminService.GetAllUserCus());
//			return "redirect:manager_customer.htm";
//		} else {
//			model.addAttribute("massage_edit", "Cập nhật không thành công");
//			return "redirect:" + request.getHeader("Referer");
//		}
//
//	}
//
//	@RequestMapping(value = "delete/{user-id}")
//	public String deleteCus(HttpServletRequest request, @PathVariable("user-id") int userId, ModelMap model) {
//		Users user = adminService.checkdEdit(userId);
//		boolean check = adminService.deleteUserCus(user);
//		if (check == true) {
//			model.addAttribute("view_user", adminService.GetAllUserCus());
//		} else {
//			model.addAttribute("massage_delete", "Xóa không thành công");
//		}
//
//		return "redirect:" + request.getHeader("Referer");
//	}

}
