package tw.InHouse.portfolio_model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface PortfoliomemberRepository extends JpaRepository<Portfoliomemberin, Integer>{

	@Query(value=" select * from member_portfolio_in where portfolio_id=?1 ORDER BY portfoliomember_like DESC",nativeQuery = true)
	public List<Portfoliomemberin> findPortfoliomemberin(Integer article_id);
	@Query(value="select idpm,member_name from member_portfolio_in_like where portfolio_id=?1 AND member_name=?2 AND idpm=?3",nativeQuery = true)
	public List<String> searchmembermessageLike(Integer portfolio_id,String member_name,Integer idpm);
	@Modifying
	@Query(value="insert into member_portfolio_in_like(portfolio_id,member_name,idpm)Values(?1,?2,?3);",nativeQuery = true)
	public void addportfoliomemberLike(Integer portfolio_id,String member_name,Integer idpm);
	@Modifying
	@Query(value=" SET NOCOUNT ON; update member_portfolio_in set portfoliomember_like = portfoliomember_like +1 where idpm= ?1 ",nativeQuery = true)
	public void plusportfoliomemberLike(Integer idpm);
	@Modifying
	@Query(value="delete from member_portfolio_in where idpm=?1 and member_name=?2",nativeQuery = true)
	public void deletePortfoliomember(Integer portfolio_id,String member_name);
	@Modifying
	@Query(value=" select * from member_portfolio_in where portfolio_id=?1",nativeQuery = true)
	public List<Portfoliomemberin> selectmessage(Integer portfolio_id);
	@Modifying
	@Query(value="delete from member_portfolio_in where idpm=?1",nativeQuery = true)
	public void deletemessageone(Integer portfolio_id);	
	@Modifying
	@Query(value="delete from member_portfolio_in_like where idpm=?1",nativeQuery = true)
	public void deletemessageonein(Integer portfolio_id);
	@Modifying
	@Query(value="delete from member_portfolio_in_like where portfolio_id=?1",nativeQuery = true)
	public void deletemessageoneinportfolioid(Integer portfolio_id);
}
