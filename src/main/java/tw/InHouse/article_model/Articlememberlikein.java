package tw.InHouse.article_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "member_article_in_like")
@Component
public class Articlememberlikein {
	@Id
	@Column(name = "membermessagelike")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer membermessagelike;
	@Column(name = "idam", columnDefinition = "nvarchar(MAX)")
	private Integer idam;
	@Column(name = "article_id", columnDefinition = "nvarchar(MAX)")
	private Integer article_id;
	@Column(name = "member_name", columnDefinition = "nvarchar(MAX)")
	private String member_name;
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
	public Integer getMembermessagelike() {
		return membermessagelike;
	}
	public void setMembermessagelike(Integer membermessagelike) {
		this.membermessagelike = membermessagelike;
	}

	
}

