package controller.user;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;



import entity.GioHang;
import entity.LoaiSP;
import entity.PhieuDat;

import entity.SanPham;

@Transactional
@Controller
public class CategoryController {
	@Autowired
//	private CategoryService categoryService;
//
//	@Autowired
//	private ProductService productService;
//
//	@Autowired
//	CartService cartService;
	SessionFactory factory;
	
	////requestmapping
	@RequestMapping(value = "product")
	public String showCategory(ModelMap model, HttpSession session) {
		try {
//			Session ss = factory.getCurrentSession();
//			String hql = "FROM SanPham";
//			Query query = ss.createQuery(hql);
////			query.setMaxResults(1);
////			SanPham sp = (SanPham)query.uniqueResult();
////			System.out.println(sp.getMASP());
			List<SanPham> list = getAllSP();
			model.addAttribute("all_product",list);
		}
		catch(Exception ex){
			
		}
		
//		List<Product> listPro = productService.getAllProduct();
//		int page = listPro.size() / 8;
//		if (listPro.size() % 8 != 0) {
//			page += 1;
//		}
//		model.addAttribute("page", page);
//		model.addAttribute("all_category", categoryService.getAllCategory());
//		model.addAttribute("all_product", productService.getProductLimit(0));
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		model.addAttribute("cartCount", gh.getItems().size());
		
		return "product";
	}
	
//	
//	
//	

	
//	
//	
//	
//	
	@RequestMapping(value = "product/{product-id}")
	public String productSingle(@PathVariable("product-id") int Masp, ModelMap model, HttpSession session) {
		Session ss = factory.getCurrentSession();
		SanPham sp = (SanPham) ss.get(SanPham.class, Masp);
		model.addAttribute("productsingle", sp);
		int masp=sp.getMASP();
		int maloai=sp.getLoaisp().getMALOAI();
		LoaiSP lsp = (LoaiSP) ss.get(LoaiSP.class,maloai);
				//		System.out.println(lsp.getMALOAI());
		model.addAttribute("all_product",getSPKhac(lsp.getMALOAI(),masp));
//		Cart cart = cartService.getGioHang(session);
		//		Product p = productService.getProductID(productID);
//		model.addAttribute("productsingle", sp);
//		model.addAttribute("all_product", productService.getProductByCategoryID(p.getCategoryID().getCategory_id()));
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		model.addAttribute("cartCount", gh.getItems().size());
		return "product_single";
	}
//
	@RequestMapping(value = "pages/{page-id}")
	public String showSLimit(@PathVariable("page-id") int first, ModelMap model, HttpSession session) {
		List<SanPham> listsp = getAllSP();
		int page = listsp.size() / 8;
		if (listsp.size() % 8 != 0) {
			page += 1;
		}
		model.addAttribute("page", page);
		model.addAttribute("all_category",getAllLoaiSP());
		model.addAttribute("all_product", getSPLimit((first - 1) * 8));
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		model.addAttribute("cartCount", gh.getItems().size());
		
		
		
//		List<Product> listPro = productService.getAllProduct();
//		int page = listPro.size() / 8;
//		if (listPro.size() % 8 != 0) {
//			page += 1;
//		}
//		model.addAttribute("page", page);
//		model.addAttribute("all_category", categoryService.getAllCategory());
//		model.addAttribute("all_product", productService.getProductLimit((first - 1) * 8));
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		return "product";
	}
//
	@RequestMapping(value = { "category/{category-id}" })
	public String showCategoryByID(@PathVariable("category-id") int MALOAI, ModelMap model, HttpSession session) {
		Session ss = factory.getCurrentSession();
		LoaiSP lsp = (LoaiSP) ss.get(LoaiSP.class, MALOAI);
		List<SanPham> listsp = getSPMALoai(MALOAI);
		int page = listsp.size() / 8;
		if (listsp.size() % 8 != 0) {
			page += 1;
		}
		model.addAttribute("pagecategory", page);
		model.addAttribute("category",lsp);
		model.addAttribute("all_category", getAllLoaiSP());
		model.addAttribute("all_product",getSPLLimit(MALOAI,0) );
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		model.addAttribute("cartCount", gh.getItems().size());

		
		//		Category c = categoryService.getCategoryID(categoryID);
//		List<Product> listPro = productService.getProductByCategoryID(c.getCategory_id());
//		int page = listPro.size() / 8;
//		if (listPro.size() % 8 != 0) {
//			page += 1;
//		}
//		model.addAttribute("pagecategory", page);
//		model.addAttribute("category", c);
//		model.addAttribute("all_category", categoryService.getAllCategory());
//		model.addAttribute("all_product", productService.getProductByCategoryIDLimit(categoryID, 0));
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		return "productcategory";
	}
/////
	
	
	
	/////
	
	
	//
	@RequestMapping(value = "pages/{category-id}/{page-id}")
	public String showProductLimitCategory(@PathVariable("category-id") int maloai,
			@PathVariable("page-id") int first, ModelMap model, HttpSession session) {
		Session ss = factory.getCurrentSession();
		LoaiSP lsp = (LoaiSP) ss.get(LoaiSP.class, maloai);
		
		List<SanPham> listsp = getSPMALoai(maloai);
		int page = listsp.size() / 8;
		if (listsp.size() % 8 != 0) {
			page += 1;
		}
		model.addAttribute("category", lsp);
		model.addAttribute("pagecategory", page);
		model.addAttribute("all_category", getAllLoaiSP());
		model.addAttribute("all_product", getSPLLimit(maloai, (first - 1) * 8));
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		
		model.addAttribute("cartCount", gh.getItems().size());
		///
//		Category c = categoryService.getCategoryID(categoryid);
//		List<Product> listPro = productService.getProductByCategoryID(categoryid);
//		int page = listPro.size() / 8;
//		if (listPro.size() % 8 != 0) {
//			page += 1;
//		}
//		model.addAttribute("category", c);
//		model.addAttribute("pagecategory", page);
//		model.addAttribute("all_category", categoryService.getAllCategory());
//		model.addAttribute("all_product", productService.getProductByCategoryIDLimit(categoryid, (first - 1) * 8));
//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		return "productcategory";	
		}
//
	////
	////
	///
	
	@RequestMapping(value = "cart")
	public String cart(HttpSession session, ModelMap model, Model mod) {
		String some = (String) mod.asMap().get("tb");
		GioHang gh = (GioHang)session.getAttribute("gioHang");
		if(gh == null) {
			gh= new GioHang();
			session.setAttribute("gioHang",gh);
		}
		
		model.addAttribute("cartCount", gh.getItems().size());
		//		Cart cart = cartService.getGioHang(session);
//		model.addAttribute("cartCount", cart.getItems().size());
		gh.getTong();
		
		return "cart";
	}
////////function//////////
	///////
	public List<SanPham> getSPLLimit(int maloai, int first) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham WHERE MALOAI LIKE '" +  maloai + "'";
			Query query = session.createQuery(hql).setFirstResult(first).setMaxResults(8);
			List<SanPham> list = query.list();
			return list;

		} catch (Exception e) {
			return null;
		}

	}
	////
	public List<SanPham> getSPMALoai(int maloai) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham WHERE MALOAI LIKE '" + maloai + "'" ;
			Query query = session.createQuery(hql);
			List<SanPham> list = query.list();
			return list;

		} catch (Exception e) {
			return null;
		}

	}
	////
	public List<SanPham> getSPLimit(int first) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham ORDER BY MASP DESC";
			Query query = session.createQuery(hql).setFirstResult(first).setMaxResults(8);
			List<SanPham> list = query.list();
			return list;

		} catch (Exception e) {
			return null;
		}
	}
////
	public List<LoaiSP> getAllLoaiSP() {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM LoaiSP";
			Query query = session.createQuery(hql);
			List<LoaiSP> list = query.list();
			return list;

		} catch (Exception e) {

			return null;
		}
	}
/////
	public List<SanPham> getSPKhac(int maloai, int masp) {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham WHERE MALOAI LIKE '" + maloai + "'AND MASP != '" + masp + "'" ;
			Query query = session.createQuery(hql);
			List<SanPham> list = query.list();
			return list;

		} catch (Exception e) {
			return null;
		}

	}
	//////
	public List<SanPham> getAllSP() {
		try {
			Session session = factory.getCurrentSession();
			String hql = "FROM SanPham WHERE SOLUONG!=0 AND TINHTRANG=True";
			Query query = session.createQuery(hql);
			List<SanPham> list = query.list();
			return list;

		} catch (Exception e) {
			return null;
		}
	}
	
	//////////////////////////////

}
