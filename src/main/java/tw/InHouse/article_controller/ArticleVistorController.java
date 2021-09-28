package tw.InHouse.article_controller;


import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.InHouse.article_model.Article;
import tw.InHouse.article_model.ArticleService;
import tw.InHouse.article_model.ArticlememberService;
import tw.InHouse.article_model.Articlememberin;
import tw.InHouse.member_model.Member;

@Controller
@RequestMapping(path="/inhouse/article")
public class ArticleVistorController {

	
	
	   @Autowired
       public ArticleService articleService;
	   @Autowired
	   public ArticlememberService articlememberService;
	   @RequestMapping(path = "articleView", method = RequestMethod.GET)
		@ResponseBody
		public ModelAndView listColumnBean() throws Exception {
			ModelAndView mav = new ModelAndView("article/articleView");
			List<Article> theColumnBean = (List<Article>) articleService.findAllArticle();
    		mav.addObject("theColumnBean", theColumnBean);
			return mav;
		}

	 //從後端文章直接連接到前端的文章
	   @GetMapping(path="/articleView/{article_id}")
	   @ResponseBody
		   public ModelAndView get1(
			   @PathVariable(name ="article_id") int article_id
			   ,HttpServletRequest request
			 //  ,@PathVariable(name = "username") String username
			 //  ,@PathVariable(name = "member_name") String member_name
		    //  ,@RequestParam (name ="member.member_name",required=false)String member_name
			) {
		   
		    List<Article> theColumnBean = (List<Article>) articleService.findByArticleid(article_id);
		    if (!theColumnBean.isEmpty()) {
		    	ModelAndView mav = new ModelAndView("article/articleinside");
	 	    List<Article> top3 = (List<Article>) articleService.findByTop3();
		    List<Article> findPrevious = (List<Article>) articleService.findPrevious(article_id);
		    List<Article> findNext = (List<Article>) articleService.findNext(article_id);
		    List<Articlememberin> amin = (List<Articlememberin>) articlememberService.findArticlememberin(article_id);
		    request.setAttribute("amina",amin);
		    mav.addObject("amin",amin);
		    mav.addObject("findNext",findNext);
		    mav.addObject("findPrevious",findPrevious);
		    mav.addObject("top3", top3);
    		mav.addObject("theColumnBean", theColumnBean);
    		
    	//	System.out.println("here name is:"+member_name);
    		return mav ;
    		}else {
    			//沒有查到任何文章就回到專欄介紹
    	 ModelAndView mav = new ModelAndView("article/articleView");
         List<Article> theColumnBeana = (List<Article>) articleService.findAllArticle();
    	 mav.addObject("theColumnBean", theColumnBeana);
    	 return mav;
    		}
	   }
	   @PostMapping(path="/articleView/{article_id}")
	   @ResponseBody
	   public List<Articlememberin> gest1(@PathVariable(name ="article_id") int article_id) {
		   return articlememberService.findArticlememberin(article_id);
	   }
	   
	   
	   //取得的資料
	   @GetMapping(path="/articleView/getall")
	   @ResponseBody
	   public ModelAndView gaet1(
			   ) {
		   ModelAndView mav = new ModelAndView("article/articleView");
		   List<Article> theColumnBean = (List<Article>) articleService.findAllArticle();
    		mav.addObject("theColumnBean", theColumnBean);
			return mav;
			
	   }
//	   @GetMapping(path="/articleView/{article_id}")
//	   @ResponseBody
//		   public List<Articlememberin> Listarticle(
//				   @PathVariable(name ="article_id") int article_id){
//			   return articlememberService.findArticlememberin(article_id);
//		   }
	   
	 //帳號觀看所有客戶分享文章
	   @GetMapping(path="/articleView/getalla1")
	   @ResponseBody
	   public ModelAndView getalla1(
			   ) {
		   System.out.println("文章類型:客戶分享");
		   ModelAndView mav = new ModelAndView("article/articleView");
		   List<Article> theColumnBean = (List<Article>) articleService.findListTitle1();
    		mav.addObject("theColumnBean", theColumnBean);
			return mav;
	   }
	   //帳號觀看所有名人推薦文章
	   @GetMapping(path="/articleView/getalla2")
	   @ResponseBody
	   public ModelAndView getalla2(
			   ) {
		   System.out.println("文章類型:名人推薦");
		   ModelAndView mav = new ModelAndView("article/articleView");
		   List<Article> theColumnBean = (List<Article>) articleService.findListTitle2();
    		mav.addObject("theColumnBean", theColumnBean);
			return mav;
	   }
	   
	   
	   @PostMapping(path="/articlelikego/{article_id}/{member_name}")
		  //@ResponseBody
	   public String hiteast(
//				   @RequestParam(value ="member_name") String member_name,
//				  @RequestParam(value ="article_id") Integer article_id
				  @PathVariable(name ="article_id") Integer article_id,
				  @PathVariable(name ="member_name") String member_name
					) {
		 System.out.println("-------now here articlelikego ----");
		 List<String> Ls = (List<String>)articleService.searchmemberLike(article_id, member_name);
		 System.out.println(Ls);
         System.out.println("---------------------------------------");
	   //如果名稱與文章ID是空的 就讓他+1
	    if (Ls.isEmpty()) {
	    	System.out.println("裡面沒東西");
	    	articleService.addLike(article_id, member_name);
	    	articleService.pluslike(article_id);
	    	return "redirect:/inhouse/article/articleView/"+article_id+"";
	    }
	    System.out.println("裡面有東西");
			    System.out.println(article_id);
		    return null;

		   } 

	   @PostMapping(path="articleView/memberinarticle/{article_id}")
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
			   articlememberService.insertArticlemember(ami);
			   return "redirect:/inhouse/article/articleView/"+article_id+"";
		   }
//           return "redirect:/inhouse/article/articleView/"+article_id+"";
//
//		   } 

	   //設定留言區的刪除
	   @PostMapping(path="/delete/{article_id}/{member_name}")
	   @ResponseBody      
	   public void processActionDelete(
			   @PathVariable(name ="article_id") Integer article_id
	//		   ,@RequestParam(name ="member_name",required=false) String member_name
			   ,@PathVariable(name ="member_name",required=false) String member_name
			   ){
		   System.out.println("member_name1:"+member_name);
		   articlememberService.deleteArticlemember(article_id,member_name);
	   }
	   //文章所有留言查詢
	   @PostMapping(path="/selectmeassage/{article_id}")
	   @ResponseBody    
	   public  List<Articlememberin> selectmessage(@PathVariable(name="article_id")Integer article_id){	   		   
	   return  articlememberService.selectmessage(article_id);
	//	    null;
	   }
	   //文章所有留言查詢-------------------------------
	   @PostMapping(path="/selectmessage")
	   @ResponseBody    
	   public  List<Articlememberin> selectmaessage(){
		   System.out.println("有使用到---文章所有留言查詢---------------");
		   return  articlememberService.selectmessageall();
		   //	    null;
	   }
	   //留言喜歡
	   @PostMapping(path="golikearticlemessage/{article_id}/{member_name}/{idam}")
		// @ResponseBody
	   public String likemembermessage(
				  @PathVariable(name ="article_id") Integer article_id,
				  @PathVariable(name ="member_name") String member_name,
				  @PathVariable(name ="idam") Integer idam
					) {
		 System.out.println(member_name+article_id);
		 List<String> searchmembermessageLike = (List<String>)articlememberService.searchmembermessageLike(article_id, member_name,idam);
		 System.out.println(searchmembermessageLike);
      System.out.println("---------------------------------------");
	   //如果名稱與文章編號是空的 就讓他+1
	    if (searchmembermessageLike.isEmpty()) {
	    	System.out.println("該留言帳號沒有按過讚喔");
	    	articlememberService.addarticlememberLike(article_id, member_name,idam);

	    	articlememberService.plusarticlememberLike(idam);
	    	return "redirect:/inhouse/article/articleView/"+article_id+"";
	    }
	    System.out.println("裡面有東西");
			    System.out.println(article_id);
		    return null;

		   } 
	   
	   
}