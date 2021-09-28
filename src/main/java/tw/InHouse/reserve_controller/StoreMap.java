package tw.InHouse.reserve_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/inhouse/reserve")
public class StoreMap {

	// 跳轉中壢門市頁面
	@RequestMapping(path = "/StoreCLI")
	public String storeCLI() {
		return "reserve/Store_CLI";

	}

	// 跳轉基隆門市頁面
	@RequestMapping(path = "/StoreKEL")
	public String storeKEL() {
		return "reserve/Store_KEL";

	}

	// 跳轉台中門市頁面
	@RequestMapping(path = "/StoreTXG")
	public String storeTXG() {
		return "reserve/Store_TXG";

	}

	// 跳轉高雄門市頁面
	@RequestMapping(path = "/StoreKHH")
	public String storeKHH() {
		return "reserve/Store_KHH";

	}
}
