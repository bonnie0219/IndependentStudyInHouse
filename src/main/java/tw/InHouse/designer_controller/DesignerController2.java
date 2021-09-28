package tw.InHouse.designer_controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.InHouse.designer_model.Designer;
import tw.InHouse.designer_model.DesignerService;
import tw.InHouse.portfolio_model.Portfolio;
import tw.InHouse.portfolio_model.PortfolioService;


@Controller
@RequestMapping(path="/inhouse/")
public class DesignerController2 {
	   
	  @Autowired
	  private DesignerService designerService;
	
	  @Autowired
	  private PortfolioService portfolioService;
	  
	   @GetMapping(path="/designer")
       public String processQueryAction(Model model,HttpServletRequest request) {
		   List<Designer> designer = new ArrayList<>();
		   designer = designerService.findAll();
		   model.addAttribute("designers", designer);
    	   return "designer/designers1-1";
       }
	   
	   @GetMapping(path="/designer/{designer_id}")
       public String processQueryAction(Model model,HttpServletRequest request,@PathVariable(name ="designer_id") int designer_id) {
		   Designer designer = new Designer();
		   designer=designerService.findByDesigner_id(designer_id);
		   List<Portfolio> portfolio = new ArrayList<>();
		   portfolio=portfolioService.findPortfolioByDesigner_id(designer_id);
		   
		   model.addAttribute("designer", designer);
		   model.addAttribute("portfolio", portfolio);
    	   return "designer/Profiles_designers";
       }
	 
	   
}
