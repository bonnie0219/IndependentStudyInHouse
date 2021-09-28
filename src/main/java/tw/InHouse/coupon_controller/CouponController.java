package tw.InHouse.coupon_controller;



import java.io.Console;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.apache.coyote.http11.Http11AprProtocol;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.web.jaasapi.JaasApiIntegrationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;



import tw.InHouse.coupon_model.Coupon;
import tw.InHouse.coupon_model.CouponService;
import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberRepository;
import tw.InHouse.member_model.MemberService;
import tw.InHouse.order_model.ShopCart;
import tw.InHouse.reserve_model.Reserve;




@Controller
@RequestMapping(path="/backend/coupon")
@SessionAttributes(names = {"totalPages","totalElements"})
public class CouponController {
	   @Autowired
       private CouponService couponService;
	   
	   @Autowired
       private MemberService memberService;
	   
	   @Autowired
	   private MemberRepository mmm;
	   
	   
//       @GetMapping(path="/couponaddAction.controller")
//       public String processAddAction() {
//    	   return "coupon/couponAdd";
//	   }

       @GetMapping(path="/couponqueryAction.controller")//進入點
       public String processQueryAction() {
    	   return "coupon/AllCoupon";
       }
       
       
       
       //
     
       
       
       //
       @GetMapping(path="/index")//進入點
       public String processIndex() {
    	   return "index";
       }
       
       //
       
//       @GetMapping(path="/couponManage")//進入點
//       public String processCouponManage() {
//    	   return "coupon/couponManage";
//       }
//       
//   	// 簡單版畫面+套版
//   	@GetMapping(path = "/CouponProfiles")
//   	public String MainPage() {
//   		return "homepage/CouponProfiles";
//   	}
       
//   	// coupon 簡單版畫面+套版
//  	@GetMapping(path = "/ProfilesCoupon")
//  	public String MainPage2() {
//  		return "homepage/Profiles_coupon";
//  	}
//       
       
       //
       
//       @GetMapping(path="/font1")//進入點
//       public String processFont1() {
//    	   return "/coupon/font1";
//       }
//       
//       @GetMapping(path="/font2")//進入點
//       public String processFont2() {
//    	   return "/coupon/font2";
//       }
//       
//       @GetMapping(path="/front3")//進入點
//       public String processFront4() {
//    	   return "/coupon/front3";
//       }
//       
//       @GetMapping(path="/front4")//進入點
//       public String processFront5() {
//    	   return "/coupon/front4";
//       }
//       
//       @GetMapping(path="/frontNews")//進入點
//       public String processFont3() {
//    	   return "/coupon/frontNews";
//       }
       
       //
       @PostMapping(path="/all")
       @ResponseBody
       public List<Coupon> processFindAll(){
    	   System.out.println("456789");
    	   return couponService.findAll();
       }
       
       


       
    	
    // 查詢會員id
//   	@PostMapping(path="/all/{coupon_memberid}")
//   	@ResponseBody
//    public List<Coupon> processFindAllbyMember(@PathVariable("coupon_memberid") int coupon_memberid) {
//   		System.out.println("-----------  query  -------------");
//   		System.out.println(coupon_memberid);
//
//   		return couponService.findAllBymember(coupon_memberid);
//   	}
//       
//     
      
   //    List<Coupon> findBymember(int member_id){
    	       	      	   
       
       @PostMapping(path="/member")
	    @ResponseBody
	    public List<Coupon> findBymember(){
			return couponService.findAllBymember(2);   //service方法相較repository方法是自己定義的   	   
	    }
       
       
       
       
       @PostMapping(path="/member2")
	    @ResponseBody
	    public List<Coupon> findBymember2(){
			return couponService.findAllBymember(2);   //service方法相較repository方法是自己定義的   	   
	    }
       
//       失敗
//    	    @PostMapping(path="/member")
//    	    @ResponseBody
//    	    public List<Coupon> findBymember(@RequestParam("username")String name){	
//    	    	
//    	    	
//    	    	Optional<Member> optional = mmm.findByMember_name(name);
//    	    	Member member = optional.get();
//    	    	
//    	    	int abc = member.getMember_id() ;
////    	    	String a="aa";
//    			return couponService.findAllBymember(abc);   //service方法相較repository方法是自己定義的   	   
//    	    }
    		
       
       
       
	   
	   @PostMapping(path="/findById/{coupon_id}")
	   @ResponseBody
	   public Coupon processActionQuery(@PathVariable(name ="coupon_id") int coupon_id) {
		   return couponService.findByCoupon_id(coupon_id);
	   }
	   
//	   @PostMapping(path="/add")
//	   @ResponseBody
//	   public Member processActionAdd(@RequestBody Member member) {
//		   return memberService.insertMember(member);
//	   }
	   //, Set<ShopCart> set
	   @PostMapping(path="/add")   
	   @ResponseBody                    
	   public Coupon processActionAdd(String  coupon_name,String coupon_rule,String coupon_type,String coupon_status,String coupon_starttime,String coupon_endtime,String coupon_count,String coupon_addtime, String coupon_photo,MultipartFile file, Member member)throws Exception {
		   
		   Coupon coupon=new Coupon();
		   coupon.setCoupon_name(coupon_name);
		   coupon.setCoupon_rule(coupon_rule);
		   coupon.setCoupon_type(coupon_type);
		   coupon.setCoupon_status(coupon_status);
		   coupon.setCoupon_photo(coupon_photo);
		   
		   coupon.setMember(member);
		   
		   
		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        Date d1 = null;
	        Date d2 = null;
	        Date d3 = null;
	        try {
	        	
	       
	            d1 = format.parse(coupon_starttime);
	            d2 = format.parse(coupon_endtime);
	            d3 = format.parse(coupon_addtime);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        Date date1 = new Date(d1.getTime());
	        Date date2 = new Date(d2.getTime());
	        Date date3 = new Date(d3.getTime());
	     
		   coupon.setCoupon_starttime(date1);
		   coupon.setCoupon_endtime(date2);
		   coupon.setCoupon_count(Integer.parseInt(coupon_count));
		   coupon.setCoupon_addtime(date3);
		   //
		   
		 //  coupon.setShopCarts(shopCarts);
	
		   
		   if(!file.isEmpty()) {
		   
		   String fileName = file.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);//路徑與檔名設好
		   file.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   coupon.setCoupon_photo("/"+"coupon"+"/"+fileName);
		    
		   }
		   return couponService.insertCoupon(coupon);
	   }
	   //123 前端
//	   @PostMapping(path="/add2")   
//	   @ResponseBody                    
//	   public Coupon processActionAdd2(String  coupon_name,String coupon_rule,String coupon_type,String coupon_status,String coupon_starttime,String coupon_endtime,String coupon_count,String coupon_addtime, String coupon_photo,MultipartFile file, Member member)throws Exception {
//		   
//		   Coupon coupon=new Coupon();
//		   coupon.setCoupon_name(coupon_name);
//		   coupon.setCoupon_rule(coupon_rule);
//		   coupon.setCoupon_type(coupon_type);
//		   coupon.setCoupon_status(coupon_status);
//		   coupon.setCoupon_photo(coupon_photo);
//		   
//		   coupon.setMember(member);
//		   
//		   
//		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	        Date d1 = null;
//	        Date d2 = null;
//	        Date d3 = null;
//	        try {
//	        	
//	       
//	            d1 = format.parse(coupon_starttime);
//	            d2 = format.parse(coupon_endtime);
//	            d3 = format.parse(coupon_addtime);
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        Date date1 = new Date(d1.getTime());
//	        Date date2 = new Date(d2.getTime());
//	        Date date3 = new Date(d3.getTime());
//	     
//		   coupon.setCoupon_starttime(date1);
//		   coupon.setCoupon_endtime(date2);
//		   coupon.setCoupon_count(Integer.parseInt(coupon_count));
//		   coupon.setCoupon_addtime(date3);
//		   //
//		   
//		 //  coupon.setShopCarts(shopCarts);
//	
//		   
//		   if(!file.isEmpty()) {
//		   
//		   String fileName = file.getOriginalFilename();
//		   System.out.println("fileName:" + fileName);
//		   String saveDirPath = uploadDirectory;
//		   File savefileDir = new File(saveDirPath);
//		   savefileDir.mkdirs();
//		   File saveFilePath = new File(savefileDir, fileName);//路徑與檔名設好
//		   file.transferTo(saveFilePath);
//		   System.out.println("saveFilePath:" + saveFilePath);
//		   
//		   coupon.setCoupon_photo("/"+"coupon"+"/"+fileName);
//		    
//		   }
//		   return couponService.insertCoupon(coupon);
//	   }
//	   
	   
	   
	   
	   
	   @PostMapping(path = "/add3")
		@ResponseBody
		public Coupon processAddAction(@RequestBody Coupon c) {
			System.out.println("1111");
			return couponService.insertCoupon(c);
		}
	   
	   
	   
	   
	   //
	   @GetMapping(path="/add2")
	   @ResponseBody                    
	   public String processActionAdd2(String  coupon_name,String coupon_rule,String coupon_type,String coupon_status,String coupon_starttime,String coupon_endtime,String coupon_count,String coupon_addtime, String coupon_photo,MultipartFile file)throws Exception {
		   
		   //
		   tw.InHouse.member_model.Member member=new tw.InHouse.member_model.Member();
		   
		 
		   member.setMember_name("淳");  //先指定大哥 下面放小弟
		   Coupon coupon1 = new Coupon(1, "500送1000");
		   Coupon coupon2 = new Coupon(2, "200送300");
//			Item item2 = new Item("I002", 50.0, 2, cart);
//			Item item3 = new Item("I005", 30.0, 4, cart);
		//	Set<Item> itemsSet = new LinkedHashSet<Item>();
			Set<Coupon> couponSet = new LinkedHashSet<>(Arrays.asList(coupon1, coupon2 ));
			
//			member.setCouponAnno(couponSet);
//			double total  = 0 ;
//			for(Item item: itemsSet){
//				total += item.getUnitPrice() * item.getQuantity();
//			}
//			cart.setTotal(total);
		   
		   
		   
		   //
//		//   Coupon coupon=new Coupon();
//		   coupon.setCoupon_name(coupon_name);
//		   coupon.setCoupon_rule(coupon_rule);
//		   coupon.setCoupon_type(coupon_type);
//		   coupon.setCoupon_status(coupon_status);
//		   coupon.setCoupon_photo(coupon_photo);
//		   
//		   
//		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//	        Date d1 = null;
//	        Date d2 = null;
//	        Date d3 = null;
//	        try {
//	        	
//	       
//	            d1 = format.parse(coupon_starttime);
//	            d2 = format.parse(coupon_endtime);
//	            d3 = format.parse(coupon_addtime);
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	        Date date1 = new Date(d1.getTime());
//	        Date date2 = new Date(d2.getTime());
//	        Date date3 = new Date(d3.getTime());
//		   	   
//		   coupon.setCoupon_starttime(date1);
//		   coupon.setCoupon_endtime(date2);
//		   coupon.setCoupon_count(Integer.parseInt(coupon_count));
//		   coupon.setCoupon_addtime(date3);
//	
//
//		   if(!file.isEmpty()) {
//		   
//		   String fileName = file.getOriginalFilename();
//		   System.out.println("fileName:" + fileName);
//		   String saveDirPath = uploadDirectory;
//		   File savefileDir = new File(saveDirPath);
//		   savefileDir.mkdirs();
//		   File saveFilePath = new File(savefileDir, fileName);//路徑與檔名設好
//		   file.transferTo(saveFilePath);
//		   System.out.println("saveFilePath:" + saveFilePath);
//		   
//		   coupon.setCoupon_photo("/"+"coupon"+"/"+fileName);
//		    
//		   }
		   return "OK";
	   }
	   
	   
	   //
	   @PostMapping(path="/update")
	   @ResponseBody
	   public Coupon processActionUpdate(String  coupon_id_edit,String  coupon_name_edit,String coupon_rule_edit,String coupon_type_edit,String coupon_status_edit,String coupon_starttime_edit,String coupon_endtime_edit,String coupon_count_edit,String coupon_addtime_edit, String coupon_photo_edit,MultipartFile file_edit, List<ShopCart> shopCarts_edit) throws Exception{
		   Coupon coupon=new Coupon();
		   coupon.setCoupon_id(Integer.parseInt(coupon_id_edit));
		   coupon.setCoupon_name(coupon_name_edit);
		   coupon.setCoupon_rule(coupon_rule_edit);
		   coupon.setCoupon_type(coupon_type_edit);
		   coupon.setCoupon_photo(coupon_photo_edit);
		   coupon.setCoupon_status(coupon_status_edit);
		   
		   
		   //
		  // coupon.setShopCarts(shopCarts_edit);
		   //
		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date d1 = null;
	        java.util.Date d2 = null;
	        java.util.Date d3 = null;
	        try {
	        	
	       
	            d1 = format.parse(coupon_starttime_edit);
	            d2 = format.parse(coupon_endtime_edit);
	            d3 = format.parse(coupon_addtime_edit);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        Date date1 = new java.sql.Date(d1.getTime());
	        Date date2 = new java.sql.Date(d2.getTime());
	        Date date3 = new java.sql.Date(d3.getTime());
		   
		   
		   
		   coupon.setCoupon_starttime(date1);
		   coupon.setCoupon_endtime(date2);
		   coupon.setCoupon_count(Integer.parseInt(coupon_count_edit));
		   coupon.setCoupon_addtime(date3);
	   
//		   System.out.println("~~~~~~~");
//		   System.out.println(member);
		   if(!file_edit.isEmpty()) {
		   String fileName = file_edit.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);//file路徑
		   savefileDir.mkdirs();//可以在不存在的目录中创建文件夹
		   File saveFilePath = new File(savefileDir, fileName);
		   file_edit.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   coupon.setCoupon_photo("/"+"coupon"+"/"+fileName);
		   }
		   
		   
		   return couponService.updateCoupon(coupon);
		   
	   }
	   
	   //123
	   @PostMapping(path="/update2")
	   @ResponseBody
	   public Coupon processActionUpdate2(String  coupon_id_edit,String  coupon_name_edit,String coupon_rule_edit,String coupon_type_edit,String coupon_status_edit,String coupon_starttime_edit,String coupon_endtime_edit,String coupon_count_edit,String coupon_addtime_edit, String coupon_photo_edit,MultipartFile file_edit,String member_edit) throws Exception{
		   Coupon coupon=new Coupon();
		   coupon.setCoupon_id(Integer.parseInt(coupon_id_edit));
		   coupon.setCoupon_name(coupon_name_edit);
		   coupon.setCoupon_rule(coupon_rule_edit);
		   coupon.setCoupon_type(coupon_type_edit);
		   coupon.setCoupon_photo(coupon_photo_edit);
		   coupon.setCoupon_status(coupon_status_edit);
		   
		   
		   //
		  // coupon.setShopCarts(shopCarts_edit);
		   //
		   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        java.util.Date d1 = null;
	        java.util.Date d2 = null;
	        java.util.Date d3 = null;
	        try {
	        	
	       
	            d1 = format.parse(coupon_starttime_edit);
	            d2 = format.parse(coupon_endtime_edit);
	            d3 = format.parse(coupon_addtime_edit);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        Date date1 = new java.sql.Date(d1.getTime());
	        Date date2 = new java.sql.Date(d2.getTime());
	        Date date3 = new java.sql.Date(d3.getTime());
		   
		   
		   
		   coupon.setCoupon_starttime(date1);
		   coupon.setCoupon_endtime(date2);
		   coupon.setCoupon_count(Integer.parseInt(coupon_count_edit));
		   coupon.setCoupon_addtime(date3);
		   
		   
		   
		   
		   
		   int ccc= Integer.parseInt(member_edit);
		   
		   Member member2 = memberService.findByMember_id(ccc);
		   String member_name = member2.getMember_name();
		   
		   System.out.println("ccc:"+ccc);
		   
		   Member member = new Member();
		   member.setMember_id(ccc);
		   member.setMember_name(member_name);
		   
		   System.out.println("member_name:"+member_name);
		   
		   
		   coupon.setMember(member);
		   //
	   
//		   System.out.println("~~~~~~~");
//		   System.out.println(member);
		   if(!file_edit.isEmpty()) {
		   String fileName = file_edit.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);//file路徑
		   savefileDir.mkdirs();//可以在不存在的目录中创建文件夹
		   File saveFilePath = new File(savefileDir, fileName);
		   file_edit.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   coupon.setCoupon_photo("/"+"coupon"+"/"+fileName);
		   }
		   
		   
		   return couponService.updateCoupon(coupon);
		   
	   }
	   
	   
	   
	   //
	   
	   @PostMapping(path="/delete/{coupon_id}")
	   @ResponseBody                  
	   public void processActionDelete(@PathVariable(name ="coupon_id") int coupon_id){
		   couponService.deleteByCoupon_id(coupon_id);
	   }
	   

	   
	   @PostMapping(path="/queryAllByPage/{pageNo}") 
	   @ResponseBody
	   public List<Coupon> processActionByPage(@PathVariable(name ="pageNo")int pageNo,Model m){
		   int pageSize=7;
		   Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		   Page<Coupon> page = couponService.findAllByPage(pageable);
		   m.addAttribute("totalPages",page.getTotalPages());
		   m.addAttribute("totalElements",page.getTotalElements());
		   return page.getContent();
	   }
	   
	   public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/coupon";
	                                                    //System.getProperty("user.dir")就是目前專案 +後面完整路徑
}
