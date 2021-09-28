package tw.InHouse.portfolio_model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import tw.InHouse.article_model.Article;
import tw.InHouse.article_model.Articlememberin;

public interface PortfolioRepository extends JpaRepository<Portfolio, Integer>{

	@Query(value="from Portfolio where portfolio_id=?1")
	public List<Portfolio> findByPortfolioid(Integer article_id);
    @Query(value="Select TOP 3 * from portfolio  order by  portfolio_like desc",nativeQuery = true)
	public List<Portfolio> findByTop3();
	@Query(value="Select Top 1 * From portfolio Where portfolio_id <?1 Order By portfolio_id Desc",nativeQuery = true)
	public List<Portfolio> findPrevious(Integer article_id);	
	@Query(value="Select Top 1 * From portfolio Where portfolio_id >?1 Order By portfolio_id",nativeQuery = true)
	public List<Portfolio> findNext(Integer article_id);
	@Modifying
	@Query(value=" delete from portfolio where designer_id=?1 ",nativeQuery = true)
	public void godeleteportfolio(Integer designer_id);
	
	@Query(value="select portfolio_id,member_name from member_portfolio where portfolio_id=?1 AND member_name=?2",nativeQuery = true)
	public List<String> searchmemberportfoiloLike(Integer article_id,String member_name);
	@Modifying
	@Query(value="insert into member_portfolio(portfolio_id,member_name)Values(?1,?2);",nativeQuery = true)
	public void portfoiloaddLike(Integer article_id,String member_name);
	@Modifying
	@Query(value=" SET NOCOUNT ON; update portfolio set portfolio_like = portfolio_like +1 where portfolio_id= ?1 ",nativeQuery = true)
	public void portfoiloplusLike(Integer article_id);
	@Modifying
	@Query(value=" delete from member_portfolio where portfolio_id=?1 ",nativeQuery = true)
	public void deletePortfolioLike(Integer article_id);
	@Modifying
	@Query(value=" delete from member_portfolio_in where portfolio_id=?1 ",nativeQuery = true)
	public void deletememberLike(Integer article_id);
	@Modifying
	@Query(value="  Select * From portfolio Where designer_id=?1 ",nativeQuery = true)
	public List<Portfolio> findPortfolioByDesigner_id(int designer_id);
	
}
