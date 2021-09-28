package tw.InHouse.login.controller;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import tw.InHouse.employee_model.Employee;
import tw.InHouse.login.dao.EmployeeDao;
import tw.InHouse.login.dao.MemberDao;
import tw.InHouse.login.utils.WebUtils;
import tw.InHouse.member_model.Member;



 
@Controller
public class LoginController {
    
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EmployeeDao employeeDao;
 
    @RequestMapping(value = "/backend/login", method = RequestMethod.GET)
    public String loginBackend(Model model) {
    	   
    	
        return "/login/login_backend";
    }
    
    // 後端登入動畫版controller
    @RequestMapping(value = "/backend/login2", method = RequestMethod.GET)
    public String loginBackend2(Model model) {
        return "/login/login_backend2";
    }
    
    @RequestMapping(value = "/backend/home", method = RequestMethod.GET)
    public String accessBackend(Model model,Principal principal,HttpServletRequest request,HttpServletResponse response) {
    	//model.addAttribute("title", "Welcome");
    	//model.addAttribute("member", "先生/女士,登入成功");
    	Employee employee =new Employee();
    	User loginedUser = (User) ((Authentication) principal).getPrincipal();
    	employee = employeeDao.findUserAccount(loginedUser.getUsername());
    	request.getSession().setAttribute("employee",employee);
    	return "/backend/BackendHomepage";
    }
    
    @RequestMapping(value = "/backend/logoutBackendSuccessful", method = RequestMethod.GET)
    public String logoutBackendSuccess(Model model) {
    	model.addAttribute("title", "Logout");
    	return "/login/login_backend";
    }
    
    @RequestMapping(value = "/inhouse/login", method = RequestMethod.GET)
    public String loginInHouse(Model model) {
      
    	
        return "/login/login_inhouse";
    }
    
    @Bean
   	private RestTemplate restTemplate(RestTemplateBuilder builder) {
   		return builder.build();
   	}
    
    @Autowired
	private RestTemplate restTemplate;
	
	@Value("$recaptcha.secret")
	private String recaptchaSecret;
	
	@Value("$recaptcha.url")
	private String recaptchaServeURL;
    
    
    @RequestMapping(value = "/inhouse/home", method = RequestMethod.GET)
    public String accessInHouse(Model model, Principal principal,HttpServletRequest request,HttpServletResponse response) throws IOException {
    	//model.addAttribute("title", "Welcome");
    	//model.addAttribute("member", "先生/女士,登入成功");
    	Member member = new Member();
    	User loginedUser = (User) ((Authentication) principal).getPrincipal();
    	member = memberDao.findUserAccount(loginedUser.getUsername());
    	request.getSession().setAttribute("member",member);
    	
    	
      File file = null;
      boolean bool = false;
      int count;
  	  try {
      //讀txt檔
  	  file = new File("D://count.txt");
  	  bool=file.createNewFile();
  	  if(bool) {
  		BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D://count.txt"),"UTF-8"));
        count=0;
  		out.write(String.valueOf(count));
        out.flush();
        out.close();  
  	  }
      BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
      //讀數據
      String str = null;
      StringBuffer content = new StringBuffer();
      while ((str = in.readLine()) != null) {
          content.append(str);
      }

      in.close();
      
      count = Integer.valueOf(content.toString());
      count ++; //+1
      //寫入文件
      BufferedWriter out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("D://count.txt"),"UTF-8"));
      out.write(String.valueOf(count));

      out.flush();
     
      out.close();

      
      request.getSession().setAttribute("count",count);
      System.out.println("總登入次數:"+count);
      
  }
  catch (Exception e){
      e.printStackTrace();
    
  }
    	
    	
    	//String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
    	//verifyReCAPTCHA(gRecaptchaResponse);
    	//if(!verifyReCAPTCHA(gRecaptchaResponse)) {
    	//	response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    	//}
    	//System.out.println("123:"+gRecaptchaResponse);
    	
    	return "/homepage/Homepage";
    }
    
    private void verifyReCAPTCHA(String gRecaptchaResponse) {
  		HttpHeaders headers = new HttpHeaders();
  		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
  		MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
  		map.add("secret", recaptchaSecret);
  		map.add("response", gRecaptchaResponse);

  		HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
  		
          ResponseEntity<String> response = restTemplate.postForEntity(recaptchaServeURL, request, String.class);
          //ReCaptchaResponse response = restTemplate.postForObject("https://www.google.com/recaptcha/api/siteverify", request, ReCaptchaResponse.class);
  	      System.out.println(response);
          //System.out.println("Success: "+ response.isSuccess());
          //System.out.println("Hostname: "+ response.getHostname());
          //System.out.println("Challenge Timestamp: "+ response.getChallenge_ts());

          //if(response.getErrorCodes() != null) {
          //	for(String error : response.getErrorCodes()) {
          //		System.out.println("\t"+ error);
          //	}
          //}
          
          //return response.isSuccess();
          //return true;
         
      }
    
    @RequestMapping(value = "/inhouse/logoutInHouseSuccessful", method = RequestMethod.GET)
    public String logoutInHouseSuccess(Model model) {
    	model.addAttribute("title", "Logout");
    	return "/login/login_inhouse";
    }
    

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {
 
        if (principal != null) {
            User loginedUser = (User) ((Authentication) principal).getPrincipal();
 
            String userInfo = WebUtils.toString(loginedUser);
 
            model.addAttribute("userInfo", userInfo);
 
            String message = "Hi " + principal.getName() //
                    + "<br> 權限不足,無法訪問";
            model.addAttribute("message", message);
        }
        return "/backend/403Page";
    }
    
    //線上客服
    @GetMapping(path = "backend/message")
	public String processBackendMessage() {
		return "backend/Backend_message";
	}	
 
}