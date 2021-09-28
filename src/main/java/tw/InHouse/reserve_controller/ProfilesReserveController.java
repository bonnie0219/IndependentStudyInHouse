package tw.InHouse.reserve_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.InHouse.member_model.MemberService;
import tw.InHouse.reserve_model.Reserve;
import tw.InHouse.reserve_model.ReserveService;


@Controller
@RequestMapping(path = "/inhouse")
public class ProfilesReserveController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ReserveService rService;

	// 簡單版畫面(可以帶出資料)
	@GetMapping(path = "/ProfilesReserve0")
	public String MainPage0() {
		return "reserve/ProfilesReserve";
	}

	// 簡單版畫面+套版
	@GetMapping(path = "/ProfilesReserve2")
	public String MainPage() {
		return "homepage/Profiles";
	}
	
	// 簡單版畫面+套版+頁籤
	@GetMapping(path = "/ProfilesTabReserve")
	public String MainPage2() {
		return "homepage/ProfilesTab";
	}

	// 查詢會員id
	@PostMapping("/querybymember2/{reserve_memberid}")
	@ResponseBody
	public List<Reserve> processQueryByMemberId2(@PathVariable("reserve_memberid") int reserve_memberid) {
		System.out.println("-----------  query  -------------");
		System.out.println(reserve_memberid);

		return rService.findByMemberid(reserve_memberid);
	}
	
	
	//DataTable畫面
	@GetMapping(path = "/ProfilesReserve1")
	public String MainPage1() {
		return "reserve/ReserveProfiles";
	}

	// DataTable查詢會員id
	@PostMapping("/querybymember1/{reserve_memberid}")
	@ResponseBody
	public List<Reserve> processQueryByMemberId1(@PathVariable("reserve_memberid") int reserve_memberid) {
		System.out.println("-----------  query  -------------");
		System.out.println(reserve_memberid);

		return rService.findByMemberid(reserve_memberid);
	}
	
	
	
}
