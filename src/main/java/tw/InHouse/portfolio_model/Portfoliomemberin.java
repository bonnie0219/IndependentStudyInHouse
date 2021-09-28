package tw.InHouse.portfolio_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table(name = "member_portfolio_in")
@Component
public class Portfoliomemberin {
	//在作品集下方留言
	@Id
	@Column(name = "idpm")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idpm;
	@Column(name = "portfolio_id", columnDefinition = "nvarchar(MAX)")
	private Integer portfolio_id;
	@Column(name = "member_name", columnDefinition = "nvarchar(MAX)")
	private String member_name;
	@Column(name = "member_photo", columnDefinition = "nvarchar(MAX)")
	private String member_photo;
	@Column(name = "portfolio_intime", columnDefinition = "nvarchar(MAX)")
	private String portfolio_intime;
	@Column(name = "portfolio_in", columnDefinition = "nvarchar(MAX)")
	private String portfolio_in;
	@Column(name = "portfoliomember_like", columnDefinition = "integer")
	private Integer portfoliomember_like;
	public Portfoliomemberin() {
			super();
			}
	public Portfoliomemberin(
			 Integer idpm
			,Integer portfolio_id
			,String member_name
			,String member_photo
			,String portfolio_intime
			,String portfolio_in
			,Integer portfoliomember_like
			) {
				this.idpm=idpm;
				this.portfolio_id=portfolio_id;
				this.portfoliomember_like=portfoliomember_like;
				this.member_name=member_name;
				this.member_photo=member_photo;
				this.portfolio_intime=portfolio_intime;
				this.portfolio_in=portfolio_in;
				
			}
	public Integer getIdpm() {
		return idpm;
	}
	public void setIdam(Integer idpm) {
		this.idpm = idpm;
	}
	public Integer getPortfolio_id() {
		return portfolio_id;
	}
	public void setPortfolio_id(Integer portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public String getPortfolio_intime() {
		return portfolio_intime;
	}
	public void setPortfolio_intime(String portfolio_intime) {
		this.portfolio_intime = portfolio_intime;
	}
	public String getPortfolio_in() {
		return portfolio_in;
	}
	public void setPortfolio_in(String portfolio_in) {
		this.portfolio_in = portfolio_in;
	}
	public Integer getPortfoliomember_like() {
		return portfoliomember_like;
	}
	public void setPortfoliomember_like(Integer portfoliomember_like) {
		this.portfoliomember_like = portfoliomember_like;
	}
	
}
