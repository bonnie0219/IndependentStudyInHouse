package tw.InHouse.article_model;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface ArticlememberRepository extends JpaRepository<Articlememberin, Integer>{
	@Modifying
	@Query(value=" select * from member_article_in where article_id=?1 ORDER BY articlemember_like DESC",nativeQuery = true)
	public List<Articlememberin> findArticlememberin(Integer article_id);
	@Modifying
	@Query(value="delete from member_article_in where idam=?1 and member_name=?2",nativeQuery = true)
	public void deleteAticlemember(Integer article_id,String member_name);
	@Modifying
	@Query(value=" select * from member_article_in where article_id=?1",nativeQuery = true)
	public List<Articlememberin> selectmessage(Integer article_id);
	@Modifying
	@Query(value="delete from member_article_in where idam=?1",nativeQuery = true)
	public void deletemessageone(Integer article_id);	
	@Modifying
	@Query(value="delete from member_article_in_like where idam=?1",nativeQuery = true)
	public void deletemessageonein(Integer article_id);
	@Modifying
	@Query(value="delete from member_article_in_like where article_id=?1",nativeQuery = true)
	public void deletemessageoneinarticleid(Integer article_id);
	@Query(value="select idam,member_name from member_article_in_like where article_id=?1 AND member_name=?2 AND idam=?3",nativeQuery = true)
	public List<String> searchmembermessageLike(Integer article_id,String member_name,Integer idam);
	@Modifying
	@Query(value="insert into member_article_in_like(article_id,member_name,idam)Values(?1,?2,?3);",nativeQuery = true)
	public void addarticlememberLike(Integer article_id,String member_name,Integer idam);
	@Modifying
	@Query(value=" SET NOCOUNT ON; update member_article_in set articlemember_like = articlemember_like +1 where idam= ?1 ",nativeQuery = true)
	public void plusarticlememberLike(Integer idam);
}
