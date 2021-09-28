package tw.InHouse.product_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.InHouse.coupon_model.Coupon;
import tw.InHouse.coupon_model.CouponService;
import tw.InHouse.product_model.Product;
import tw.InHouse.product_model.ProductService;


@Controller
@RequestMapping(path = "/inhouse/shop")
@SessionAttributes(names = {"totalPages","totalElements","TypeName","CountMemberLike"})
public class ShopController {
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private CouponService cService;
	
	
//	@RequestMapping(path = "/ShopAllProduct")
//	public String getAllProduct(Model model) {
//		List<Product> products = pService.findAllProduct();
//		model.addAttribute("AllProduct", products);
//		return "product/shop";
//	}
	
	// 商品分類
	@GetMapping(path = "/findByType/1/{pageNo}")
	public String processFindByType1(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = pService.findType1(pageable);
		// List<Product> type1 = pService.findType1();
		// int totalElements = type1.size();
		// System.out.println("type1.size()"+totalElements);

		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

//			m.addAttribute("totalElements", totalElements);
//			
//			m.addAttribute("AllProduct", type1);

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		m.addAttribute("AllProduct", page.getContent());
		m.addAttribute("TypeName", "桌椅系列");

		return "product/shoptest2-1";
	}
	@GetMapping(path = "/findByType/2/{pageNo}")
	public String processFindByType2(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = pService.findType2(pageable);

		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		m.addAttribute("AllProduct", page.getContent());
		m.addAttribute("TypeName", "沙發系列");

		return "product/shoptest2-1";
	}
	@GetMapping(path = "/findByType/3/{pageNo}")
	public String processFindByType3(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = pService.findType3(pageable);

		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		m.addAttribute("AllProduct", page.getContent());
		m.addAttribute("TypeName", "床架系列");

		return "product/shoptest2-1";
	}
	@GetMapping(path = "/findByType/4/{pageNo}")
	public String processFindByType4(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = pService.findType4(pageable);

		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		m.addAttribute("AllProduct", page.getContent());
		m.addAttribute("TypeName", "收納系列");

		return "product/shoptest2-1";
	}
	@GetMapping(path = "/findByType/5/{pageNo}")
	public String processFindByType5(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = pService.findType5(pageable);

		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		m.addAttribute("AllProduct", page.getContent());
		m.addAttribute("TypeName", " 相關商品");

		return "product/shoptest2-1";
	}
	
	//模糊搜尋
	@GetMapping(path ="/findByName")
	@ResponseBody
	public List<Product> processFindByName(@RequestParam("product_name") String product_name, Model m) {
		//List<Product> page = pService.findByProductName(product_name);
		System.out.println("111");
		System.out.println(product_name);
		//System.out.println(page.size());
				
		//m.addAttribute("AllProduct",page);
		//m.addAttribute("TypeName","搜尋結果");
		
		//return "product/shoptest2";
		return pService.findByProductName(product_name);
	}
	
	//所有商品畫面
	@RequestMapping(path = "/ShopAllProduct")
	public String getAllProduct2(Model model) {
		List<Product> products = pService.findAllProduct();
		List<Coupon> coupons = cService.findAllBymember(2);
		model.addAttribute("AllProduct", products);
		model.addAttribute("MemberCoupon", coupons);
		return "product/shoptest2-1";
	}
	
	// 用價錢排序
	@GetMapping(path = "/queryByHighPrice")
	@ResponseBody
	public List<Product> processQueryByHighPrice() {
		System.out.println("processQueryByHighPrice()");
		return pService.queryByHighPrice();
	}
	@GetMapping(path = "/queryByLowPrice")
	@ResponseBody
	public List<Product> processQueryByLowPrice() {
		System.out.println("processQueryByLowPrice()");
		return pService.queryByLowPrice();
	}
		
	// 查看是否有沒有按過收藏
	@PostMapping(path = "/keep/{product_id}/{member_name}")
	// @ResponseBody
	public String findLike(@PathVariable(value = "member_name") String member_name,
			@PathVariable(value = "product_id") Integer product_id, Model m) {

		List<String> Ls = (List<String>) pService.findLike(product_id, member_name);
		System.out.println(Ls + "這是空的嗎???");
		// 如果沒有資料 就讓他+1
		if (Ls.isEmpty()) {
			System.out.println("還沒有資料");
			pService.addLike(product_id, member_name);
			pService.countLike(product_id);
			return "redirect:/inhouse/shop/queryallbypage/1";
		}

		System.out.println("member_id:" + member_name + ",已經有product_id:" + product_id + "的資料了");

		return null;
	}
	
	// 會員的收藏資料
	@GetMapping(path = "/findProductByMemberName")
	@ResponseBody
	public List<Product> processFindProductByMemberName(@RequestParam("member_name") String member_name, Model m) {
		// List<Product> page = pService.findByProductName(product_name);
		System.out.println("processCountByMemberName()" + member_name);
		return pService.findProductByMember(member_name);
	}
	
	//刪除收藏資料
	@PostMapping(path = "/delete/{product_id}/{member_name}")
	@ResponseBody
	public void processDeleteMemberLike(@PathVariable(value = "member_name") String member_name,
										@PathVariable(value = "product_id") Integer product_id) {
		System.out.println("processDeleteMemberLike()" + member_name + product_id);
		pService.deleteMemberLike(product_id, member_name);
	}
	
	//分頁
	@GetMapping(path = "/queryallbypage/{pageNo}")
	public String processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = pService.findAllByPage(pageable);
		
		List<Coupon> coupons = cService.findAllBymember(2);
		m.addAttribute("MemberCoupon", coupons);

		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);
		m.addAttribute("AllProduct",page.getContent());
		m.addAttribute("TypeName", "所有商品");
		m.addAttribute("pageNo", pageNo);
        
		return "product/shoptest2-1";
	}
	
	//檢視商品資訊
	@GetMapping(path = "/findById/{pid}")
	public String processFindProductById(@PathVariable("pid") int pid, Model m) {
		System.out.println(pid);
		Product p = pService.findProductById(pid);
//		List<Product> findById = pService.findById(pid);
		//上一頁
		List<Product> findPrevious = pService.findPrevious(pid);
		System.out.println(findPrevious);
		//下一頁
		List<Product> findNext = pService.findNext(pid);
		System.out.println(findNext);
		
		
		m.addAttribute("FindById", p);
		
		//上一頁
		m.addAttribute("findPrevious", findPrevious);
		//下一頁
		m.addAttribute("findNext", findNext);
		
		return "product/ViewProductDetail";
	}
//	@GetMapping(path = "/findById/{pid}")
//	public String processFindProductById(@PathVariable("pid") int pid, Model m) {
//		System.out.println(pid);
//		Product p = pService.findProductById(pid);
//		m.addAttribute("FindById", p);
//		return "product/ViewProductDetail";
//	}
	
	
//	@RequestMapping(path = "/ShopAllProduct3")
//	public String getAllProduct3(Model model) {
//		return "product/shopCheckOut";
//	}
	
	
}
