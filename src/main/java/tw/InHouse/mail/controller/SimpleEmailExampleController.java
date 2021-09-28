package tw.InHouse.mail.controller;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.InHouse.login.dao.MemberDao;
import tw.InHouse.mail.MyConstants;
import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberService;
 
@Controller
public class SimpleEmailExampleController {
 
    @Autowired
    public JavaMailSender emailSender;
 
    @Autowired
    private MemberService memberService;
    
    @Autowired 
    private MemberDao memberdao;
    
    @ResponseBody
    @RequestMapping("/inhouse/forgetpassword")
    public String sendSimpleEmail(String member_email_forget) {
    
        SimpleMailMessage message = new SimpleMailMessage();
        String member_email =member_email_forget.trim();
        System.out.println("接收人:"+member_email);
        Member member = memberdao.findByMember_email(member_email);
        String randomPassword = String.valueOf((int)(Math.random()*10)+(int)(Math.random()*10)*10+(int)(Math.random()*10)*100+(int)(Math.random()*10)*1000);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        member.setMember_password(encoder.encode(randomPassword));
        memberService.updateMember(member);
        //接收人        
        message.setTo(member.getMember_email());
        System.out.println("接收人信箱:"+member.getMember_email());
        //主旨
        message.setSubject("InHouse  "+member.getMember_name()+" 重設密碼");
        System.out.println("randomPassword:"+randomPassword);
        //內文
        message.setText("帳號:"+member.getMember_name()+"先生/女士,你好,新密碼為:"+randomPassword);
 
        // Send Message!
        this.emailSender.send(message);
 
        return "Email Sent!";
    }
    
   
    @RequestMapping("/inhouse/successEmail")
    public String sendHtmlEmail() throws MessagingException {
 
        MimeMessage message = emailSender.createMimeMessage();
 
        boolean multipart = true;
         
        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");
         
        String htmlMsg = "<h3 style='color:black;'>Thank you for your reservation !</h3>"
        		+"<h3 style='color:red;' >You can check out your reservation here:<a href='http://localhost:8080/inhouse/ProfilesReserve'> click me!</a></h3>"
        		+"<h3 style='color:black;' >And here's our special article</h3>"
        		+"<h3 style='color:black;'>It can help you refer to your decoration...</h3>"
                +"<a href='http://localhost:8080/inhouse/article/articleView/getalla2'> <img src='https://cdn.discordapp.com/attachments/713702092476383245/881450184733773824/unknown.png'></a>";
         
        message.setContent(htmlMsg, "text/html");
        
        helper.setTo(MyConstants.FRIEND_EMAIL3);
         
        helper.setSubject("InHouse 預約成功");
         
     
        this.emailSender.send(message);
 
        return "reserve/ReservePage";
    }
    

}