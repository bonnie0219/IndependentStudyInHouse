package tw.InHouse.order_model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import tw.InHouse.member_model.Member;
import tw.InHouse.reserve_model.Reserve;

public interface ShopCarRepository extends JpaRepository<ShopCart, Integer> {
	public List<ShopCart> findByMember(Member member);

	@Modifying
	@Query(value="select sum(order_producttotalprice)'revenue',CAST(order_shoporderdate as Date)'date' from shopcart group by CAST(order_shoporderdate as Date);",nativeQuery = true)
	public List searchRevenue();
	
	
}
