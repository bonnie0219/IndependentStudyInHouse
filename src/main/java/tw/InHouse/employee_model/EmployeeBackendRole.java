package tw.InHouse.employee_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "employeebackendrole",
  uniqueConstraints = {@UniqueConstraint(name = "employeebackendrole_UK", columnNames = { "employee_id", "role_id" }) })
//       uniqueConstraints = {@UniqueConstraint(name = "employeebackendrole_UK", columnNames = "employee_id") })
public class EmployeeBackendRole {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)   
	private int id;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id", nullable = false)
	private Employee employee;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "role_id", nullable = false)  
	private BackendRole backendrole;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public BackendRole getBackendrole() {
		return backendrole;
	}
	public void setBackendrole(BackendRole backendrole) {
		this.backendrole = backendrole;
	}
	
	

          




}
