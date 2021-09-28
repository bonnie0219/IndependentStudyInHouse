package tw.InHouse.portfolio_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "member_portfolio")
@Component
public class Portfoliomemberlike {

	//帳號去對應喜歡的作品集
		@Id
		@Column(name = "like_id")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer like_id;
		@Column(name = "portfolio_id", columnDefinition = "nvarchar(MAX)")
		private Integer portfolio_id;
		@Column(name = "member_name", columnDefinition = "nvarchar(MAX)")
		private String member_name;
		public Integer getLike_id() {
			return like_id;
		}
		public void setLike_id(Integer like_id) {
			this.like_id = like_id;
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
		
}
