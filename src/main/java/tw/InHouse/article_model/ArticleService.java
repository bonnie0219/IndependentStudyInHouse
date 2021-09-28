package tw.InHouse.article_model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleService {
 
	@Autowired
	private ArticlememberRepository articlememberRepository;
    
	@Autowired
	private ArticleRepository articleRepository;
	//找到ID顯示欄位
	public Article findById(Integer article_id) {

		Optional<Article> aRep = articleRepository.findById(article_id);
		if (aRep.isPresent()) {
			return aRep.get();
		}
		return null;
	}
	
	//顯示全部
	public List<Article> findAllArticle() {
		System.out.println("dofindAll");
		return articleRepository.findAll();
	}

	//顯示全部 article_type1
		public List<Article> findListTitle1() {
			System.out.println("dofindListTitle1");
			return articleRepository.findListTitle1();
		}
	//顯示全部 article_type2
		public List<Article> findListTitle2() {
			System.out.println("dofindListTitle2");
			return articleRepository.findListTitle2();
		}
	//頁面
	public Page<Article> findAllByPage(Pageable pageable) {
		System.out.println("dofindpage");
		return articleRepository.findAll(pageable);
	}
	
	//新增
	public Article insertArticle(Article a) {
		   System.out.println("~~~~------------------------------~~~");

		return articleRepository.save(a);
	}
	//修改
	public Article updateArticle(Article a) {
		   System.out.println("11111111111111-----------------------------~~~");

		return articleRepository.save(a);
	}
	//刪除
	public void deleteArticle(Integer article_id) {
		System.out.println("---刪除喜歡文章---");
		articleRepository.deletememberLike(article_id);
		articleRepository.deleteAticleLike(article_id);
		System.out.println("---刪除message and messagelike---");
		articlememberRepository.deletemessageoneinarticleid(article_id);
		System.out.println("---刪除文章---");
		articleRepository.deleteById(article_id);
	}
	//模糊查詢
	public List<Article> findByArticle(String a) {

		return articleRepository.findByArticleLike(a);
	}
	//找單一文章測試
	public List<Article> findByArticleid(Integer article_id) {
		System.out.println("findByArticleid one");
		return articleRepository.findByArticleid(article_id);
	}
	//前三名喜歡的文章
	public List<Article> findByTop3() {
		   System.out.println("findByTop3 article_like");
		return articleRepository.findByTop3();
	}
	//找前文章測試
		public List<Article> findPrevious(Integer article_id) {
			System.out.println("findPrevious one");
			return articleRepository.findPrevious(article_id);
	}
		//找下一文章測試
			public List<Article> findNext(Integer article_id) {
			System.out.println("findNext one");
			return articleRepository.findNext(article_id);
	}
		//搜尋該文章是否已按過Like
			public List<String> searchmemberLike(Integer article_id,String member_name) {
				 System.out.println("do searchmemberLike article_id="+article_id+",name="+member_name);	
			return articleRepository.searchmemberLike(article_id,member_name);
				
			}
		//	帳號對上文章
		 public void addLike(Integer article_id,String member_name) {
			 System.out.println("do addlike article_id="+article_id+",name="+member_name);
			 articleRepository.addLike(article_id,member_name);
		 }
		 //單純文章LIKE+1
		 public void pluslike(Integer article_id){
			 System.out.println("do pluslike article_id="+article_id);
			 articleRepository.plusLike(article_id);
		 
		 }
		 

}
