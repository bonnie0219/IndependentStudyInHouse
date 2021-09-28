package tw.InHouse.product_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "PRODUCT_MEMBER")
@Component
public class ProductMember {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "keep_id")
	private int keep_id;
	
	@Column(name = "product_id")
	private int product_id;
	
	@Column(name = "member_name", columnDefinition = "nvarchar(MAX)")
	private int member_name;

	@Column(name = "product_name", columnDefinition = "nvarchar(MAX)")
	private String product_name;
	
	
	public int getKeep_id() {
		return keep_id;
	}

	public void setKeep_id(int keep_id) {
		this.keep_id = keep_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getMember_name() {
		return member_name;
	}

	public void setMember_name(int member_name) {
		this.member_name = member_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
		
}
