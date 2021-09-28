package tw.InHouse.order_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ShopPayController {
	
	@GetMapping(path = "/inhouse/shoppaypage")
	public String goToShopPayPage() {
		return "order/shopCheckOut";
	}


}
