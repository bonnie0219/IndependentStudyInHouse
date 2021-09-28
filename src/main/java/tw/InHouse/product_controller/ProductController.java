package tw.InHouse.product_controller;

import java.io.File;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.InHouse.product_model.Product;
import tw.InHouse.product_model.ProductService;

@Controller
@RequestMapping(path = "/backend/product")
public class ProductController {

	@Autowired
	private ProductService pService;

	@GetMapping(path = "/AllProduct")
	public String processAllProduct() {
		return "product/AllPorduct";
	}

	@PostMapping(path = "/all")
	@ResponseBody
	public List<Product> processFindAllProduct() {
		return pService.findAllProduct();
	}

	@PostMapping(path = "/findById/{pid}")
	@ResponseBody
	public Product processFindProductById(@PathVariable("pid") int pid) {
		System.out.println();
		return pService.findProductById(pid);
	}

	@GetMapping(path = "/AddProductForm")
	public String processAddProductForm() {
		return "product/AddProduct";
	}


	public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/product";
	
	@PostMapping(path = "/add")
	@ResponseBody
	public String processAddProduct(String product_name, String product_type, String product_color,
			String product_price, String product_size, String product_quantity, String product_picture,
			String product_descrip, MultipartFile file) throws Exception {
		
	
//		product_price="";
//		product_quantity="";
		
		
		Product p = new Product();
		p.setProduct_name(product_name);
		System.out.println(p.getProduct_name());
		p.setProduct_type(product_type);
		p.setProduct_color(product_color);
		p.setProduct_price(Integer.parseInt(product_price));
		p.setProduct_size(product_size);
		p.setProduct_picture(product_picture);
		p.setProduct_quantity(Integer.parseInt(product_quantity));

		if (!file.isEmpty()) {
			String fileName = file.getOriginalFilename();
			System.out.println("fileName:" + fileName);
			String saveDirPath = uploadDirectory;
			File savefileDir = new File(saveDirPath);
			savefileDir.mkdirs();
			File saveFilePath = new File(savefileDir, fileName);
			file.transferTo(saveFilePath);
			System.out.println("saveFilePath:" + saveFilePath);

			p.setProduct_picture("/" + fileName);
		}

		p.setProduct_descrip(product_descrip);
		p.setProduct_updatetime(new Date());
		pService.insertProduct(p);
		return "product/AllPorduct";
	}

	
	@PostMapping(path = "/update/{id}")
	@ResponseBody
	public Product processUpdateProduct(String product_id_edit,String product_name_edit, String product_type_edit, String product_color_edit,
			String product_price_edit, String product_size_edit, String product_quantity_edit, String product_picture_edit,
			String product_descrip_edit, MultipartFile file_edit) throws Exception{
		
		Product p = new Product();
		p.setProduct_id(Integer.parseInt(product_id_edit));
		p.setProduct_name(product_name_edit);
		System.out.println(p.getProduct_name());
		p.setProduct_type(product_type_edit);
		p.setProduct_color(product_color_edit);
		p.setProduct_price(Integer.parseInt(product_price_edit));
		p.setProduct_size(product_size_edit);
		p.setProduct_picture(product_picture_edit);
		p.setProduct_quantity(Integer.parseInt(product_quantity_edit));

		if (!file_edit.isEmpty()) {
			String fileName = file_edit.getOriginalFilename();
			System.out.println("fileName:" + fileName);
			String saveDirPath = uploadDirectory;
			File savefileDir = new File(saveDirPath);
			savefileDir.mkdirs();
			File saveFilePath = new File(savefileDir, fileName);
			file_edit.transferTo(saveFilePath);
			System.out.println("saveFilePath:" + saveFilePath);

			p.setProduct_picture("/" + fileName);
		}

		p.setProduct_descrip(product_descrip_edit);
		p.setProduct_updatetime(new Date());
		return pService.updateProduct(p);
	}

	@PostMapping(path = "/delete/{id}")
	@ResponseBody
	public void delete(@PathVariable Integer id) {
		pService.deleteProduct(id);
	}

	@PostMapping(path = "/queryallproductbypage/{pageNo}")
	@ResponseBody
	public List<Product> processQueryByPageAction(@PathVariable("pageNo") int pageNo, Model m) {
		int pageSize = 8;

		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		Page<Product> page = pService.findAllProductByPage(pageable);

		int totalPages = page.getTotalPages();
		long totalElements = page.getTotalElements();

		m.addAttribute("totalPages", totalPages);
		m.addAttribute("totalElements", totalElements);

		return page.getContent();
	}

	
}
