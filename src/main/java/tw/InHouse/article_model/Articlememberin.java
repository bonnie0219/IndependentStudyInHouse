package tw.InHouse.article_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity 
@Table(name = "member_article_in")
@Component
public class Articlememberin {

	@Id
	@Column(name = "idam")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idam;
	@Column(name = "article_id", columnDefinition = "nvarchar(MAX)")
	private Integer article_id;
	@Column(name = "member_name", columnDefinition = "nvarchar(MAX)")
	private String member_name;
	@Column(name = "member_photo", columnDefinition = "nvarchar(MAX)")
	private String member_photo;
	@Column(name = "article_intime", columnDefinition = "nvarchar(MAX)")
	private String article_intime;
	@Column(name = "article_in", columnDefinition = "nvarchar(MAX)")
	private String article_in;
	@Column(name = "articlemember_like", columnDefinition = "integer")
	private Integer articlemember_like;
	public Articlememberin() {
			super();
			}
	
	public Articlememberin(
			 Integer idam
			,Integer article_id
			,String member_name
			,String member_photo
			,String article_intime
			,String article_in
			,Integer articlemember_like
			) {
				this.idam=idam;
				this.article_id=article_id;
				this.articlemember_like=articlemember_like;
				this.member_name=member_name;
				this.member_photo=member_photo;
				this.article_intime=article_intime;
				this.article_in=article_in;
				
			}
	public Integer getIdam() {
		return idam;
	}
	public void setIdam(Integer idam) {
		this.idam = idam;
	}
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
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
	public String getArticle_intime() {
		return article_intime;
	}
	public void setArticle_intime(String article_intime) {
		this.article_intime = article_intime;
	}
	public String getArticle_in() {
		return article_in;
	}
	public void setArticle_in(String article_in) {
		this.article_in = article_in;
	}
	public Integer getArticlemember_like() {
		return articlemember_like;
	}
	public void setArticlemember_like(Integer articlemember_like) {
		this.articlemember_like = articlemember_like;
	}
}
