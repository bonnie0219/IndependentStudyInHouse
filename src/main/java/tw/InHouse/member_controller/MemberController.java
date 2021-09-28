package tw.InHouse.member_controller;

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

import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberService;

@Controller
@RequestMapping(path="/backend/member")
@SessionAttributes(names = {"totalPages","totalElements"})
public class MemberController {
	   @Autowired
       private MemberService memberService;
	   
       @GetMapping(path="/memberaddAction.controller")
       public String processAddAction() {
    	   return "member/memberAdd";
	   }

       @GetMapping(path="/memberqueryAction.controller")
       public String processQueryAction() {
    	   return "member/AllMember";
       }
	   
	   @PostMapping(path="/query/{member_id}")
	   @ResponseBody
	   public Member processActionQuery(@PathVariable(name ="member_id") int member_id) {
		   return memberService.findByMember_id(member_id);
	   }
	   
//	   @PostMapping(path="/add")
//	   @ResponseBody
//	   public Member processActionAdd(@RequestBody Member member) {
//		   return memberService.insertMember(member);
//	   }
	   @PostMapping(path="/add")
	   @ResponseBody
	   public Member processActionAdd(String  member_name,String member_password,String member_gender,String member_email,String member_phone,String member_address,String member_birthday,String member_photo,MultipartFile file)throws Exception {
		   BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		   Member member=new Member();
           member.setMember_name(member_name);
           member.setMember_password(encoder.encode(member_password));
           member.setMember_gender(member_gender);
           member.setMember_email(member_email);
           member.setMember_phone(member_phone);
           member.setMember_address(member_address);
           member.setMember_birthday(member_birthday);
           member.setMember_photo(member_photo);
		   System.out.println("~~~~~~~");
		   System.out.println(member);
		   if(!file.isEmpty()) {
		   String fileName = file.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   member.setMember_photo("/"+"member"+"/"+fileName);
		   }
		   return memberService.insertMember(member);
	   }
	   
	   @PostMapping(path="/update")
	   @ResponseBody
	   public Member processActionUpdate(String member_id_edit,String member_name_edit,String member_password_edit,String member_gender_edit,String member_email_edit,String member_phone_edit,String member_address_edit,String member_birthday_edit,String member_photo_edit,MultipartFile file_edit) throws Exception{
		   Member member=new Member();
		   
           member.setMember_id(Integer.parseInt(member_id_edit));
		   member.setMember_name(member_name_edit);
		   
		   Member member2 =new Member();
		    //找尋這組id的加密密碼 ,比對編輯取得的密碼 是否一樣
		    member2=memberService.findByMember_id(Integer.parseInt(member_id_edit));
		    member.setMember_password(member_password_edit);
		    if(!member2.getMember_password().equals(member_password_edit)) {
	            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		    	member.setMember_password(encoder.encode(member_password_edit));
		    }
		   
           member.setMember_gender(member_gender_edit);
           member.setMember_email(member_email_edit);
           member.setMember_phone(member_phone_edit);
           member.setMember_address(member_address_edit);
           member.setMember_birthday(member_birthday_edit);
           member.setMember_photo(member_photo_edit);
		   System.out.println("~~~~~~~");
		   System.out.println(member);
		   if(!file_edit.isEmpty()) {
		   String fileName = file_edit.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file_edit.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   member.setMember_photo("/"+"member"+"/"+fileName);
		   }
		   
		   return memberService.updateMember(member);
		   
	   }
	   
	   @PostMapping(path="/delete/{member_id}")
	   @ResponseBody                  
	   public void processActionDelete(@PathVariable(name ="member_id") int member_id){
		    memberService.deleteByMmeber_id(member_id);
	   }
	   
	   @PostMapping(path="/queryAll")
	   @ResponseBody
	   public List<Member> processActionQueryAll(){
		   return memberService.findAll();
	   }
	   
	   @PostMapping(path="/queryAllByPage/{pageNo}")
	   @ResponseBody
	   public List<Member> processActionByPage(@PathVariable(name ="pageNo")int pageNo,Model m){
		   int pageSize=7;
		   Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		   Page<Member> page = memberService.findAllByPage(pageable);
		   m.addAttribute("totalPages",page.getTotalPages());
		   m.addAttribute("totalElements",page.getTotalElements());
		   return page.getContent();
	   }
	   
	   public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/member";
	   
}
