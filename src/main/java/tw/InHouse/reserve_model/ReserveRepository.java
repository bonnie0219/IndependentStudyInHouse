package tw.InHouse.reserve_model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReserveRepository extends JpaRepository<Reserve, Integer> {

	@Query(value = "Select * from reserve where reserve_memberid=?1", nativeQuery = true)
	public List<Reserve> findByreserve_memberid(Integer reserve_memberid);

	@Query(value = "Select * from reserve where reserve_membername=?1", nativeQuery = true)
	public List<Reserve> findByreserve_membername(String membername);
}
