package tw.InHouse.reserve_model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberRepository;






@Service
public class ReserveService {
	
	
	@Autowired
	private ReserveRepository reserveRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	public Reserve findById(Integer id) {
		Optional<Reserve> pRep = reserveRepository.findById(id);
		
		//判斷是否存在
		if(pRep.isPresent()) {
			return pRep.get();
		}
		
		return null;
	}
	
	public List<Reserve> findAll(){
		return reserveRepository.findAll();
	}
	
	public Page<Reserve> findAllByPage(Pageable pageable){
		return reserveRepository.findAll(pageable);
	}
	
	public Reserve insertReserve(Reserve r) {
		
	//			Member member = memberRepository.getById(2);
		
	
	 Member member = memberRepository.getById(r.getReserve_memberid().getMember_id());
		r.setReserve_memberid(member);
		return reserveRepository.save(r);
	}
	
	public Reserve updateReserve(Reserve r) {
		return reserveRepository.save(r);
	}
	
//	public void deleteReserve(Reserve r) {
//		reserveRepository.delete(r);
//	}
	
	 public void saveReserve(Reserve reserve) {
		 reserveRepository.save(reserve);
	    }
	
	public Reserve getReserve(Integer id) {
		return reserveRepository.findById(id).get();
	}
	
	public void deleteReserve(Integer id) {
		reserveRepository.deleteById(id);
	}
	
    
    public List<Reserve> findByMemberid(Integer reserve_memberid){
            return reserveRepository.findByreserve_memberid(reserve_memberid);
    }
    
    public List<Reserve> findByMembername(String membername){
        return reserveRepository.findByreserve_membername(membername);
}
    


	
}
