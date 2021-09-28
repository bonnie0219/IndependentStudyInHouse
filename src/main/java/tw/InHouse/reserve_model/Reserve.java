package tw.InHouse.reserve_model;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import tw.InHouse.member_model.Member;


@Entity 
@Table(name = "reserve")
@Component("reserve")
public class Reserve{
	
	//private static final Long serialVersionUID = 1L;
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int reserve_id;
//	private int reserve_memberid;  
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date reserve_Date;
	private String reserve_branch;
	private String reserve_style;
	private int  reserve_q1;
	private int  reserve_q2;
	private int  reserve_q3;
	private int  reserve_q4;
	private int  reserve_q5;
	
//	@JsonBackReference
//	@JsonIgnore
//	@ManyToOne(fetch = FetchType.LAZY) 
	
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="reserve_memberid") 
	private Member reserve_memberid;
	
	
	
	/*
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="reserve_membername")
	
	private Member reserve_membername;
	*/
	

	public Reserve() {
		
	}


	public int getReserve_id() {
		return reserve_id;
	}




	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}






	public Date getReserve_Date() {
		return reserve_Date;
	}




	public void setReserve_Date(Date reserve_Date) {
		this.reserve_Date = reserve_Date;
	}




	public String getReserve_branch() {
		return reserve_branch;
	}




	public void setReserve_branch(String reserve_branch) {
		this.reserve_branch = reserve_branch;
	}




	public String getReserve_style() {
		return reserve_style;
	}




	public void setReserve_style(String reserve_style) {
		this.reserve_style = reserve_style;
	}




	public int getReserve_q1() {
		return reserve_q1;
	}




	public void setReserve_q1(int reserve_q1) {
		this.reserve_q1 = reserve_q1;
	}




	public int getReserve_q2() {
		return reserve_q2;
	}




	public void setReserve_q2(int reserve_q2) {
		this.reserve_q2 = reserve_q2;
	}




	public int getReserve_q3() {
		return reserve_q3;
	}




	public void setReserve_q3(int reserve_q3) {
		this.reserve_q3 = reserve_q3;
	}




	public int getReserve_q4() {
		return reserve_q4;
	}




	public void setReserve_q4(int reserve_q4) {
		this.reserve_q4 = reserve_q4;
	}




	public int getReserve_q5() {
		return reserve_q5;
	}




	public void setReserve_q5(int reserve_q5) {
		this.reserve_q5 = reserve_q5;
	}

	
//	-------------------------------
	
	public Member getReserve_memberid() {
		return reserve_memberid;
	}


	public void setReserve_memberid(Member reserve_memberid) {
		this.reserve_memberid = reserve_memberid;
	}


	public Reserve(int reserve_id, Date reserve_Date, String reserve_branch, String reserve_style, int reserve_q1,
			int reserve_q2, int reserve_q3, int reserve_q4, int reserve_q5, Member reserve_memberid) {
		super();
		this.reserve_id = reserve_id;
		this.reserve_Date = reserve_Date;
		this.reserve_branch = reserve_branch;
		this.reserve_style = reserve_style;
		this.reserve_q1 = reserve_q1;
		this.reserve_q2 = reserve_q2;
		this.reserve_q3 = reserve_q3;
		this.reserve_q4 = reserve_q4;
		this.reserve_q5 = reserve_q5;
		this.reserve_memberid = reserve_memberid;
	}


}