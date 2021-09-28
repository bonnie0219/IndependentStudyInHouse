package tw.InHouse.article_model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ArticleRepository extends JpaRepository<Article, Integer> {
	//搜尋相應文章型態 先寫死
	@Query(value="from Article Order by article_id Desc ")
	public List<Article> findAlll();
	@Query(value="from Article where article_type like concat('客戶分享') Order by article_id Desc ")
	public List<Article> findListTitle1();
	@Query(value="from Article where article_type like concat('名人推薦') Order by article_id Desc ")
	public List<Article> findListTitle2();	
   @Query(value="from Article where article like concat('%',?1,'%') and article_title like concat('%',?1,'%')")
	public List<Article> findByArticleLike(String article);
	@Query(value="from Article where article_id=?1")
	public List<Article> findByArticleid(Integer article_id);
    @Query(value="Select TOP 3 * from Article  a order by  a.article_like desc",nativeQuery = true)
	public List<Article> findByTop3();
	@Query(value="Select Top 1 * From article Where article_id <?1 Order By article_id Desc",nativeQuery = true)
	public List<Article> findPrevious(Integer article_id);	
	@Query(value="Select Top 1 * From article Where article_id >?1 Order By article_id",nativeQuery = true)
	public List<Article> findNext(Integer article_id);	
	@Query(value="select article_id,member_name from member_article where article_id=?1 AND member_name=?2",nativeQuery = true)
	public List<String> searchmemberLike(Integer article_id,String member_name);
	@Modifying
	@Query(value="insert into member_article(article_id,member_name)Values(?1,?2);",nativeQuery = true)
	public void addLike(Integer article_id,String member_name);
	@Modifying
	@Query(value=" SET NOCOUNT ON; update article set article_like = article_like +1 where article_id= ?1 ",nativeQuery = true)
	public void plusLike(Integer article_id);
	@Modifying
	@Query(value=" delete from member_article where article_id=?1 ",nativeQuery = true)
	public void deleteAticleLike(Integer article_id);
	@Modifying
	@Query(value=" delete from member_article_in where article_id=?1 ",nativeQuery = true)
	public void deletememberLike(Integer article_id);
//	public List<Article> listAll();
}
