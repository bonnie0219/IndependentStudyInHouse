package tw.InHouse.portfolio_model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.InHouse.designer_model.Designer;

@Entity
@Table(name = "portfolio")
@Component("portfolio")
public class Portfolio {


	@Id
	@Column(name = "portfolio_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer portfolio_id;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="designer_id",nullable =false)
 	private Designer designer_id;
	@Column(name = "portfolio_title", columnDefinition = "nvarchar(MAX)")
	private String portfolio_title;
	@Column(name = "portfolio_image", columnDefinition = "nvarchar(MAX)")
	private String portfolio_image;
	@Column(name = "portfolio", columnDefinition = "nvarchar(MAX)")
	private String portfolio;
	@Column(name = "portfolio_time", columnDefinition = "nvarchar(MAX)")
	private String portfolio_time; 
	@Column(name = "portfolio_like", columnDefinition = "integer")    	
	private Integer portfolio_like;
	
//-------------test add-like button----------------
    

	
	
	public Portfolio(){
		super();
	}

	public Portfolio(Integer portfolio_id, Designer designer_id, String portfolio_title, String portfolio_image,
			String portfolio, String portfolio_time, Integer portfolio_like) {
		super();
		this.portfolio_id = portfolio_id;
		this.designer_id = designer_id;
		this.portfolio_title = portfolio_title;
		this.portfolio_image = portfolio_image;
		this.portfolio = portfolio;
		this.portfolio_time = portfolio_time;
		this.portfolio_like = portfolio_like;
	}

	public void setPortfolio_id(Integer portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	
	public Integer getPortfolio_id() {
		return portfolio_id;
	}

	public String getPortfolio_title() {
		return portfolio_title;
	}

	public void setPortfolio_title(String portfolio_title) {
		this.portfolio_title = portfolio_title;
	}

	public String getPortfolio_image() {
		return portfolio_image;
	}

	public void setPortfolio_image(String portfolio_image) {
		this.portfolio_image = portfolio_image;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getPortfolio_time() {
		return portfolio_time;
	}

	public void setPortfolio_time(String portfolio_time) {
		this.portfolio_time = portfolio_time;
	}

	public Integer getPortfolio_like() {
		return portfolio_like;
	}

	public void setPortfolio_like(Integer portfolio_like) {
		this.portfolio_like = portfolio_like;
	}

	public Designer getDesigner_id() {
		return designer_id;
	}

	public void setDesigner_id(Designer designer_id) {
		this.designer_id = designer_id;
	}

	
	
	
}
