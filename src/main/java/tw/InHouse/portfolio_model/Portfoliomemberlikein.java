package tw.InHouse.portfolio_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "member_portfolio_in_like")
@Component
public class Portfoliomemberlikein {

	//帳號對應留言喜歡紀錄
		@Id
		@Column(name = "membermessagelike")
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer membermessagelike;
		@Column(name = "idpm", columnDefinition = "nvarchar(MAX)")
		private Integer idpm;
		@Column(name = "portfolio_id", columnDefinition = "nvarchar(MAX)")
		private Integer portfolio_id;
		@Column(name = "member_name", columnDefinition = "nvarchar(MAX)")
		private String member_name;
		public Integer getMembermessagelike() {
			return membermessagelike;
		}
		public void setMembermessagelike(Integer membermessagelike) {
			this.membermessagelike = membermessagelike;
		}
		public Integer getIdpm() {
			return idpm;
		}
		public void setIdpm(Integer idpm) {
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
		
}
