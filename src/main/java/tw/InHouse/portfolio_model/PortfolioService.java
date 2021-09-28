package tw.InHouse.portfolio_model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.InHouse.article_model.Article;
import tw.InHouse.article_model.ArticlememberRepository;
import tw.InHouse.article_model.Articlememberin;

@Service
@Transactional
public class PortfolioService {
	@Autowired
	private PortfolioRepository portfolioRepository;
	@Autowired
	private PortfoliomemberRepository portfoliomemberRepository;

	public Portfolio findById(Integer portfolio_id) {

		Optional<Portfolio> aRep = portfolioRepository.findById(portfolio_id);
		if (aRep.isPresent()) {
			return aRep.get();
		}
		return null;
	}

	// 顯示全部--
	public List<Portfolio> findAllPortfolio() {
		System.out.println("--dofindAllPortfolio--");
		return portfolioRepository.findAll();
	}

	public Portfolio insertPortfolio(Portfolio p) {
		System.out.println("~~~~------------------------------~~~");

		return portfolioRepository.save(p);
	}

	public Portfolio updatePortfolio(Portfolio p) {
		System.out.println("11111111111111-----------------------------~~~");

		return portfolioRepository.save(p);
	}

	public void deletePortfolio(Integer article_id) {
		System.out.println("---刪除喜歡文章---");
		portfolioRepository.deletememberLike(article_id);
		portfolioRepository.deletePortfolioLike(article_id);
		System.out.println("---刪除message and messagelike---");
		portfoliomemberRepository.deletemessageoneinportfolioid(article_id);
		System.out.println("---刪除文章---");
		portfolioRepository.deleteById(article_id);
	}

	// 找單一文章測試
	public List<Portfolio> findByPortfolioid(Integer article_id) {
		System.out.println("findByArticleid one");
		return portfolioRepository.findByPortfolioid(article_id);
	}

	// -------------------------------
	// 前三名喜歡的文章
	public List<Portfolio> findByTop3() {
		System.out.println("findByTop3 article_like");
		return portfolioRepository.findByTop3();
	}

	// 找前文章測試
	public List<Portfolio> findPrevious(Integer article_id) {
		System.out.println("findPrevious one");
		return portfolioRepository.findPrevious(article_id);
	}

	// 找下一文章測試
	public List<Portfolio> findNext(Integer article_id) {
		System.out.println("findNext one");
		return portfolioRepository.findNext(article_id);
	}

	// 搜尋該文章是否已按過Like
	public List<String> searchmemberportfoiloLike(Integer article_id, String member_name) {
		System.out.println("do searchmemberportfolioLike article_id=" + article_id + ",name=" + member_name);
		return portfolioRepository.searchmemberportfoiloLike(article_id, member_name);
	}

//				帳號對上作品集
	public void portfoiloaddLike(Integer article_id, String member_name) {
		System.out.println("do portfoiloaddlike portfoilo_id=" + article_id + ",name=" + member_name);
		portfolioRepository.portfoiloaddLike(article_id, member_name);
	}

	// 單純作品集LIKE+1
	public void portfoilopluslike(Integer article_id) {
		System.out.println("do pluslike article_id=" + article_id);
		portfolioRepository.portfoiloplusLike(article_id);

	}

	public Portfoliomemberin insertPortfoliomember(Portfoliomemberin pmi) {
		System.out.println("---------儲存留言-------------");

		return portfoliomemberRepository.save(pmi);
	}

	public List<Portfoliomemberin> findPortfoliomemberin(Integer portfolio_id) {

		return portfoliomemberRepository.findPortfoliomemberin(portfolio_id);
	}
	//搜尋該文章是否已按過Like
		public List<String> searchmembermessageLike(Integer portfolio_id,String member_name,Integer idpm) {
			 System.out.println("do searchmemberLike article_id="+portfolio_id+",name="+member_name+"idpm留言號碼:"+idpm);	
		return portfoliomemberRepository.searchmembermessageLike(portfolio_id,member_name,idpm);		
		}
		//帳號對上文章留言
		public void addPortfoliomemberLike(Integer portfolio_id,String member_name,Integer idpm) {
			portfoliomemberRepository.addportfoliomemberLike(portfolio_id,member_name,idpm);
		}
		public void plusPortfoliomemberLike(Integer idpm) {
			portfoliomemberRepository.plusportfoliomemberLike(idpm);
		}
		//留言區 帳號對上留言
		public void deletePortfoliomember(Integer portfolio_id,String member_name) {
			System.out.println("---刪除文章---");
			System.out.println(portfolio_id);
			System.out.println(member_name);
			portfoliomemberRepository.deletePortfoliomember(portfolio_id,member_name);
		}
		
		public void deletemessageone(Integer article_id) {
			System.out.println("---------刪除留言-------------");
			
			portfoliomemberRepository.deletemessageonein(article_id);
			portfoliomemberRepository.deletemessageone(article_id);
		}
		public List<Portfoliomemberin> selectmessage(Integer article_id){
			
			return portfoliomemberRepository.selectmessage(article_id);
		}
		public List<Portfoliomemberin> selectmessageall(){
			
			return portfoliomemberRepository.findAll();
		}

		public List<Portfolio> findPortfolioByDesigner_id(int designer_id) {
			
			return portfolioRepository.findPortfolioByDesigner_id(designer_id);
		}
		
}
