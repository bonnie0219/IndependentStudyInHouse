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
@RequestMapping(path="/inhouse")
@SessionAttributes(names = {"totalPages","totalElements"})
public class NoProfilesController {
	   @Autowired
       private CouponService couponService;
	   
	   @Autowired
       private MemberService memberService;
	   
	   @Autowired
	   private MemberRepository mmm;
	   

       
       @GetMapping(path="/couponManage")//進入點
       public String processCouponManage() {
    	   return "coupon/couponManage";
       }
       

       
       @GetMapping(path="/font1")//進入點
       public String processFont1() {
    	   return "/coupon/font1";
       }
       
       @GetMapping(path="/font2")//進入點
       public String processFont2() {
    	   return "/coupon/font2";
       }
       
       @GetMapping(path="/activity")//進入點
       public String processFront4() {
    	   return "/coupon/front3";
       }
       
//       @GetMapping(path="/front4")//進入點
//       public String processFront5() {
//    	   return "/coupon/front4";
//       }
//       
       @GetMapping(path="/frontNews")//進入點
       public String processFont3() {
    	   return "/coupon/frontNews";
       }
       
       
       @GetMapping(path="/bylaws")//進入點
       public String processFront5() {
    	   return "/coupon/front5";
       }
    
	  // public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/coupon";
	                                                    //System.getProperty("user.dir")就是目前專案 +後面完整路徑
}
