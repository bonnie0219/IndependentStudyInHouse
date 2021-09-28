package tw.InHouse.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class HomepageController {
	
	
	@RequestMapping(value = "/inhouse/homepage", method = RequestMethod.GET)
    public String loginBackend(Model model) {
        return "/homepage/Homepage";
    }
	
	@RequestMapping(value = "/inhouse/about", method = RequestMethod.GET)
    public String aboutinhouse(Model model) {
        return "/homepage/AboutInHouse";
    }
	
}
