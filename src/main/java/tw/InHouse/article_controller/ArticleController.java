package tw.InHouse.article_controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.InHouse.article_model.Article;
import tw.InHouse.article_model.ArticleService;
import tw.InHouse.article_model.ArticlememberService;
import tw.InHouse.article_model.Articlememberin;


@Controller
@RequestMapping(path="/backend/article")
@SessionAttributes(names = {"theColumnBean"})
public class ArticleController {
	   @Autowired
       public ArticleService articleService;	   
	   @Autowired
	   public ArticlememberService articlememberService;
	   


       @GetMapping(path="/articlequeryAction.controller")
       public String processQueryAction() {
    	   return "article/AllArticle";
       }

       @PostMapping(path="/all")
	   @ResponseBody
	   public List<Article> Listarticle(){
		   return articleService.findAllArticle();
	   }

       
	   @PostMapping(path="/query/{article_id}")
	   @ResponseBody
	   public Article processActionQuery(@PathVariable(name ="article_id") int article_id) {
		   return articleService.findById(article_id);
	   }
	   
	   @PostMapping(path="/add")
	   @ResponseBody
	   public Article processActionAdd(
			   String article_title,
			   String article_type,
			   String article,
			   String article_like,
			   String article_time,
			   String article_image,MultipartFile file)throws Exception {
		   Article a=new Article();
		 //  article_like="0";
           a.setArticle_title(article_title);
           a.setArticle_type(article_type);
           a.setArticle(article);
           a.setArticle_like(0);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss");
			String tp = sdf.format(new Date());
			a.setArticle_time(tp);
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
		   
		   a.setArticle_image("/images/"+"article"+"/"+fileName);
		   }
		   return articleService.insertArticle(a);
	   }
	   
	   @PostMapping(path="/update/{id}")
	   @ResponseBody
	   public Article processActionUpdate(
			   String article_id_edit,
			   String article_title_edit,
			   String article_like_edit,
			   String article_type_edit,
			   String article_edit,
			   String article_time_edit,
			   String article_image_edit,MultipartFile file_edit)throws Exception {
		   Article a=new Article();
		   
          // a.setArticle_id(Integer.parseInt(article_id));
           a.setArticle_id(Integer.parseInt(article_id_edit));
           a.setArticle_title(article_title_edit);
           a.setArticle_type(article_type_edit);
           a.setArticle(article_edit);
           a.setArticle_like(Integer.parseInt(article_like_edit));
           a.setArticle_image(article_image_edit);
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH:mm:ss");
		   String tp = sdf.format(new Date());
			a.setArticle_time(tp);
		   if(!file_edit.isEmpty()) {
		   String fileName = file_edit.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file_edit.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   a.setArticle_image("/images/"+"article"+"/"+fileName);
		   
		   }
		
		   
		   return articleService.updateArticle(a);
		   
	   }
	   
	   @PostMapping(path="/delete/{article_id}")
	   @ResponseBody                  
	   public void processActionDelete(@PathVariable(name ="article_id") Integer article_id){
		   
		   articleService.deleteArticle(article_id);
	   }
	    
	   //文章個別留言查詢-------------------------------
	   @PostMapping(path="/selectmessage/{article_id}")
	   @ResponseBody    
	   public  List<Articlememberin> selectmessage(@PathVariable(name="article_id")Integer article_id){
		   System.out.println("有使用到--文章個別留言查詢----------------");   
		   System.out.println("該文章的ID:"+article_id);   
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
	 //--------------刪一個----------------------------------------------  
	   @PostMapping(path="/deletemessageone/{idam}")
	   @ResponseBody      
	   public void processActionDeletetomessage(
//			   @PathVariable(name ="article_id") Integer article_id
//			   ,
			   @PathVariable(name ="idam") Integer idam
	//		   ,@RequestParam(name ="member_name",required=false) String member_name
//			   ,@PathVariable(name ="member_name",required=false) String member_name
			   
			   ){
		//   System.out.println("刪除的文章ID:"+article_id);
     	   System.out.println("刪除的編號ID:"+idam);
//		   articlememberService.deleteArticlemember(article_id,member_name);
		  articlememberService.deletemessageone(idam);
	   }
	   
	   //------------------------------------------------------------  
	   @PostMapping(path="/queryAllByPage/{pageNo}")
	   @ResponseBody
	   public List<Article> processActionByPage(@PathVariable(name ="pageNo")int pageNo,Model m){
		   int pageSize=7;
		   Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		   Page<Article> page = articleService.findAllByPage(pageable);
		   m.addAttribute("totalPages",page.getTotalPages());
		   m.addAttribute("totalElements",page.getTotalElements());
		   return page.getContent();
	   }
	   
	   public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/article";
	   
}
