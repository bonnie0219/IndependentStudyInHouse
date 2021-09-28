package tw.InHouse.login.service;
 
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.InHouse.employee_model.Employee;
import tw.InHouse.login.dao.BackendRoleDao;
import tw.InHouse.login.dao.EmployeeDao;

 
@Service
public class OneUserDetailsServiceImpl implements UserDetailsService {
 
    @Autowired
    private EmployeeDao employeedao;
 
    @Autowired
    private BackendRoleDao backendroledao;
 
    @Override
    public UserDetails loadUserByUsername(String emoloyee_name) throws UsernameNotFoundException {
        Employee employee = this.employeedao.findUserAccount(emoloyee_name);
 
        if (employee == null) {
            System.out.println("User not found! " + emoloyee_name);
        }
 
        System.out.println("Found User: " + employee);
 
        // [ROLE_USER, ROLE_ADMIN,..]
        List<String> roleNames = this.backendroledao.getRoleNames(employee.getEmployee_id());
 
        List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
        if (roleNames != null) {
            for (String role : roleNames) {
                // ROLE_USER, ROLE_ADMIN,..
                GrantedAuthority authority = new SimpleGrantedAuthority(role);
                grantList.add(authority);
            }
        }
 
        UserDetails userDetails = (UserDetails) new User(employee.getEmployee_name(), //
        		employee.getEmployee_password(), grantList);
 
        return userDetails;
    }
 
}