package tw.InHouse.designer_controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import tw.InHouse.designer_model.Designer;
import tw.InHouse.designer_model.DesignerService;


@Controller
@RequestMapping(path="/backend/designer")
public class DesignerController {
	   @Autowired
	   private DesignerService designerService;
	
	   @GetMapping(path="/designerqueryAction.controller")
       public String processQueryAction() {
    	   return "designer/AllDesigner";
       }
	   
	   @PostMapping(path="/queryAll")
	   @ResponseBody
	   public List<Designer> processActionQueryAll(){
		   return designerService.findAll();
	   }
	
	   @PostMapping(path="/add")
	   @ResponseBody
	   public Designer processActionAdd(String  designer_name,String designer_phone,String designer_email,String designer_style,String designer_location,String designer_photo,MultipartFile file)throws Exception {

		   Designer designer=new Designer();
		   designer.setDesigner_name(designer_name);
		   designer.setDesigner_phone(designer_phone);
		   designer.setDesigner_email(designer_email);
		   designer.setDesigner_style(designer_style);
		   designer.setDesigner_location(designer_location);
		   designer.setDesigner_photo(designer_photo);
		   
		   
		   System.out.println("~~~~~~~");
		   System.out.println(designer);
		   if(!file.isEmpty()) {
		   String fileName = file.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   designer.setDesigner_photo("/"+"designer"+"/"+fileName);
		   }
		   return designerService.insertDesigner(designer);
	   }
	   
	   @PostMapping(path="/update")
	   @ResponseBody
	   public Designer processActionUpdate(String designer_id_edit,String designer_name_edit,String designer_phone_edit,String designer_email_edit,String designer_style_edit,String designer_location_edit,String designer_photo_edit,MultipartFile file_edit)throws Exception {

		   Designer designer=new Designer();
		   designer.setDesigner_id(Integer.valueOf(designer_id_edit));
		   designer.setDesigner_name(designer_name_edit);
		   designer.setDesigner_phone(designer_phone_edit);
		   designer.setDesigner_email(designer_email_edit);
		   designer.setDesigner_style(designer_style_edit);
		   designer.setDesigner_location(designer_location_edit);
		   designer.setDesigner_photo(designer_photo_edit);
		   
		   
		   System.out.println("~~~~~~~");
		   System.out.println(designer);
		   if(!file_edit.isEmpty()) {
		   String fileName = file_edit.getOriginalFilename();
		   System.out.println("fileName:" + fileName);
		   String saveDirPath = uploadDirectory;
		   File savefileDir = new File(saveDirPath);
		   savefileDir.mkdirs();
		   File saveFilePath = new File(savefileDir, fileName);
		   file_edit.transferTo(saveFilePath);
		   System.out.println("saveFilePath:" + saveFilePath);
		   
		   designer.setDesigner_photo("/"+"designer"+"/"+fileName);
		   }
		   return designerService.updateDesigner(designer);
	   }
	   
	   @PostMapping(path="/query/{designer_id}")
	   @ResponseBody
	   public Designer processActionQuery(@PathVariable(name ="designer_id") int designer_id) {
		   return designerService.findByDesigner_id(designer_id);
	   }
	   
	   @PostMapping(path="/delete/{designer_id}")
	   @ResponseBody                  
	   public void processActionDelete(@PathVariable(name ="designer_id") int designer_id){
		   designerService.deleteByDesigner_id(designer_id);
	   }
	   
	   public static String uploadDirectory = System.getProperty("user.dir") + "/src/main/resources/static/images/designer";

}
