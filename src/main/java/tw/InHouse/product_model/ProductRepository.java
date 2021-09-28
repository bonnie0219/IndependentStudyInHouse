package tw.InHouse.product_model;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<Product, Integer> {
	// 上一個商品
	@Modifying
	@Query(value = "Select Top 1 * From PRODUCT Where product_id <?1 Order By product_id Desc", nativeQuery = true)
	public List<Product> findPrevious(Integer product_id);

	// 下一個商品
	@Modifying
	@Query(value = "Select Top 1 * From PRODUCT Where product_id >?1 Order By product_id", nativeQuery = true)
	public List<Product> findNext(Integer product_id);

	// 商品分類
	@Query(value = "Select * from PRODUCT where product_type ='桌椅系列' Order by product_id Desc", nativeQuery = true)
	public Page<Product> findType1(Pageable pageable);

	@Query(value = "Select * from PRODUCT where product_type ='沙發系列' Order by product_id Desc", nativeQuery = true)
	public Page<Product> findType2(Pageable pageable);

	@Query(value = "Select * from PRODUCT where product_type ='床架系列' Order by product_id Desc", nativeQuery = true)
	public Page<Product> findType3(Pageable pageable);

	@Query(value = "Select * from PRODUCT where product_type ='收納系列' Order by product_id Desc", nativeQuery = true)
	public Page<Product> findType4(Pageable pageable);

	@Query(value = "Select * from PRODUCT where product_type ='相關商品' Order by product_id Desc", nativeQuery = true)
	public Page<Product> findType5(Pageable pageable);

//		@Query(value="Select * from PRODUCT where product_name like concat('%',?1,'%') Order by product_id Desc",nativeQuery = true)
//		public Page<Product> findByProductName(Pageable pageable, String product_name);

	// 模糊查詢
	@Modifying
	@Query(value = "Select * from PRODUCT where product_name like concat('%',?1,'%') Order by product_id Desc", nativeQuery = true)
	public List<Product> findByProductName(String product_name);

	// 用價錢高到低
	@Query(value = "Select * from PRODUCT Order by product_price Desc", nativeQuery = true)
	public List<Product> queryByHighPrice();

	// 用價錢低到高
	@Query(value = "Select * from PRODUCT Order by product_price", nativeQuery = true)
	public List<Product> queryByLowPrice();

	// product_like+1
	@Modifying
	@Query(value = "update product set product_like = product_like+1 where product_id= ?1", nativeQuery = true)
	public void countLike(Integer product_id);

	// 找有沒有資料了
	@Modifying
	@Query(value = "select * from product_member where product_id=?1 AND member_name=?2", nativeQuery = true)
	public List<String> findLike(Integer product_id, String member_name);

	// 新增一筆收藏
	@Modifying
	@Query(value = "insert into product_member(product_id,member_name)Values(?1,?2);", nativeQuery = true)
	public void addLike(Integer product_id, String member_name);

	// 刪除收藏紀錄
	@Modifying
	@Query(value = "delete from product_member where product_id=?1 ", nativeQuery = true)
	public void deleteLike(Integer product_id);

	// 找收藏數
	@Modifying
	@Query(value = "select count(*) from product_member where member_name=?1", nativeQuery = true)
	public int countMemberLike(String member_name);

	// 找會員收藏記錄
	@Modifying
	@Query(value = "select * from product where product_id IN (select product_id from product_member where member_name=?1)", nativeQuery = true)
	public List<Product> findProductByMember(String member_name);
	
	// 刪除收藏
	@Modifying
	@Query(value = " delete from product_member where product_id=?1 and member_name=?2;", nativeQuery = true)
	public int deleteMemberLike(Integer product_id, String member_name);
}
