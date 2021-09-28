package tw.InHouse.member_model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import tw.InHouse.order_model.ShopCart;

@Entity 
@Table(name = "member", 
        uniqueConstraints = {
        @UniqueConstraint(name = "member_UK", columnNames = "member_name"),
		@UniqueConstraint(name = "member_UK1", columnNames = "member_email")})
public class Member {
	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   @Column(name = "member_id", nullable = false)
       private int member_id;
	   @Column(name = "member_name", nullable = false)
       private String member_name;
       private String member_password;
       private String member_gender;
       @Column(name = "member_email", nullable = false)
       private String member_email;
       private String member_phone;
       private String member_address;
       private String member_birthday;
       private String member_photo;
//       購物車對應關係
       @JsonManagedReference(value = "member")
       @OneToMany(fetch = FetchType.EAGER ,mappedBy = "member")
       private Set<ShopCart> shopCart = new HashSet<ShopCart>();
       
       
	public Member() {
	}

	public Member(int member_id, String member_name, String member_password, String member_gender, String member_email,
			String member_phone, String member_address, String member_birthday, String member_photo) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_password = member_password;
		this.member_gender = member_gender;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_address = member_address;
		this.member_birthday = member_birthday;
		this.member_photo = member_photo;
	}
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_address() {
		return member_address;
	}
	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}
	public String getMember_birthday() {
		return member_birthday;
	}
	public void setMember_birthday(String member_birthday) {
		this.member_birthday = member_birthday;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	
	
//	購物車對應關係
	public Set<ShopCart> getShopCart() {
		return shopCart;
	}

	public void setShopCart(Set<ShopCart> shopCart) {
		this.shopCart = shopCart;
	}
       
       
}
