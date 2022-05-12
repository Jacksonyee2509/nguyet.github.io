package controller.admin;

import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.ServletContextLiveBeansView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import entity.ChucVu;
import entity.LoaiSP;
import entity.NhanVien;
import entity.SanPham;
import entity.TKNV;

@Transactional
@Controller
@RequestMapping("/admin/")
public class EmloyeeManager {
	@Autowired
	SessionFactory factory;
	
	public List<NhanVien> getAllNhanVien() {
			Session session = factory.getCurrentSession();
			String hql = "FROM NhanVien";
			Query query = session.createQuery(hql);
			List<NhanVien> list = query.list();
			return list;
			
	}
	public List<ChucVu> getAllChucVu() {
			Session session = factory.getCurrentSession();
			String hql = "FROM ChucVu";
			Query query = session.createQuery(hql);
			List<ChucVu> list = query.list();
			return list;
}
	@RequestMapping("employee_info")
	public String emplInfo(Model model) {
		model.addAttribute("view_nv", this.getAllNhanVien());
		return "admin/employee-manager/info";
	}

	@RequestMapping(value = "addEmpl", method = RequestMethod.GET)
	public String addEmployee(Model model) {
		NhanVien nv = new NhanVien(); 
		model.addAttribute("nhanvien", nv);
		model.addAttribute("list_role", this.getAllChucVu());
		return "/admin/employee-manager/addEmpl";
	}

	@RequestMapping(value = "addEmpl", method = RequestMethod.POST)
	public String addEmployee(RedirectAttributes rdr, HttpServletRequest request, Model model,
			@Validated @ModelAttribute("nhanvien") NhanVien nv, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("massage_insert", "Thêm không thành công");
			model.addAttribute("list_role", this.getAllChucVu());
			return "admin/employee-manager/addEmpl";
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(nv);
				t.commit();
				rdr.addFlashAttribute("message", "Successed!");
			} catch (Exception e) {
				t.rollback();
				rdr.addFlashAttribute("message", "Failed!");
			} finally {
				session.close();
			}
			return "redirect:employee_info.htm";
		}
	}

	@RequestMapping(value="editEmpl/{user-id}",method=RequestMethod.GET)
	public String editEmloyee(@PathVariable("user-id") int manv, ModelMap model) {
		Session session = factory.openSession();
		NhanVien nv = (NhanVien) session.get(NhanVien.class, manv);
		System.out.println(manv);
		model.addAttribute("nhanvien", nv);
		model.addAttribute("list_role", this.getAllChucVu());
		return "admin/employee-manager/editEmpl";
	}

	@RequestMapping("editEmpl")
	public String editEmloyee(RedirectAttributes rdr, HttpServletRequest request, @Validated @ModelAttribute("nhanvien") NhanVien nv, ModelMap model,
			BindingResult errors) {
		if (nv.getHOTEN().trim().length() == 0) {
			model.addAttribute("massage_edit", "Cập nhật không thành công");
			return "redirect:employee_info.htm";
		}
		else {
			boolean check = true;
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(nv);
				t.commit();
				rdr.addFlashAttribute("message", "Succed!");
			} catch (Exception e) {
				t.rollback();
				rdr.addFlashAttribute("message", "Failed!");
				check = false;
			} finally {
				session.close();
			}
			if (check == true) {
				return "redirect:employee_info.htm";
			} else {
				model.addAttribute("massage_insert", "Cập nhật không thành công");
				return "redirect:" + request.getHeader("Referer");
			}
		}
	}

	@RequestMapping(value = "deleteEmpl/{user-id}")
	public String deleteCus(HttpServletRequest request, @PathVariable("user-id") int userId, ModelMap model) {
		return "redirect:" + request.getHeader("Referer");
	}
	//=============================Account Manager===================================
	public List<TKNV> getAllTK() {
		Session session = factory.getCurrentSession();
		String hql = "FROM TKNV";
		Query query = session.createQuery(hql);
		List<TKNV> list = query.list();
		return list;
	}
	
	public NhanVien findNVbyMa(int manv) {
		Session session = factory.openSession();
		NhanVien nv = (NhanVien) session.get(NhanVien.class, manv);
		return nv;
	}
	
	public TKNV findTKbyMa(int manv) {
		Session session = factory.getCurrentSession(); 
		String hql="FROM TKNV WHERE nhanvien.MANV = :manv";
		Query qr = session.createQuery(hql);
		TKNV tk = (TKNV) qr.setParameter("manv", manv).uniqueResult();
		return tk;
	}
	
	public TKNV findTK(String usrn) {
		Session session = factory.getCurrentSession(); 
		String hql="FROM TKNV WHERE TK = :tk";
		Query qr = session.createQuery(hql);
		TKNV tk = (TKNV) qr.setParameter("tk", usrn).uniqueResult();
		return tk;
	}
	
	@RequestMapping(value = "addAcc/{manv}", method = RequestMethod.GET)
	public String addAcc(@PathVariable("manv") int manv, Model model ) {
		TKNV tk = new TKNV(); 
		model.addAttribute("manv", manv);
		tk.setNhanvien(this.findNVbyMa(manv));
		model.addAttribute("taikhoan", tk);
		return "/admin/employee-manager/addAcc";
	}

	@RequestMapping(value = "addAcc", method = RequestMethod.POST)
	public String addAcc(RedirectAttributes rdr, Model model,
			@Validated @ModelAttribute("taikhoan") TKNV tk, BindingResult errors) {
		
		if (this.findTK(tk.getTK())!=null){
			model.addAttribute("message", "Please choose other username!");
			model.addAttribute("list_role", this.getAllChucVu());
			return "admin/employee-manager/addAcc";
		}
		if (errors.hasErrors()) {
			model.addAttribute("massage_insert", "Thêm không thành công");
			model.addAttribute("list_role", this.getAllChucVu());
			return "admin/employee-manager/addAcc";
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				tk.setTRANGTHAI(true);
				session.save(tk);
				t.commit();
				rdr.addFlashAttribute("message", "Succeed!");
			} catch (Exception e) {
				t.rollback();
				rdr.addFlashAttribute("message", "Failed!");
			} finally {
				session.close();
			}
				return "redirect:employee_info.htm";	
		}
	}
	
	@RequestMapping(value = "editAcc/{manv}", method = RequestMethod.GET)
	public String updateAcc(@PathVariable("manv") int manv, Model model ) {
		TKNV tk = this.findTKbyMa(manv); 
		model.addAttribute("taikhoan", tk);
		return "/admin/employee-manager/editAcc";
	}

	@RequestMapping(value = "editAcc", method = RequestMethod.POST)
	public String updateAcc(RedirectAttributes rdr, HttpServletRequest request, Model model,
			@Validated @ModelAttribute("taikhoan") TKNV tk, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("massage_insert", "Thêm không thành công");
			model.addAttribute("list_role", this.getAllChucVu());
			return "admin/employee-manager/editAcc";
		} else {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.update(tk);
				t.commit();
				rdr.addFlashAttribute("message", "Succeed!");
			} catch (Exception e) {
				t.rollback();
				rdr.addFlashAttribute("message", "Failed!");
			} finally {
				session.close();
			}
			return "redirect:employee_info.htm";
		}
	}
}
