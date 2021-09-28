package tw.InHouse.reserve_controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/inhouse/reserve")
public class ServiceProcessController {

	// 跳轉服務流程頁面
		@RequestMapping(path = "/ServiceProcess")
		public String serviceProcess() {
			return "reserve/ServiceProcess";

		}
		
}
