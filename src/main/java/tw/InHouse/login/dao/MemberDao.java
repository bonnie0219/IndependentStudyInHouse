package tw.InHouse.login.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.InHouse.member_model.Member;

@Repository
@Transactional
public class MemberDao {

    @Autowired
    private EntityManager entityManager;
 
    public Member findUserAccount(String member_name) {
        try {
            String sql = "Select e from " + Member.class.getName() + " e " //
                    + " Where e.member_name = :member_name ";
 
            Query query = entityManager.createQuery(sql, Member.class);
            query.setParameter("member_name", member_name);
 
            return (Member) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    
    public Member findMemberByMember_id(int member_id) {
        try {
            String sql = "Select e from " + Member.class.getName() + " e " //
                    + " Where e.member_id = :member_id ";
  
            Query query = entityManager.createQuery(sql, Member.class);
            query.setParameter("member_id", member_id);
  
            return (Member) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    
    public Member findMemberByMember_name(String member_name) {
        try {
            String sql = "Select e from " + Member.class.getName() + " e " //
                    + " Where e.member_name = :member_name ";
  
            Query query = entityManager.createQuery(sql, Member.class);
            query.setParameter("member_name", member_name);
  
            return (Member) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
 
    public Member findByMember_email(String member_email) {
        try {
            String sql = "Select e from " + Member.class.getName() + " e " //
                    + " Where e.member_email = :member_email ";
  
            Query query = entityManager.createQuery(sql, Member.class);
            query.setParameter("member_email", member_email);
  
            return (Member) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
