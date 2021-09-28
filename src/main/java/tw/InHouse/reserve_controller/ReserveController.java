package tw.InHouse.reserve_controller;

import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.InHouse.member_model.MemberService;
import tw.InHouse.reserve_model.Reserve;
import tw.InHouse.reserve_model.ReserveService;

@Controller
@RequestMapping(path = "/backend/reserve")
@SessionAttributes(names = { "totalPages", "totalElements" })
public class ReserveController {
	

	@Autowired
	private ReserveService rService;

	@Autowired
	private MemberService mService;
	
	// 跳轉後端頁面
	@GetMapping(path = "/allReserve")
	public String processQueryMainPage() {
		System.out.println("------------allReserve----------");
		return "reserve/AllReserve";
	}
	
	// 呈現全部資料
	@PostMapping("/all")
	@ResponseBody
    public List<Reserve> list() {
		System.out.println("------------all----------");
		System.out.println(rService.findAll());
        return rService.findAll();
    }

	
	// 後端新增一筆資料
	@PostMapping(path = "/add")
	@ResponseBody
	public Reserve processAddAction(@RequestBody Reserve r) {
		return rService.insertReserve(r);
	}
	


	// 查詢單筆
	@PostMapping("/query/{id}")
	@ResponseBody
	public Reserve processQueryById(@PathVariable("id") int id) {
		System.out.println("-----------  query  -------------");
		System.out.println(id);
		
		return rService.findById(id);
	}

	// 修改
	@PostMapping("/update/{id}")
	@ResponseBody
	public Reserve update(@RequestBody Reserve r, @PathVariable Integer id) {
		return rService.updateReserve(r);
	}
	
	// 刪除
	@PostMapping("/delete/{id}")
	@ResponseBody
	public void processdeleteAction(@PathVariable Integer id) {
		rService.deleteReserve(id);
	}
	
	

	// Github 少一個前端新增的O2M
}
