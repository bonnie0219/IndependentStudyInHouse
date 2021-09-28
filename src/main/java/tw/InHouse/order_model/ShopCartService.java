package tw.InHouse.order_model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import tw.InHouse.echarts.Revenue;
import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberRepository;
import tw.InHouse.member_model.MemberService;
import tw.InHouse.reserve_model.Reserve;

@Service
@Transactional
public class ShopCartService {
	
	@Autowired
	private ShopCarRepository sRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private MemberService mService;
	
	//insert
	public ShopCart insert(ShopCart cart) {
		return sRepository.save(cart);
	}
	
//	public ShopCart insert(ShopCart shopCart) {
//			
//	 Member member = memberRepository.getById(shopCart.getMember().getMember_id());
//	 shopCart.setMember(member);
//		return sRepository.save(shopCart);
//	}
//	
//    public List<Reserve> findByMemberid(Integer memberid){
//        return sRepository.findByShopcart_memberid(memberid);
//}
	
	//update
	public ShopCart upadate(ShopCart cart) {
		return sRepository.save(cart);
	}
	
	
	//finById
	public ShopCart findById(int id) {
		Optional<ShopCart> shopOrderRep = sRepository.findById(id);
		if (shopOrderRep.isPresent()) {			
			return shopOrderRep.get();
		}
		return null;
	}
	
	//delete
	public void deleteShopCart(Integer id) {
		sRepository.deleteById(id);
	}
	
	//findAll
	public List<ShopCart> findAll(){
		return sRepository.findAll();
	}
	
    //queryByUserOrderDetail
    
    public List<ShopCart> queryByUserOrderDetail(int mid) {
        Member member = mService.findByMember_id(mid);
        System.out.println("取得對應使用者成功");
        List<ShopCart> UserOrderDetail = sRepository.findByMember(member);
        System.out.println("查詢訂單成功");
        System.out.println(UserOrderDetail);
        return UserOrderDetail;
    }
    
	//圖表專用echarts
    public List searchRevenue(){
    	List list =sRepository.searchRevenue();
    	
        List<Revenue> list1 = new ArrayList<>();
    	for(int i=0;i<list.size();i++) {
    		Revenue revenue = new Revenue();
    		revenue.setRevenue(Integer.parseInt(((Object[])list.get(i))[0].toString()));
    		System.out.println((Integer.parseInt(((Object[])list.get(i))[0].toString())));
    		revenue.setDate(String.valueOf(((Object[])list.get(i))[1].toString()));
    		System.out.println((String.valueOf(((Object[])list.get(i))[1].toString())));
    		list1.add(revenue);
    		
    	}
    	
//    	System.out.println("list:"+((Object[])list.get(0))[0].toString());
//    	System.out.println("list:"+((Object[])list.get(0))[1].toString());
//    	System.out.println("list:"+((Object[])list.get(1))[0].toString());
//    	System.out.println("list:"+((Object[])list.get(1))[1].toString());
//    	System.out.println("list1:"+list1.get(0).toString());
    	System.out.println("list1:"+list1.size());
    	
    	
		return list1;
	}
}
