package tw.InHouse.login.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.InHouse.employee_model.Employee;
import tw.InHouse.employee_model.EmployeeBackendRole;

@Repository
@Transactional
public class EmployeeDao {

    @Autowired
    private EntityManager entityManager;
 
    public Employee findUserAccount(String employee_name) {
        try {
            String sql = "Select e from " + Employee.class.getName() + " e " //
                    + " Where e.employee_name = :employee_name ";
 
            Query query = entityManager.createQuery(sql, Employee.class);
            query.setParameter("employee_name", employee_name);
 
            return (Employee) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public int deleteRolebyEmployee_id(int employee_id) {
        try {
            String sql = "Delete from EmployeeBackendRole e" 
                     + " where e.employee.employee_id = :employee_id";
            
 
            Query query = entityManager.createQuery(sql);
            int deletecount = query.setParameter("employee_id", employee_id).executeUpdate();
 
            return deletecount;
        } catch (NoResultException e) {
            return (Integer) null;
        }
    }

	public int addUserbyEmployee_id(int employee_id) {
		try {
            String sql = "Insert into EmployeeBackendRole " 
                     + " values (2,:employee_id )";
            
 
            Query query = entityManager.createNativeQuery(sql);
            int addcount = query.setParameter("employee_id", employee_id).executeUpdate();
 
            return addcount;
        } catch (NoResultException e) {
            return (Integer) null;
        }
	}

	public int addBossbyEmployee_id(int employee_id) {
		try {
            String sql = "Insert into EmployeeBackendRole " 
                     + " values (1,:employee_id ) ";
            
 
            Query query = entityManager.createNativeQuery(sql);
            int addcount = query.setParameter("employee_id", employee_id).executeUpdate();
 
            return addcount;
        } catch (NoResultException e) {
            return (Integer) null;
        }
	}
}
