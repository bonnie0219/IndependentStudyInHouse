package tw.InHouse.order_model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopCartOrderItemService {
	
	@Autowired
	private ShopCartOrderItemRepository sRepository;
	
	//insert
	public ShopCartOrderItem insertCartOrderItem(ShopCartOrderItem sOrderItem) {
		return sRepository.save(sOrderItem);
	}
	
	//update
	public ShopCartOrderItem updateCartOrderItem(ShopCartOrderItem sOrderItem) {
		return sRepository.save(sOrderItem);
	}
	
	public List<ShopCartOrderItem> findByShopCartOrderItemDetail(int shopcartid){
		return sRepository.findByShopCartOrderItemDetail(shopcartid);
	}
}
