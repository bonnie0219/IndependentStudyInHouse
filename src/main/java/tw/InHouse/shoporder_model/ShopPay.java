package tw.InHouse.shoporder_model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.InHouse.order_model.ShopCart;

@Entity@Component
@Table(name = "shoppay")
public class ShopPay {
	
	@Id @Column(name = "SHOPPAY_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int shoppay_id;
	
	@Column(name = "SHOPPY_SHIPMENT")
	private String shoppay_shipment;
	
	@Column(name = "SHOPPAY_ADDRESS")
	private String shoppay_address;
	
	@Column(name = "SHOPPAY_NAME")
	private String shoppay_note;
	
	@Column(name = "SHOPPAY_PHONE")
	private String shoppay_paymethod;
	
	@Column(name = "SHOPPAY_CARD")
	private String shoppay_card;
	
	@Column(name = "SHOPPAY_CARDDATE")
	private String shoppay_cardDate;
	
	@Column(name = "SHOPPAY_CVV")
	private String shoppay_cvv;
		
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "shopcartmatchid")
	private ShopCart shopCart;

	public int getShoppay_id() {
		return shoppay_id;
	}

	public void setShoppay_id(int shoppay_id) {
		this.shoppay_id = shoppay_id;
	}

	public String getShoppay_shipment() {
		return shoppay_shipment;
	}

	public void setShoppay_shipment(String shoppay_shipment) {
		this.shoppay_shipment = shoppay_shipment;
	}

	public String getShoppay_address() {
		return shoppay_address;
	}

	public void setShoppay_address(String shoppay_address) {
		this.shoppay_address = shoppay_address;
	}

	public String getShoppay_note() {
		return shoppay_note;
	}

	public void setShoppay_note(String shoppay_note) {
		this.shoppay_note = shoppay_note;
	}

	public String getShoppay_paymethod() {
		return shoppay_paymethod;
	}

	public void setShoppay_paymethod(String shoppay_paymethod) {
		this.shoppay_paymethod = shoppay_paymethod;
	}

	public String getShoppay_card() {
		return shoppay_card;
	}

	public void setShoppay_card(String shoppay_card) {
		this.shoppay_card = shoppay_card;
	}

	public String getShoppay_cardDate() {
		return shoppay_cardDate;
	}

	public void setShoppay_cardDate(String shoppay_cardDate) {
		this.shoppay_cardDate = shoppay_cardDate;
	}

	public String getShoppay_cvv() {
		return shoppay_cvv;
	}

	public void setShoppay_cvv(String shoppay_cvv) {
		this.shoppay_cvv = shoppay_cvv;
	}

	public ShopCart getShopCart() {
		return shopCart;
	}

	public void setShopCart(ShopCart shopCart) {
		this.shopCart = shopCart;
	}

}
