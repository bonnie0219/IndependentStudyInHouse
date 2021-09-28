package tw.InHouse.login.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

public class MemberLoginFilter extends UsernamePasswordAuthenticationFilter {
       public MemberLoginFilter(String loginURL,String httpMethod) {
    	   setUsernameParameter("username");
    	   super.setRequiresAuthenticationRequestMatcher(new AntPathRequestMatcher(loginURL, httpMethod));
       }

	@Override
	public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
			throws AuthenticationException {
		String recaptchaFormResponse = request.getParameter("g-recaptcha-response");
        System.out.println("Before processing authentication...");
        ReCaptchaV3Handler handler = new ReCaptchaV3Handler();
        float score = handler.verify(recaptchaFormResponse);
        
        if(score < 0.5) {
        	
				try {
					response.sendRedirect("/inhouse/login?error=true");
					return null;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
        }
        
		return super.attemptAuthentication(request, response);
	}
       
       
}
