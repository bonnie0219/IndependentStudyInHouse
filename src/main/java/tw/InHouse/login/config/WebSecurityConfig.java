package tw.InHouse.login.config;


 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import tw.InHouse.login.controller.MemberLoginFilter;
import tw.InHouse.login.service.OneUserDetailsServiceImpl;
import tw.InHouse.login.service.TwoUserDetailsServiceImpl;



@Configuration
@EnableWebSecurity
public  class WebSecurityConfig {
		
	
	    @Configuration
		@Order(1)
		public static class OneWebSecurityConfig extends WebSecurityConfigurerAdapter {
		 
		    @Autowired
		    private OneUserDetailsServiceImpl oneuserDetailsService;
		 
		    @Autowired
		    private DataSource dataSource;
		 
		    @Bean
		    public BCryptPasswordEncoder passwordEncoder1() {
		        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		        return bCryptPasswordEncoder;
		    }
		 
		    @Override
		    public void configure(AuthenticationManagerBuilder auth) throws Exception {
		 
		        // Setting Service to find User in the database.
		        // And Setting PassswordEncoder
		        auth.userDetailsService(oneuserDetailsService).passwordEncoder(passwordEncoder1());
		             //处理自动登录逻辑
		    }
		 
		    @Override
		    protected void configure(HttpSecurity http) throws Exception {
		  
		    	http.csrf().disable();
				
		        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
		             		 
		        http
                .antMatcher("/backend/**")
                .authorizeRequests()
                .antMatchers("/backend/login", "/backend/logout").permitAll()
                .antMatchers("/backend/product/**","/backend/shopcart/**","/backend/member/**","/backend/designer/**","/backend/portfolio/**","/backend/allecharts","/backend/message","/backend/reserve/**","/backend/coupon/**","/backend/article/**").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
		        .antMatchers("/backend/employee/**").access("hasRole('ROLE_ADMIN')")
                .anyRequest().authenticated()
                .and().formLogin().loginPage("/backend/login")//指定登录页的路径
                .loginProcessingUrl("/backend/home")
                .defaultSuccessUrl("/backend/home",true)
                .failureUrl("/backend/login?error=true")
                .permitAll()
                .usernameParameter("username")
                .passwordParameter("password")
                .and().logout().logoutUrl("/backend/logout").logoutSuccessUrl("/backend/logoutBackendSuccessful");
		        
		         http.authorizeRequests().and() //
		         .rememberMe().tokenRepository(this.persistentTokenRepository1())//配置token持久化倉庫
		         .tokenValiditySeconds(1 * 24 * 60 * 60); //24h
		        
		    }
		 
		    @Bean
		    public PersistentTokenRepository persistentTokenRepository1() {
		        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
		        db.setDataSource(dataSource);
		        return db;
		    }
	    }
	    
	    @Configuration
		@Order(2)
		public static class TwoWebSecurityConfig extends WebSecurityConfigurerAdapter {
		 
		    @Autowired
		    private TwoUserDetailsServiceImpl twouserDetailsService;
		 
		    @Autowired
		    private DataSource dataSource;
		 
		    @Bean
		    public BCryptPasswordEncoder passwordEncoder2() {
		        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		        return bCryptPasswordEncoder;
		    }
		 
		    @Override
		    public void configure(AuthenticationManagerBuilder auth) throws Exception {
		 
		        // Setting Service to find User in the database.
		        // And Setting PassswordEncoder
		        auth.userDetailsService(twouserDetailsService).passwordEncoder(passwordEncoder2());
		             //处理自动登录逻辑
		    }
		 
		    @Override
		    protected void configure(HttpSecurity http) throws Exception {
		 
		        http.csrf().disable();
				   
		        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
		        
		        http
                .antMatcher("/inhouse/**")
                .authorizeRequests()
                .antMatchers("/inhouse/login", "/inhouse/logout","/inhouse/member/add","/inhouse/forgetpassword","/inhouse/homepage","/inhouse/shop/queryallbypage/**","/inhouse/portfolio/portfolioView/**","/inhouse/article/articleView/**","/inhouse/designer/**","/inhouse/activity","/inhouse/reserve/StoreCLI","/inhouse/reserve/StoreKEL","/inhouse/reserve/StoreTXG","/inhouse/reserve/StoreKHH","/inhouse/about","/inhouse/reserve/ServiceProcess","/inhouse/shop/findById/**","/inhouse/shop/findByName","/inhouse/shop/queryByHighPrice","/inhouse/shop/queryByLowPrice").permitAll()
                .antMatchers("/backend/**").access("hasRole('ROLE_USER')")
                .anyRequest().authenticated()
                
                .and()
                .addFilterBefore(getMemberLoginFilter(), MemberLoginFilter.class)
                .formLogin().loginPage("/inhouse/login")
                .loginProcessingUrl("/inhouse/home")
                .defaultSuccessUrl("/inhouse/home",true)
                .failureUrl("/inhouse/login?error=true")
                .permitAll()
                .usernameParameter("username")
                .passwordParameter("password")
                .and().logout().logoutUrl("/inhouse/logout").logoutSuccessUrl("/inhouse/logoutInHouseSuccessful");
		        
		        http.authorizeRequests().and()
		        .rememberMe().tokenRepository(this.persistentTokenRepository2())
		        .tokenValiditySeconds(1 * 24 * 60 * 60);
		        
		    }
		 
		    @Bean
		    public PersistentTokenRepository persistentTokenRepository2() {
		        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
		        db.setDataSource(dataSource);
		        return db;
		    }
		    
		    private MemberLoginFilter getMemberLoginFilter() throws Exception {
		    	MemberLoginFilter filter = new MemberLoginFilter("/inhouse/home","POST");
		    	filter.setAuthenticationManager(authenticationManager());
		    	filter.setAuthenticationFailureHandler(new AuthenticationFailureHandler() {
					
					@Override
					public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
							AuthenticationException exception) throws IOException, ServletException {
						response.sendRedirect("/inhouse/login?error=true");
						
					}
				});
		    	filter.setAuthenticationSuccessHandler(new AuthenticationSuccessHandler() {
					
					@Override
					public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
							Authentication authentication) throws IOException, ServletException {
						response.sendRedirect("/inhouse/home");
						
					}
				});
		    	return filter;
		    }
	  }
}
