package tw.InHouse.product_model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	
	// 上一個商品
	public List<Product> findPrevious(Integer product_id) {
		System.out.println("findPrevious" + product_id);
		return productRepository.findPrevious(product_id);
	}

	// 找下一商品
	public List<Product> findNext(Integer product_id) {
		System.out.println("findNext" + product_id);
		return productRepository.findNext(product_id);
	}

	// 商品分類1-5
	public Page<Product> findType1(Pageable pageable) {
		System.out.println("桌椅系列");
		return productRepository.findType1(pageable);
	}

	public Page<Product> findType2(Pageable pageable) {
		System.out.println("沙發系列");
		return productRepository.findType2(pageable);
	}

	public Page<Product> findType3(Pageable pageable) {
		System.out.println("床架系列");
		return productRepository.findType3(pageable);
	}

	public Page<Product> findType4(Pageable pageable) {
		System.out.println("收納系列");
		return productRepository.findType4(pageable);
	}

	public Page<Product> findType5(Pageable pageable) {
		System.out.println("相關商品");
		return productRepository.findType5(pageable);
	}
	
	//利用名字找商品
	public List<Product> findByProductName(String product_name) {
		System.out.println("findByProductName"+product_name);
		return productRepository.findByProductName(product_name);
	}
	
	// 價錢高到低
	public List<Product> queryByHighPrice() {
		System.out.println("queryByHighPrice");
		return productRepository.queryByHighPrice();
	}

	// 價錢高到低
	public List<Product> queryByLowPrice() {
		System.out.println("queryByLowPrice");
		return productRepository.queryByLowPrice();
	}

	// 收藏數+1
	public void countLike(Integer product_id) {
		System.out.println(product_id + "+1");
		productRepository.countLike(product_id);
	}

	// 存入product_id 跟 member_name
	public void addLike(Integer product_id, String member_name) {
		System.out.println("會員ID:" + member_name + " 收藏了 ID為" + product_id + "的商品");
		productRepository.addLike(product_id, member_name);
	}

	// 查詢是否有收藏紀錄
	public List<String> findLike(Integer product_id, String member_name) {
		System.out.println("查詢" + member_name + "有沒有收藏 商品id為" + product_id + "的紀錄");
		System.out.println("findLike(Integer product_id,String member_name)"
				+ productRepository.findLike(product_id, member_name) + "是不是空的呢?");
		return productRepository.findLike(product_id, member_name);
	}

	// 收藏數總和
	public int countMemberLike(String member_name) {
		System.out.println(member_name);
		return productRepository.countMemberLike(member_name);
	}

	// 看會員有幾個收藏商品資料
	public List<Product> findProductByMember(String member_name) {
		System.out.println("findProductByMember");
		System.out.println(member_name);
		return productRepository.findProductByMember(member_name);
	}
	
	// 刪除收藏
	public void deleteMemberLike(Integer product_id, String member_name) {
		System.out.println("會員ID:" + member_name + " 刪除了 ID為" + product_id + "的商品");
		productRepository.deleteMemberLike(product_id, member_name);
	}
	
	public Product findProductById(Integer product_id) {
		
		Optional<Product> pRep = productRepository.findById(product_id);
		
		if (pRep.isPresent()) {
			return pRep.get();
		}
		
		return null;
	}
	
	
	public List<Product> findAllProduct() {
		return productRepository.findAll();
	}

	
	public Page<Product> findAllProductByPage(Pageable pageable) {
		return productRepository.findAll(pageable);
	}
	
	
	public Product insertProduct(Product p) {
		return productRepository.save(p);
	}
	
	
	public Product updateProduct(Product p) {
		return productRepository.save(p);
	}
	
	
	public void deleteProduct(Integer id) {
		productRepository.deleteById(id);
	}
	
	public Page<Product> findAllByPage(Pageable pageable){
		return productRepository.findAll(pageable);
	}
}
