package tw.InHouse.employee_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity 
@Table(name = "employee",
   uniqueConstraints = {@UniqueConstraint(name = "employee_UK", columnNames = "employee_name") })
public class Employee {
	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   @Column(name = "employee_id", nullable = false)
       private int employee_id;
	   @Column(name = "employee_name", nullable = false)
       private String employee_name;
       private String employee_password;
       private String employee_gender;
       private String employee_phone;
       private String employee_email;
       private String employee_address;
       private String employee_onboarddate;
       private String employee_birthday;
       private String employee_status;
       private String employee_photo;
     
       
       
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getEmployee_password() {
		return employee_password;
	}
	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}
	public String getEmployee_gender() {
		return employee_gender;
	}
	public void setEmployee_gender(String employee_gender) {
		this.employee_gender = employee_gender;
	}
	public String getEmployee_phone() {
		return employee_phone;
	}
	public void setEmployee_phone(String employee_phone) {
		this.employee_phone = employee_phone;
	}
	public String getEmployee_email() {
		return employee_email;
	}
	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}
	public String getEmployee_address() {
		return employee_address;
	}
	public void setEmployee_address(String employee_address) {
		this.employee_address = employee_address;
	}
	public String getEmployee_onboarddate() {
		return employee_onboarddate;
	}
	public void setEmployee_onboarddate(String employee_onboarddate) {
		this.employee_onboarddate = employee_onboarddate;
	}
	public String getEmployee_birthday() {
		return employee_birthday;
	}
	public void setEmployee_birthday(String employee_birthday) {
		this.employee_birthday = employee_birthday;
	}
	public String getEmployee_status() {
		return employee_status;
	}
	public void setEmployee_status(String employee_status) {
		this.employee_status = employee_status;
	}
	public String getEmployee_photo() {
		return employee_photo;
	}
	public void setEmployee_photo(String employee_photo) {
		this.employee_photo = employee_photo;
	}

       
       
}
