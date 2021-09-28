package tw.InHouse.reserve_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.InHouse.reserve_model.Reserve;
import tw.InHouse.reserve_model.ReserveService;


@Controller
@RequestMapping(path = "/inhouse/reserve")
@SessionAttributes(names = { "totalPages", "totalElements" })
public class AddReserveFormController {

	@Autowired
	private ReserveService rService;

	// 跳轉新增前端頁面
	@RequestMapping(path = "/addReserveForm")
	public String successPage() {
		return "reserve/AddReserve";

	}

	// 前端新增一筆資料
	/*@PostMapping(path = "/addForm")
	@ResponseBody
	public Reserve processAddForm(@RequestBody Reserve r) {
		return rService.insertReserve(r);
	}*/
	
	
	// 前端新增一筆資料
	@PostMapping(path = "/addFrontend")
	@ResponseBody
	public Reserve processAddAction(@RequestBody Reserve r) {
		return rService.insertReserve(r);
	}
	
	//預約成功畫面
	@RequestMapping(path = "/ReservePage")
	public String addReserveForm() {
		return "reserve/ReservePage";

	}
}
