package tw.InHouse.designer_model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.InHouse.portfolio_model.PortfolioRepository;

@Service
@Transactional
public class DesignerService {
	@Autowired
	private DesignerRepository designerRepository;
	@Autowired
	private PortfolioRepository portfolioRepository;
	public Designer findByDesigner_id(int designer_id) {
		 Optional<Designer> optional = designerRepository.findById(designer_id);
		    if(optional.isPresent()) {
		    	return optional.get();
		    }
		    return null;
		}
	
	public List<Designer> findAll() {
    	return designerRepository.findAll();
    
	} 
	
	public Designer insertDesigner(Designer designer) {
	    	return designerRepository.save(designer);
    }
    
    public Designer updateDesigner(Designer designer) {
    	return designerRepository.save(designer);
    }
    
    public void deleteByDesigner_id(int designer_id) {
    	System.out.println("---刪除portfolio---"+designer_id);
    	portfolioRepository.godeleteportfolio(designer_id);
    	designerRepository.deleteById(designer_id);
    }
	
	
	
}
