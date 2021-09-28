package tw.InHouse.employee_model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
public class EmployeeService {
	@Autowired
    private EmployeeRepository employeeRepository;
    

	
	public Employee findByMember_id(int employee_id) {
	    Optional<Employee> optional = employeeRepository.findById(employee_id);
	    if(optional.isPresent()) {
	    	return optional.get();
	    }
	    return null;
	}
	
    public List<Employee> findAll() {
    	return employeeRepository.findAll();
    
	} 
    
    public Page<Employee> findAllByPage(Pageable pageable){
    	return employeeRepository.findAll(pageable);
    }
    
    public Employee insertEmployee(Employee employee) {
    	return employeeRepository.save(employee);
    }
    
    public Employee updateEmployee(Employee employee) {
    	return employeeRepository.save(employee);
    }
    
    public void deleteByEmployee_id(int employee_id) {
    	employeeRepository.deleteById(employee_id);
    }

}
