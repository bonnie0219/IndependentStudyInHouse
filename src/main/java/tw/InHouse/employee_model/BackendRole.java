package tw.InHouse.employee_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
   @Entity
   @Table(name = "backendrole",uniqueConstraints = {@UniqueConstraint(name = "backendrole_uk", columnNames = "role_name") })
public class BackendRole {
	@Id
    @GeneratedValue
    @Column(name="role_id",nullable = false)
    private int role_id;
	@Column(name="role_name", length = 30, nullable = false)
    private String role_name;
       
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
       
       
}
