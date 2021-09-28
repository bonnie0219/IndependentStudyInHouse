package tw.InHouse.coupon_model;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import tw.InHouse.order_model.ShopCartService;

@Service
public class CouponService {
	@Autowired
	private CouponRepository couponRepository; 
	
//	@Autowired
//	private ShopCartService shopCartService;  
	
	public Coupon findByCoupon_id(Integer id) {
		Optional<Coupon> pRep = couponRepository.findById(id);
		
		if(pRep.isPresent()) {
			return pRep.get();
		}
		
		return null;
	}
	
	//
	
	  public List<Coupon> findAllBymember(int member_id){
		  return  couponRepository.findBymember(member_id);
	  }	  ;
	
	
	//
	
	public List<Coupon> findAll(){
		return couponRepository.findAll();
	}
	
	public Page<Coupon> findAllByPage(Pageable pageable){
		return couponRepository.findAll(pageable);
	}
	
	
	
	
	
	public Coupon insertCoupon(Coupon c) {
		return couponRepository.save(c);
	}
	
	public Coupon updateCoupon(Coupon c) {
		return couponRepository.save(c);
	}
	
	public void deleteCoupon(Coupon c) {
		couponRepository.delete(c);
	}
	
	
	public void deleteByCoupon_id(Integer pid) {
		couponRepository.deleteById(pid);
	}
	
}

