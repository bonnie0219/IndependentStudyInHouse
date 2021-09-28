package tw.InHouse.article_model;

import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.InHouse.member_model.Member;



@Entity
@Table(name = "article")
@Component
public class Article {
	
	@Id
	@Column(name = "article_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	@OneToMany
	private Integer article_id;
	@Column(name = "article_title", columnDefinition = "nvarchar(MAX)")
	private String article_title;
	@Column(name = "article_image", columnDefinition = "nvarchar(MAX)")
	private String article_image;
	@Column(name = "article_type", columnDefinition = "nvarchar(MAX)")
	private String article_type;
	@Column(name = "article", columnDefinition = "nvarchar(MAX)")
//	@Column(name = "article", columnDefinition = "text")
	private String article;
//	@JsonFormat(pattern="yyyy-mm-dd",timezone="GMT+8")
	private String article_time; 
	    	
	private Integer article_like;
	
//@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//    @JoinTable(name = "member_article",  
//        joinColumns = {         // 在Join Table中，儲存本類別之主鍵值的外鍵欄位名稱
//            @JoinColumn(name = "article_id", referencedColumnName = "article_id")
//        },  
//        inverseJoinColumns = { // 在Join Table中，儲存對應對照類別之主鍵值的外鍵欄位名稱
//    //    	@JoinColumn(name = "article_id", referencedColumnName = "article_id"),
//            @JoinColumn(name = "member_name",referencedColumnName = "member_name") 
//        }
//           
//    )
//	private Set<Member> member_article = new HashSet<Member>(0); 
//			
//	
//	public Set<Member> getMember_article() {
//		return member_article;
//	}
	
//-------------test add-like button----------------
    
    
	public Article(
	Integer article_id
	,String article_title
	,String article_image
	,String article_type
	,String article
	,String article_time
	,Integer article_like) {
		this.article_id=article_id;
		this.article_title=article_title;
		this.article_image=article_image;
		this.article_type=article_type;
		this.article=article;
		this.article_time=article_time;
		this.article_like=article_like;
		
	}
	
	public Article(){
		super();
	}
	
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_image() {
		return article_image;
	}
	public void setArticle_image(String article_image) {
		this.article_image = article_image;
	}
	public String getArticle_type() {
		return article_type;
	}
	public void setArticle_type(String article_type) {
		this.article_type = article_type;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getArticle_time() {
		return article_time;
	}
	public void setArticle_time(String article_time) {
		this.article_time = article_time;
	}
	public Integer getArticle_like() {
		return article_like;
	}
	public void setArticle_like(Integer article_like) {
		this.article_like = article_like;
	}
 
	

}
