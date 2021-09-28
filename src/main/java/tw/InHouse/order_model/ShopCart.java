package tw.InHouse.order_model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;

import tw.InHouse.member_model.Member;

@Component
@Entity
@Table(name = "shopcart")
public class ShopCart {
	
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDER_SHOPCARTID")
	private int order_shopCartId;

	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	@Column(name = "ORDER_SHOPORDERDATE")
	private Date order_shopOrderDate;

	@Column(name = "ORDER_PRODUCTTOTALPRICE")
	private int order_productToTalPrice;
	
	@JsonBackReference(value = "member")
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "memberid")
	private Member member;
	
	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "fk_cartid")
	private List<ShopCartOrderItem> shopCartOrderItem = new ArrayList<ShopCartOrderItem>();

	public int getOrder_shopCartId() {
		return order_shopCartId;
	}

	public void setOrder_shopCartId(int order_shopCartId) {
		this.order_shopCartId = order_shopCartId;
	}

	public Date getOrder_shopOrderDate() {
		return order_shopOrderDate;
	}

	public void setOrder_shopOrderDate(Date order_shopOrderDate) {
		this.order_shopOrderDate = order_shopOrderDate;
	}

	public int getOrder_productToTalPrice() {
		return order_productToTalPrice;
	}

	public void setOrder_productToTalPrice(int order_productToTalPrice) {
		this.order_productToTalPrice = order_productToTalPrice;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public List<ShopCartOrderItem> getShopCartOrderItem() {
		return shopCartOrderItem;
	}

	public void setShopCartOrderItem(List<ShopCartOrderItem> shopCartOrderItem) {
		this.shopCartOrderItem = shopCartOrderItem;
	}


	
}
