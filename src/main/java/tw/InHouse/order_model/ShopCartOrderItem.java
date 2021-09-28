package tw.InHouse.order_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity@Component
@Table(name = "shopcartorderitem")
public class ShopCartOrderItem {
	@Id@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ORDERDETAIL_ID")
	private int OrderDetail_id;

	@Column(name = "ORDERDETAIL_PRODUCTNAME")
	private String orderItem_productName;

	@Column(name = "ORDERDETAIL_PRODUCTPRICE")
	private int orderItem_productPrice;

	@Column(name = "ORDERDETAIL_PRODUCTCOUNT")
	private int orderItem_productCount;	
	

	public ShopCartOrderItem() {
	}
	

	public ShopCartOrderItem(String orderItem_productName, int orderItem_productPrice,
			int orderItem_productCount) {
		this.orderItem_productName = orderItem_productName;
		this.orderItem_productPrice = orderItem_productPrice;
		this.orderItem_productCount = orderItem_productCount;
	}


	public int getOrderDetail_id() {
		return OrderDetail_id;
	}

	public void setOrderDetail_id(int orderDetail_id) {
		OrderDetail_id = orderDetail_id;
	}

	public String getOrderItem_productName() {
		return orderItem_productName;
	}

	public void setOrderItem_productName(String orderItem_productName) {
		this.orderItem_productName = orderItem_productName;
	}

	public int getOrderItem_productPrice() {
		return orderItem_productPrice;
	}

	public void setOrderItem_productPrice(int orderItem_productPrice) {
		this.orderItem_productPrice = orderItem_productPrice;
	}

	public int getOrderItem_productCount() {
		return orderItem_productCount;
	}

	public void setOrderItem_productCount(int orderItem_productCount) {
		this.orderItem_productCount = orderItem_productCount;
	}
	
	
}
