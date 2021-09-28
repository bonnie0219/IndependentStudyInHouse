package tw.InHouse.article_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "member_article")
@Component
public class Articlememberlike {

	@Id
	@Column(name = "like_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer like_id;
	@Column(name = "article_id", columnDefinition = "nvarchar(MAX)")
	private Integer article_id;
	@Column(name = "member_name", columnDefinition = "nvarchar(MAX)")
	private String member_name;
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
	public Articlememberlike(){
		super();
	}
	
	public Articlememberlike(
			//Integer like_id,
			Integer article_id
            ,String member_name) {
	     //    	this.like_id=like_id;
				this.article_id=article_id;
				this.member_name=member_name;
			}
}
