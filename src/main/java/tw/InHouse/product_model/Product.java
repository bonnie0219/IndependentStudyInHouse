package tw.InHouse.product_model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "product")
@Component
public class Product {
 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private int product_id;
	
	@Column(name = "product_name", columnDefinition = "nvarchar(MAX)")
	private String product_name;
	
	@Column(name = "product_type", columnDefinition = "nvarchar(MAX)")
	private String product_type;
	
	@Column(name = "product_color", columnDefinition = "nvarchar(MAX)")
	private String product_color;
	
	@Column(name = "product_price")
	private int product_price;
	
	@Column(name = "product_size", columnDefinition = "nvarchar(MAX)")
	private String product_size;
	
	@Column(name = "product_quantity")
	private int product_quantity;
	
	@Column(name = "product_picture", columnDefinition = "nvarchar(MAX)")
	private String product_picture;
	
	@Column(name = "product_descrip", columnDefinition = "nvarchar(MAX)")
	private String product_descrip;
//    private String product_startTime;
	
	@Column(name = "product_updatetime")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date product_updatetime;

	@Column(name = "product_like")
	private int product_like;
	
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_type() {
		return product_type;
	}

	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}

	public String getProduct_color() {
		return product_color;
	}

	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_size() {
		return product_size;
	}

	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}

	public int getProduct_quantity() {
		return product_quantity;
	}

	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}

	public String getProduct_picture() {
		return product_picture;
	}

	public void setProduct_picture(String product_picture) {
		this.product_picture = product_picture;
	}

	public String getProduct_descrip() {
		return product_descrip;
	}

	public void setProduct_descrip(String product_descrip) {
		this.product_descrip = product_descrip;
	}

	public Date getProduct_updatetime() {
		return product_updatetime;
	}

	public void setProduct_updatetime(Date product_updatetime) {
		this.product_updatetime = product_updatetime;
	}

	public int getProduct_like() {
		return product_like;
	}

	public void setProduct_like(int product_like) {
		this.product_like = product_like;
	}
}
