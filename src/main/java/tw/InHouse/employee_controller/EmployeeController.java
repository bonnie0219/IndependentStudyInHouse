package tw.InHouse.employee_controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.InHouse.employee_model.Employee;
import tw.InHouse.employee_model.EmployeeService;
import tw.InHouse.login.dao.EmployeeDao;

@Controller
@RequestMapping(path="/backend/employee")
@SessionAttributes(names = {"totalPages","totalElements"})
public class EmployeeController {
	   @Autowired
       private EmployeeService employeeService;
	   
	   @Autowired
       private EmployeeDao employeeDao;
	   
       @GetMapping(path="/employeeaddAction.controller")
       public String processAddAction() {
    	   return "employee/employeeAdd";
	   }

       @GetMapping(path="/employeequeryAction.controller")
       public String processQueryAction() {
    	   return "employee/AllEmployee";
       }
	   
	   @PostMapping(path="/query/{employee_id}")
	   @ResponseBody
	   public Employee processActionQuery(@PathVariable(name ="employee_id") int employee_id) {
		   return employeeService.findByMember_id(employee_id);
	   }
	   

	   @PostMapping(path="/add")
	   @ResponseBody
	   public Employee processActionAdd(String employee_name,String employee_password,String employee_gender,String employee_phone,String employee_email,String employee_address,String employee_onboarddate,String employee_birthday,String employee_status,String employee_photo,MultipartFile file)throws Exception {
		   BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		   Employee employee=new Employee();
		   employee.setEmployee_name(employee_name);
		   employee.setEmployee_password(encoder.encode(employee_password));
		   employee.setEmployee_gender(employee_gender);
		   employee.setEmployee_phone(employee_phone);
		   employee.setEmployee_email(employee_email);
		   employee.setEmployee_address(employee_address);
		   employee.setEmployee_onboarddate(employee_onboarddate);
		   employee.setEmployee_birthday(employee_birthday);
		   employee.setEmployee_status(employee_status);
     	   employee.setEmployee_photo(employee_photo);
		   
		   System.out.println(employee);
		   if(!file.isEmpty()) {
		   String fileName = file.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   employee.setEmployee_photo("/"+"employee"+"/"+fileName);
		   }
		   return employeeService.insertEmployee(employee);
	   }
	   
	   @PostMapping(path="/update")
	   @ResponseBody
	   public Employee processActionUpdate(String employee_id_edit,String employee_name_edit,String employee_password_edit,String employee_gender_edit,String employee_phone_edit,String employee_email_edit,String employee_address_edit,String employee_onboarddate_edit,String employee_birthday_edit,String employee_status_edit,String employee_photo_edit,MultipartFile file_edit) throws Exception{
		   Employee employee=new Employee();
		   employee.setEmployee_id(Integer.parseInt(employee_id_edit));
		   employee.setEmployee_name(employee_name_edit);
		   employee.setEmployee_password(employee_password_edit);
		   employee.setEmployee_gender(employee_gender_edit);
		   employee.setEmployee_phone(employee_phone_edit);
		   employee.setEmployee_email(employee_email_edit);
		   employee.setEmployee_address(employee_address_edit);
		   employee.setEmployee_onboarddate(employee_onboarddate_edit);
		   employee.setEmployee_birthday(employee_birthday_edit);
		   employee.setEmployee_status(employee_status_edit);
		   System.out.println("~~~~~~~~~~~~~~"+employee_status_edit);
		   if(employee_status_edit.equals("deactivated")) {
			   int num1 = employeeDao.deleteRolebyEmployee_id(Integer.parseInt(employee_id_edit));
			   System.out.println("~~~~~~~~~~~~~~"+"刪除dao");
           }else if(employee_status_edit.equals("user")) {
        	   int num1 = employeeDao.deleteRolebyEmployee_id(Integer.parseInt(employee_id_edit));
        	   int num2 = employeeDao.addUserbyEmployee_id(Integer.parseInt(employee_id_edit));
        	   System.out.println("~~~~~~~~~~~~~~"+"使用者dao"+num2);
           }else if(employee_status_edit.equals("boss")) {
        	   int num1 = employeeDao.deleteRolebyEmployee_id(Integer.parseInt(employee_id_edit));
        	   int num3 = employeeDao.addBossbyEmployee_id(Integer.parseInt(employee_id_edit));
        	   System.out.println("~~~~~~~~~~~~~~"+"使用者dao"+num3);
           }
		   employee.setEmployee_photo(employee_photo_edit);
           
		   
		   System.out.println(employee);
		   if(!file_edit.isEmpty()) {
		   String fileName = file_edit.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file_edit.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   employee.setEmployee_photo("/"+"employee"+"/"+fileName);
		   }
		   
		   return employeeService.updateEmployee(employee);
		   
	   }
	   
	   @PostMapping(path="/delete/{employee_id}")
	   @ResponseBody                  
	   public void processActionDelete(@PathVariable(name ="employee_id") int employee_id){
		   employeeService.deleteByEmployee_id(employee_id);
	   }
	   
	   @PostMapping(path="/queryAll")
	   @ResponseBody
	   public List<Employee> processActionQueryAll(){
		   return employeeService.findAll();
	   }
	   
	   @PostMapping(path="/queryAllByPage/{pageNo}")
	   @ResponseBody
	   public List<Employee> processActionByPage(@PathVariable(name ="pageNo")int pageNo,Model m){
		   int pageSize=7;
		   Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		   Page<Employee> page = employeeService.findAllByPage(pageable);
		   m.addAttribute("totalPages",page.getTotalPages());
		   m.addAttribute("totalElements",page.getTotalElements());
		   return page.getContent();
	   }
	   
	   public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/employee";
	   
}
