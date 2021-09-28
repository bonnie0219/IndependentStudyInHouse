package tw.InHouse.portfolio_controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.InHouse.article_model.Article;
import tw.InHouse.article_model.ArticleService;
import tw.InHouse.article_model.Articlememberin;
import tw.InHouse.portfolio_model.Portfolio;
import tw.InHouse.portfolio_model.PortfolioService;
import tw.InHouse.portfolio_model.Portfoliomemberin;

@Controller
@RequestMapping(path="/inhouse/portfolio")
public class PortfolioVistorController {


	@Autowired
	public PortfolioService portfolioservice;
	@Autowired
	public ArticleService articleService;
	
	   @GetMapping(path="/portfolioqueryAction.controller")
       public String processQueryAction() {
    	   return "portfolio/AllPortfolio";
       }
	   @PostMapping(path="/all")
	   @ResponseBody
	   public List<Portfolio> Listarticle(){
		   return portfolioservice.findAllPortfolio();
	   }
	   @PostMapping(path="/query/{article_id}")
	   @ResponseBody
	   public Portfolio processActionQuery(@PathVariable(name ="article_id") int article_id) {
		   return portfolioservice.findById(article_id);
	   }
	
	   //取得的資料
	   @GetMapping(path="/portfolioView/getall")
	   @ResponseBody
	   public ModelAndView gaet1(
			   ) {
		   ModelAndView mav = new ModelAndView("portfolio/portfolioView");
		   List<Portfolio> thePortfolioBean = (List<Portfolio>) portfolioservice.findAllPortfolio();
    		mav.addObject("thePortfolioBean", thePortfolioBean);
			return mav;		
	   }
	   
	   //帳號從後端文章直接連接到前端的文章
	   @GetMapping(path="/portfolioView/{portfolio_id}")
	   @ResponseBody
	   public ModelAndView get1(
			   @PathVariable(name ="portfolio_id") int article_id
			   ) {
		//   return articleService.findById(article_id);
		   
		   List<Portfolio> theColumnBean = (List<Portfolio>) portfolioservice.findByPortfolioid(article_id);
		   if (!theColumnBean.isEmpty()) {
		   ModelAndView mav = new ModelAndView("portfolio/portfolioinside");
	 	//    List<Article> top3 = (List<Article>) articleService.findByTop3();
	 	    List<Portfolio> top3 = (List<Portfolio>) portfolioservice.findByTop3();
		    List<Portfolio> findPrevious = (List<Portfolio>) portfolioservice.findPrevious(article_id);
		    List<Portfolio> findNext = (List<Portfolio>) portfolioservice.findNext(article_id);
		    List<Portfoliomemberin> amin = (List<Portfoliomemberin>) portfolioservice.findPortfoliomemberin(article_id);
		    mav.addObject("amin",amin);
		    mav.addObject("findNext",findNext);
		    mav.addObject("findPrevious",findPrevious);
		    mav.addObject("top3", top3);
    		mav.addObject("theColumnBean", theColumnBean);
			return mav;
			}else{
				//沒有查到任何文章就回到專欄介紹
				 ModelAndView mav = new ModelAndView("portfolio/portfolioView");
		         List<Portfolio> thePortfolioBean = (List<Portfolio>) portfolioservice.findAllPortfolio();
		         mav.addObject("thePortfolioBean", thePortfolioBean);
		    	 return mav;
			}
	   }
	   //--------------------------
	   @PostMapping(path="portfolioView/memberinportfolio/{article_id}")
		// @ResponseBody
	   public String memberinarticle(
				   @RequestParam(value ="member_name") String member_name,
				   @RequestParam(value ="member_photo")  String member_photo,
				  @RequestParam(value ="article_id") Integer article_id,
				  @RequestParam(value ="article_in") String article_in
					) {
//		   List<String> Ls = (List<String>)articleService.searchmemberLike(article_id, member_name);
//		   if (Ls.isEmpty()) {	
			   System.out.println("---------------------裡面沒東西");
			   Articlememberin ami = new Articlememberin();
			   ami.setMember_name(member_name);
			   ami.setMember_photo(member_photo);
			   ami.setArticle_id(article_id);
			   ami.setArticle_in(article_in);
			   ami.setArticlemember_like(0);
			   //時間
			   SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss");
			   String tp = sdf.format(new Date());
			   ami.setArticle_intime(tp);
			   //articleService.
			   System.out.println("-----------");
		//	   articlememberService.insertArticlemember(ami);
			   return "redirect:/inhouse/portfolio/portfolioView/"+article_id+"";
		   }
	  //------------------------ 
	   
	   
	   @PostMapping(path="/portfoliolikego/{portfolio_id}/{member_name}")
	   public String hiteast(
				  @PathVariable(name ="portfolio_id") Integer article_id,
				  @PathVariable(name ="member_name") String member_name
					) {
		 System.out.println("-------now here portfoilolikego ----");
	//	 List<String> Ls = (List<String>)articleService.searchmemberLike(article_id, member_name);
		 List<String> Ls = (List<String>)portfolioservice.searchmemberportfoiloLike(article_id, member_name);
		 System.out.println(Ls);
         System.out.println("---------------------------------------");
	   //如果名稱與文章ID是空的 就讓他+1
	    if (Ls.isEmpty()) {
	    	System.out.println("裡面沒東西");
	    	portfolioservice.portfoiloaddLike(article_id, member_name);
	    	portfolioservice.portfoilopluslike(article_id);
	    	return "redirect:/inhouse/portfolio/portfolioView/"+article_id+"";
	    }
	    System.out.println("裡面有東西");
			    System.out.println(article_id);
		    return null;
         } 
	   
	   //留言區留言
	   @PostMapping(path="portfolioView/memberinarticle/{portfolio_id}")
		// @ResponseBody
	   public String memberinportfolio(
				   @RequestParam(value ="member_name") String member_name,
				   @RequestParam(value ="member_photo")  String member_photo,
				  @RequestParam(value ="portfolio_id") Integer portfolio_id,
				  @RequestParam(value ="portfolio_in") String portfolio_in
					) {
//		   List<String> Ls = (List<String>)articleService.searchmemberLike(article_id, member_name);
//		   if (Ls.isEmpty()) {	
			   System.out.println("---------------------裡面沒東西");
			   Portfoliomemberin pmi = new Portfoliomemberin();
		//	   Articlememberin ami = new Articlememberin();
			//   pmi.setIdam(portfolio_id);
			   pmi.setMember_name(member_name);
			   pmi.setMember_photo(member_photo);
			   pmi.setPortfolio_id(portfolio_id);
			   pmi.setPortfolio_in(portfolio_in);
//			   ami.setArticle_id(article_id);
//			   ami.setArticle_in(article_in);
			   pmi.setPortfoliomember_like(0);
			   //時間
			   SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss");
			   String tp = sdf.format(new Date());
			   pmi.setPortfolio_intime(tp);
			   //articleService.
			   System.out.println("-----------");
			   portfolioservice.insertPortfoliomember(pmi);
		//	   articlememberService.insertArticlemember(ami);
			   return "redirect:/inhouse/portfolio/portfolioView/"+portfolio_id+"";
		   }
	   //留言喜歡
	   @PostMapping(path="golikeportfoliomessage/{portfolio_id}/{member_name}/{idpm}")
		// @ResponseBody
	   public String likemembermessage(
				  @PathVariable(name ="portfolio_id") Integer portfolio_id,
				  @PathVariable(name ="member_name") String member_name,
				  @PathVariable(name ="idpm") Integer idpm
					) {
		 System.out.println(member_name+portfolio_id);
		 List<String> searchmembermessageLike = (List<String>)portfolioservice.searchmembermessageLike(portfolio_id, member_name,idpm);
		 System.out.println(searchmembermessageLike);
      System.out.println("---------------------------------------");
	   //如果名稱與文章編號是空的 就讓他+1
	    if (searchmembermessageLike.isEmpty()) {
	    	System.out.println("該留言帳號沒有按過讚喔");
	    	portfolioservice.addPortfoliomemberLike(portfolio_id, member_name,idpm);

	    	portfolioservice.plusPortfoliomemberLike(idpm);
	    	return "redirect:/inhouse/portfolio/portfolioView/"+portfolio_id+"";
	    }
	    System.out.println("裡面有東西");
			    System.out.println(portfolio_id);
		    return null;

		   } 
	   //設定留言區的刪除
	   @PostMapping(path="/delete/{portfolio_id}/{member_name}")
	   @ResponseBody      
	   public void processActionDelete(
			   @PathVariable(name ="portfolio_id") Integer portfolio_id
			   //		   ,@RequestParam(name ="member_name",required=false) String member_name
			   ,@PathVariable(name ="member_name",required=false) String member_name
			   ){
		   System.out.println("member_name1:"+member_name);
		   portfolioservice.deletePortfoliomember(portfolio_id,member_name);
	   }
	   
	   
}
//  public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/portfolio";
