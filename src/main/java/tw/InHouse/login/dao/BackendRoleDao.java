package tw.InHouse.login.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.InHouse.employee_model.EmployeeBackendRole;





@Repository
@Transactional
public class BackendRoleDao {

    @Autowired
    private EntityManager entityManager;
 
    @SuppressWarnings("unchecked")
	public List<String> getRoleNames(int employee_id) {
        String sql = "Select eb.backendrole.role_name from " + EmployeeBackendRole.class.getName() + " eb " //
                + " where eb.employee.employee_id = :employee_id ";
 
        Query query = this.entityManager.createQuery(sql, String.class);
        query.setParameter("employee_id", employee_id);
        return query.getResultList();
    }
}
