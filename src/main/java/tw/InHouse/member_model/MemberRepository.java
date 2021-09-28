package tw.InHouse.member_model;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



 
public interface MemberRepository extends JpaRepository<Member, Integer> {
	   
	   @Query(value = "Select * From member where member_name = ?1", nativeQuery = true)
	   public Optional<Member> findByMember_name(String member_name);
	
	

}
