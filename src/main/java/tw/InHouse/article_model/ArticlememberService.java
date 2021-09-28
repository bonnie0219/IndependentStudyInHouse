package tw.InHouse.article_model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticlememberService {

	
	@Autowired
	private ArticlememberRepository articlememberRepository;
	//找到ID顯示欄位
	public Articlememberin findById(Integer article_id) {

		Optional<Articlememberin> aRep = articlememberRepository.findById(article_id);
		if (aRep.isPresent()) {
			return aRep.get();
		}
		return null;
	}
	//新增
	public Articlememberin insertArticlemember(Articlememberin ami) {
		   System.out.println("---------儲存留言-------------");

		return articlememberRepository.save(ami);
	}
	public void deletemessageone(Integer article_id) {
		System.out.println("---------刪除留言-------------");
		
		articlememberRepository.deletemessageonein(article_id);
		articlememberRepository.deletemessageone(article_id);
	}
	
	public List<Articlememberin> findArticlememberin(Integer article_id){
		
		return articlememberRepository.findArticlememberin(article_id);
	}
	public void deleteArticlemember(Integer article_id,String member_name) {
		System.out.println("---刪除文章---");
		System.out.println(article_id);
		System.out.println(member_name);
		articlememberRepository.deletemessageoneinarticleid(article_id);
		articlememberRepository.deletemessageone(article_id);
		articlememberRepository.deleteAticlemember(article_id,member_name);
	}
	public List<Articlememberin> selectmessage(Integer article_id){
		
		return articlememberRepository.selectmessage(article_id);
	}
	public List<Articlememberin> selectmessageall(){
		
		return articlememberRepository.findAll();
	}
	//搜尋該文章是否已按過Like
	public List<String> searchmembermessageLike(Integer article_id,String member_name,Integer idam) {
		 System.out.println("do searchmemberLike article_id="+article_id+",name="+member_name+"idam留言號碼:"+idam);	
	return articlememberRepository.searchmembermessageLike(article_id,member_name,idam);		
	}
	//帳號對上文章留言
	public void addarticlememberLike(Integer article_id,String member_name,Integer idam) {
		articlememberRepository.addarticlememberLike(article_id,member_name,idam);
	}
	public void plusarticlememberLike(Integer idam) {
		articlememberRepository.plusarticlememberLike(idam);
	}
}
////帳號對上文章
//	 public void addLike(Integer article_id,String member_name) {
//		 System.out.println("do addlike article_id="+article_id+",name="+member_name);
//		 articleRepository.addLike(article_id,member_name);
//	 }
//	 //單純文章LIKE+1
//	 public void pluslike(Integer article_id){
//		 System.out.println("do pluslike article_id="+article_id);
//		 articleRepository.plusLike(article_id);
//	 
//	 }
