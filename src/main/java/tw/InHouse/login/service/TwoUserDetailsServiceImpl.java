package tw.InHouse.login.service;
 
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.InHouse.login.dao.MemberDao;
import tw.InHouse.member_model.Member;


 
@Service
public class TwoUserDetailsServiceImpl implements UserDetailsService {
 
    @Autowired
    private MemberDao memberdao;
 
    
    @Override
    public UserDetails loadUserByUsername(String member_name) throws UsernameNotFoundException {
        Member member = this.memberdao.findUserAccount(member_name);
 
        if (member == null) {
            System.out.println("User not found! " + member_name);
        }
 
        System.out.println("Found User: " + member);
 
        UserDetails userDetails = (UserDetails) new User(member.getMember_name(),
        		member.getMember_password(), Collections.emptyList());
 
        return userDetails;
    }
 
}