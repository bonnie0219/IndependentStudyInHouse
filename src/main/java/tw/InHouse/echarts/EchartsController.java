package tw.InHouse.echarts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.InHouse.article_model.Article;
import tw.InHouse.article_model.ArticleService;
import tw.InHouse.order_model.ShopCart;
import tw.InHouse.order_model.ShopCartService;
import tw.InHouse.portfolio_model.Portfolio;
import tw.InHouse.portfolio_model.PortfolioService;
import tw.InHouse.product_model.Product;
import tw.InHouse.product_model.ProductService;

@Controller
public class EchartsController {
	   
	   
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ArticleService aService;

	@Autowired
	private PortfolioService pfService;

	@Autowired
	private ShopCartService sService;
	
	@GetMapping(path="/backend/allecharts")
    public String processQueryAction() {
 	   return "echarts/AllEcharts";
    }
	
    @RequestMapping("/backend/echartsproduct")
    @ResponseBody
    public List<Product> echartsproduct(Model model){
//    	System.out.println("123");
    	return pService.findAllProduct();
    }
    
    @RequestMapping("/backend/echartsarticle")
    @ResponseBody
    public List<Article> echartsarticle(Model model){
//    	System.out.println("123");
    	return aService.findAllArticle();
    }
    
    @RequestMapping("/backend/echartsportfolio")
    @ResponseBody
    public List<Portfolio> echartsportfolio(Model model){
//    	System.out.println("123");
    	return pfService.findAllPortfolio();
    }
    
    @RequestMapping("/backend/echartsorder")
    @ResponseBody
    public List echartsorder(Model model){
//    	System.out.println("sService.searchRevenue():"+sService.searchRevenue().get(0));
//    	System.out.println("sService.searchRevenue():"+sService.searchRevenue().get(1));
//    	System.out.println("sService.searchRevenue():"+sService.searchRevenue().get(2));
    	return sService.searchRevenue();
    }
}
