package tw.InHouse.member_model;

import org.springframework.data.domain.Pageable;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
    private MemberRepository memberRepository;
    
	public Member findByMember_id(int member_id) {
	    Optional<Member> optional = memberRepository.findById(member_id);
	    if(optional.isPresent()) {
	    	return optional.get();
	    }
	    return null;
	}
	
    public List<Member> findAll() {
    	return memberRepository.findAll();
    
	} 
    
    public Page<Member> findAllByPage(Pageable pageable){
    	return memberRepository.findAll(pageable);
    }
    
    public Member insertMember(Member member) {
    	return memberRepository.save(member);
    }
    
    public Member updateMember(Member member) {
    	return memberRepository.save(member);
    }
    
    public void deleteByMmeber_id(int member_id) {
        memberRepository.deleteById(member_id);
    }
}
