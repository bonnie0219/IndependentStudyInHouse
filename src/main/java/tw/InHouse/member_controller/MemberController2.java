package tw.InHouse.member_controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberService;

@Controller
@RequestMapping(path="/inhouse/member")
public class MemberController2 {
	   @Autowired
       private MemberService memberService;
	   
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
	   
	   
	   public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/member";
	   
}