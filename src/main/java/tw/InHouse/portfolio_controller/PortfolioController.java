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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.InHouse.article_model.Articlememberin;
import tw.InHouse.designer_model.Designer;
import tw.InHouse.designer_model.DesignerService;
//import tw.InHouse.article_model.Article;
//import tw.InHouse.article_model.ArticleService;
import tw.InHouse.portfolio_model.Portfolio;
import tw.InHouse.portfolio_model.PortfolioService;
import tw.InHouse.portfolio_model.Portfoliomemberin;

@Controller
@RequestMapping(path="/backend/portfolio")
public class PortfolioController {

	@Autowired
	public PortfolioService portfolioservice;
	@Autowired
    private DesignerService designerService;
	
	   @GetMapping(path="/portfolioqueryAction.controller")
       public String processQueryAction() {
    	   return "portfolio/AllPortfolio";
       }
	   @PostMapping(path="/all")
	   @ResponseBody
	   public List<Portfolio> Listarticle(){
		   return portfolioservice.findAllPortfolio();
	   }
	   @PostMapping(path="/query/{portfolio_id}")
	   @ResponseBody
	   public Portfolio processActionQuery(@PathVariable(name ="portfolio_id") int portfolio_id) {
		   return portfolioservice.findById(portfolio_id);
	   }
//	   @PostMapping(path="/update/{portfolio_id}")
//	   @ResponseBody
//	   public Portfolio editprocessActionQuery(@PathVariable(name ="portfolio_id") int portfolio_id) {
//		   return portfolioservice.findById(portfolio_id);
//	   }
	   @PostMapping(path="/delete/{portfolio_id}")
	   @ResponseBody                  
	   public void processActionDelete(@PathVariable(name ="portfolio_id") Integer portfolio_id){
		   
		   portfolioservice.deletePortfolio(portfolio_id);
	   }
	   @PostMapping(path="/add")
	   @ResponseBody
	   public Portfolio processActionAdd(
			   String portfolio_title,
			   String designer_id,
			   String portfolio,
			   String portfolio_like,
			   String portfolio_time,
			   String portfolio_image,MultipartFile file)throws Exception {
		   Portfolio a=new Portfolio();
           a.setPortfolio_title(portfolio_title);
           Designer designer = designerService.findByDesigner_id(Integer.parseInt(designer_id));
           a.setDesigner_id(designer);
           a.setPortfolio(portfolio);
           a.setPortfolio_like(0);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss");
			String tp = sdf.format(new Date());
			a.setPortfolio_time(tp);
		   if(!file.isEmpty()) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			String timeStamp = simpleDateFormat.format(new Date());
		   String fileName = timeStamp+file.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   a.setPortfolio_image("/images/"+"portfolio"+"/"+fileName);
		   }
		   return portfolioservice.insertPortfolio(a);
	   }
	   @PostMapping(path="/update/{id}")
	   @ResponseBody
	   public Portfolio processActionUpdate(
			   String portfolio_id_edit,
			   String portfolio_title_edit,
			   String portfolio_like_edit,
			   String designer_id_edit,
			   String portfolio_edit,
			   String portfolio_time_edit,
			   String portfolio_image_edit,MultipartFile file_edit)throws Exception {
		   Portfolio a=new Portfolio();
		   
          // a.setArticle_id(Integer.parseInt(article_id));
          //    a.setPortfolio_id(Integer.parseInt(article_id_edit));
           a.setPortfolio_id(Integer.parseInt(portfolio_id_edit));
           a.setPortfolio_title(portfolio_title_edit);
           Designer designer = designerService.findByDesigner_id(Integer.parseInt(designer_id_edit));
           a.setDesigner_id(designer);
           a.setPortfolio(portfolio_edit);
           a.setPortfolio_like(Integer.parseInt(portfolio_like_edit));
           a.setPortfolio_image(portfolio_image_edit);
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss");
		   String tp = sdf.format(new Date());
		   a.setPortfolio_time(tp);
		   if(!file_edit.isEmpty()) {
		   String fileName = file_edit.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file_edit.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   a.setPortfolio_image("/images/"+"portfolio"+"/"+fileName);
		   
		   }
		
		   
		   return portfolioservice.insertPortfolio(a);
		   
	   }
	   //取得的資料
	   @GetMapping(path="/portfolioView/getall")
	   @ResponseBody
	   public ModelAndView gaet11(
			   ) {
		   ModelAndView mav = new ModelAndView("portfolio/portfolioView");
		   List<Portfolio> thePortfolioBean = (List<Portfolio>) portfolioservice.findAllPortfolio();
    		mav.addObject("thePortfolioBean", thePortfolioBean);
    		System.out.println(thePortfolioBean);
			return mav;		
	   }
	   
	   //帳號從後端文章直接連接到前端的文章
	   @GetMapping(path="/portfolioViewAccount/{article_id}")
	   @ResponseBody
	   public ModelAndView get1(
			   @PathVariable(name ="article_id") int article_id
			   ) {
		//   return articleService.findById(article_id);
		   
		   List<Portfolio> theColumnBean = (List<Portfolio>) portfolioservice.findByPortfolioid(article_id);
		   if (!theColumnBean.isEmpty()) {
		   ModelAndView mav = new ModelAndView("portfolio/portfolioinside");
//	 	    List<Article> top3 = (List<Article>) articleService.findByTop3();
//		    List<Article> findPrevious = (List<Article>) articleService.findPrevious(article_id);
//		    List<Article> findNext = (List<Article>) articleService.findNext(article_id);
//		    mav.addObject("findNext",findNext);
//		    mav.addObject("findPrevious",findPrevious);
//		    mav.addObject("top3", top3);
    		mav.addObject("theColumnBean", theColumnBean);
			return mav;
			}else{
				//沒有查到任何文章就回到專欄介紹
				 ModelAndView mav = new ModelAndView("portfolio/portfolioViewAccount");
		         List<Portfolio> theColumnBeana = (List<Portfolio>) portfolioservice.findAllPortfolio();
		    	 mav.addObject("theColumnBean", theColumnBeana);
		    	 return mav;
			}
	   }
	   
	   //文章個別留言查詢-------------------------------
	   @PostMapping(path="/selectmessage/{article_id}")
	   @ResponseBody    
	   public  List<Portfoliomemberin> selectmessage(@PathVariable(name="article_id")Integer article_id){
		   System.out.println("有使用到--文章個別留言查詢----------------");   
		   System.out.println("該文章的ID:"+article_id);   
	   return  portfolioservice.selectmessage(article_id);
	//	    null;
	   }
	   //文章所有留言查詢-------------------------------
	   @PostMapping(path="/selectmessage")
	   @ResponseBody    
	   public  List<Portfoliomemberin> selectmaessage(){
		   System.out.println("有使用到---文章所有留言查詢---------------");
		   return  portfolioservice.selectmessageall();
		   //	    null;
	   }
	 //--------------刪一個----------------------------------------------  
	   @PostMapping(path="/deletemessageone/{idam}")
	   @ResponseBody      
	   public void processActionDeletetomessage(
			   @PathVariable(name ="idam") Integer idam
			   ){
		//   System.out.println("刪除的文章ID:"+article_id);
     	   System.out.println("刪除的編號ID:"+idam);
//		   articlememberService.deleteArticlemember(article_id,member_name);
     	  portfolioservice.deletemessageone(idam);
	   }
	   
	   
	   public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/portfolio";
	   
}
