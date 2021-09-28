package tw.InHouse.order_model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ShopCartOrderItemRepository extends JpaRepository<ShopCartOrderItem, Integer> {
	@Query(value = "SELECT * FROM shopcartorderitem Where fk_cartid=?1", nativeQuery = true)
	public List<ShopCartOrderItem> findByShopCartOrderItemDetail(int shopcartid);
}
