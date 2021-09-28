package tw.InHouse.coupon_model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

//import ch05.many2one._02.anno.model.Employee;
import tw.InHouse.member_model.Member;
import tw.InHouse.order_model.ShopCart;




@Entity
@Table(name = "coupon")
@Component
public class Coupon {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int coupon_id;
	private String coupon_name;
	private String coupon_rule;
	private String coupon_type;
	private String coupon_status;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date coupon_starttime;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8") 
	private Date coupon_endtime;
	private int coupon_count;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8") 
	private Date coupon_addtime;
	private String coupon_photo;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "member_id")
	private Member member;
	
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name = "member_name")
//	private Member member2;
	
//	//
//	@ManyToOne  // 多對ㄧ，多方(Item類別)內有個儲存ㄧ方(Cart類別)物件參考的實例變數
//	// @JoinColumn: 定義多方(Items)所對應表格中的外來鍵為何。省略此註釋，
//	// Hibernate會自動產生ㄧ個外來鍵，預設名稱為: 此性質名稱_外來鍵對應的主鍵名稱
//	@JoinColumn(name="fk_member_id", nullable=false)  //是多方本來就有個外鍵
//	private Member member;    //2.小弟再多一個欄位 註冊成我是大哥小弟 主鍵的外鍵
	
	
	
	
	//
//	@OneToMany(mappedBy = "coupon", cascade = CascadeType.ALL)            //外鍵在對照類別 @JoinColumn(name = "department")
//	private List<ShopCart> shopCarts= new ArrayList<ShopCart>();
	 
	//
	
	
	
	
	
	public Coupon () {};
	
	
	
	
	
	//
	public Coupon(int coupon_id, String coupon_name) {
		super();
		this.coupon_name=coupon_name;
		this.coupon_id = coupon_id;
	
	}
	
	
	//
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_rule() {
		return coupon_rule;
	}
	public void setCoupon_rule(String coupon_rule) {
		this.coupon_rule = coupon_rule;
	}
	public String getCoupon_type() {
		return coupon_type;
	}
	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}
	public String getCoupon_status() {
		return coupon_status;
	}
	public void setCoupon_status(String coupon_status) {
		this.coupon_status = coupon_status;
	}
	public Date getCoupon_starttime() {
		return coupon_starttime;
	}
	public void setCoupon_starttime(Date coupon_starttime) {
		this.coupon_starttime = coupon_starttime;
	}
	public Date getCoupon_endtime() {
		return coupon_endtime;
	}
	public void setCoupon_endtime(Date coupon_endtime) {
		this.coupon_endtime = coupon_endtime;
	}
	public int getCoupon_count() {
		return coupon_count;
	}
	public void setCoupon_count(int coupon_count) {
		this.coupon_count = coupon_count;
	}
	public Date getCoupon_addtime() {
		return coupon_addtime;
	}
	public void setCoupon_addtime(Date coupon_addtime) {
		this.coupon_addtime = coupon_addtime;
	}
	public String getCoupon_photo() {
		return coupon_photo;
	}
	public void setCoupon_photo(String coupon_photo) {
		this.coupon_photo = coupon_photo;
	}





	public Member getMember() {
		return member;
	}





	public void setMember(Member member) {
		this.member = member;
	}









//
//	public List<ShopCart> getShopCarts() {
//		return shopCarts;
//	}
//
//
//
//
//
//	public void setShopCarts(List<ShopCart> shopCarts) {
//		this.shopCarts = shopCarts;
//	}
//	
	
	//





	

	//
	
	
	
	
	//
	
}
