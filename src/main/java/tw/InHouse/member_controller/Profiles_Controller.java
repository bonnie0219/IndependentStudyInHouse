package tw.InHouse.member_controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import tw.InHouse.coupon_model.Coupon;
import tw.InHouse.coupon_model.CouponService;
import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberService;
import tw.InHouse.order_model.ShopCart;
import tw.InHouse.order_model.ShopCartOrderItem;
import tw.InHouse.order_model.ShopCartOrderItemService;
import tw.InHouse.order_model.ShopCartService;
import tw.InHouse.reserve_model.Reserve;
import tw.InHouse.reserve_model.ReserveService;

@Controller
@RequestMapping(path = "/inhouse")
@SessionAttributes(value = "mid")
public class Profiles_Controller {
	

	
	@Autowired
	private ReserveService rService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponService cService;
	@Autowired
	private ShopCartService sCartService;
	@Autowired
	private ShopCartOrderItemService sCartOrderItemService;
	// reserve 簡單版畫面+套版
	@GetMapping(path = "/ProfilesReserve")
	public String MainPage() {
		return "homepage/Profiles_reserve";
	}

	// reserve 查詢會員id
	@PostMapping("/querybymember/{reserve_memberid}")
	@ResponseBody
	public List<Reserve> processQueryByMemberId(@PathVariable("reserve_memberid") int reserve_memberid) {
		System.out.println("-----------  query  -------------");
		System.out.println(reserve_memberid);

		return rService.findByMemberid(reserve_memberid);
	}
	
	// order
	@GetMapping(path = "/ProfilesOrder/{memberid}")
//	@ResponseBody
	public String MainPage3(@PathVariable("memberid") int mid, Model m) {
		System.out.println(mid);
		m.addAttribute("mid", mid);
		
		List<ShopCart> userOrder = sCartService.queryByUserOrderDetail(mid);
		m.addAttribute("userOrder", userOrder);
		return "homepage/Profiles_order";
//		return userOrder;
	}
	
	// order
	@PostMapping("/shopcartDetail")
	@ResponseBody
	public List<ShopCartOrderItem> processGetMemberOrderDetail(@ModelAttribute("mid") int mid, String shopcartid) {
		System.out.println("進來查詢");
		System.out.println(mid);
		
		List<ShopCartOrderItem> thisDetail = sCartOrderItemService.findByShopCartOrderItemDetail(Integer.parseInt(shopcartid));		
		return thisDetail;
	}
	

	
	@GetMapping(path = "/ProfilesMember")
	public String MainPage1() {
		return "homepage/Profiles_member";
	}
	
	// 查詢會員id
	@PostMapping("/querybymember4/{member_id}")
	@ResponseBody
	public List<Member> processQueryByMemberId1(@PathVariable("member_id") int member_id) {
		System.out.println("-----------  query  -------------");
		System.out.println(member_id);
		 Member member1=memberService.findByMember_id(member_id);
			List<Member> member = new ArrayList<>();
	        member.add(member1);
			return member;
		//return memberService.findByMember_id(member_id);
		//return null;
	}
	
    // 修改會員id
	@PostMapping("/processUpdate")
	@ResponseBody
	public Member processUpdate(String member_id_edit,String member_name_edit,String member_password_edit,String member_gender_edit,String member_email_edit,String member_phone_edit,String member_address_edit,String member_birthday_edit,String member_photo_edit,MultipartFile file_edit,Model model,HttpServletRequest request) throws Exception {
		System.out.println("-----------  update  -------------");
		System.out.println(member_id_edit);
		System.out.println(member_name_edit);
		System.out.println(member_password_edit);
	    Member member=new Member();
        member.setMember_id(Integer.parseInt(member_id_edit));
	    member.setMember_name(member_name_edit);
	    
	    Member member2 =new Member();
	    //找尋這組id的加密密碼 ,比對編輯取得的密碼 是否一樣
	    member2=memberService.findByMember_id(Integer.parseInt(member_id_edit));
	    System.out.println("member2密碼:"+member2.getMember_password());
	    member.setMember_password(member_password_edit);
	    System.out.println("member2密碼:"+member2.getMember_password());
	    System.out.println("member密碼:"+member_password_edit);
	    if(!member2.getMember_password().equals(member_password_edit)) {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    	member.setMember_password(encoder.encode(member_password_edit));
	    	System.out.println("==========");
	    }
	    
        member.setMember_gender(member_gender_edit);
        member.setMember_email(member_email_edit);
        member.setMember_phone(member_phone_edit);
        member.setMember_address(member_address_edit);
        member.setMember_birthday(member_birthday_edit);
        member.setMember_photo(member2.getMember_photo());
        System.out.println("member_photo_edit:"+member_photo_edit);
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
	   
	    request.getSession().setAttribute("member",member);
	   return memberService.updateMember(member);
	   
   }
	
	 // coupon 簡單版畫面+套版
    @GetMapping(path = "/ProfilesCoupon")
    public String MainPage2() {
     return "homepage/Profiles_coupon";
    }
    
    @PostMapping(path="/all/{coupon_memberid}")
    @ResponseBody
    public List<Coupon> processFindAllbyMember(@PathVariable("coupon_memberid") int coupon_memberid) {
     System.out.println("-----------  query  -------------");
     System.out.println(coupon_memberid);

     return cService.findAllBymember(coupon_memberid);
    }
    
    //線上客服
    @GetMapping(path = "/message")
	public String processInhouseMessage() {
		return "homepage/Profiles_message";
	}
    
    public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/member";
}
