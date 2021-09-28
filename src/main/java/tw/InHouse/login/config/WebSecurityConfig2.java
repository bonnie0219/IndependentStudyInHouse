//package tw.InHouse.login.config;
//
//
// 
//import javax.sql.DataSource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.core.annotation.Order;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
//import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
//
//import tw.InHouse.login.service.OneUserDetailsServiceImpl;
//import tw.InHouse.login.service.TwoUserDetailsServiceImpl;
//
//
//
//@Configuration
//@EnableWebSecurity
//public  class WebSecurityConfig2 {
//		
//	
//	    @Configuration
//		@Order(1)
//		public static class OneWebSecurityConfig extends WebSecurityConfigurerAdapter {
//		 
//		    @Autowired
//		    private OneUserDetailsServiceImpl oneuserDetailsService;
//		 
//		    @Autowired
//		    private DataSource dataSource;
//		 
//		    @Bean
//		    public BCryptPasswordEncoder passwordEncoder1() {
//		        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//		        return bCryptPasswordEncoder;
//		    }
//		 
//		    @Override
//		    public void configure(AuthenticationManagerBuilder auth) throws Exception {
//		 
//		        // Setting Service to find User in the database.
//		        // And Setting PassswordEncoder
//		        auth.userDetailsService(oneuserDetailsService).passwordEncoder(passwordEncoder1());
//		             //处理自动登录逻辑
//		    }
//		 
//		    @Override
//		    protected void configure(HttpSecurity http) throws Exception {
//		 
//		        http.csrf().disable();
//		 
//		        // The pages does not require login
//		        http.authorizeRequests().antMatchers("/backend/login", "/backend/logout").permitAll();
//		             //授權配置                                                //無須認證得請求路徑
//		        // /userInfo page requires login as ROLE_USER or ROLE_ADMIN.
//		        // If no login, it will redirect to /login page.
//		        http.authorizeRequests().antMatchers("/backend/product/**","/backend/order/**","/backend/member/**","/backend/reserve/**","/backend/coupon/**","/backend/article/**").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");
//		 
//		        // For ADMIN only.
//		        http.authorizeRequests().antMatchers("/backend/employee/**").access("hasRole('ROLE_ADMIN')");
//		 
//		        // When the user has logged in as XX.
//		        // But access a page that requires role YY,
//		        // AccessDeniedException will be thrown.
//		        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
//		             		 
//		        http
//                .antMatcher("/backend/home")
//                .authorizeRequests()
//                .anyRequest()
//                .authenticated()
//                .and()
//                .formLogin()//
//                .loginProcessingUrl("/backend/home")
//                .loginPage("/backend/login")// 指定登录页的路径
//                .defaultSuccessUrl("/backend/home")
//                .failureUrl("/backend/login?error=true")
//                .usernameParameter("username")
//                .passwordParameter("password")
//                .and().logout().logoutUrl("/backend/logout").logoutSuccessUrl("/backend/logoutBackendSuccessful");
//		        
//		        http.authorizeRequests().and() //
//		                .rememberMe().tokenRepository(this.persistentTokenRepository1())//配置token持久化倉庫
//		                .tokenValiditySeconds(1 * 24 * 60 * 60); //24h
//		    }
//		 
//		    @Bean
//		    public PersistentTokenRepository persistentTokenRepository1() {
//		        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
//		        db.setDataSource(dataSource);
//		        return db;
//		    }
//	    }
//	    
//	    @Configuration
//		@Order(2)
//		public static class TwoWebSecurityConfig extends WebSecurityConfigurerAdapter {
//		 
//		    @Autowired
//		    private TwoUserDetailsServiceImpl twouserDetailsService;
//		 
//		    @Autowired
//		    private DataSource dataSource;
//		 
//		    @Bean
//		    public BCryptPasswordEncoder passwordEncoder2() {
//		        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//		        return bCryptPasswordEncoder;
//		    }
//		 
//		    @Override
//		    public void configure(AuthenticationManagerBuilder auth) throws Exception {
//		 
//		        // Setting Service to find User in the database.
//		        // And Setting PassswordEncoder
//		        auth.userDetailsService(twouserDetailsService).passwordEncoder(passwordEncoder2());
//		             //处理自动登录逻辑
//		    }
//		 
//		    @Override
//		    protected void configure(HttpSecurity http) throws Exception {
//		 
//		        http.csrf().disable();
//		        http.authorizeRequests().antMatchers("/inhouse/", "/inhouse/login", "/inhouse/logout").permitAll();
//		        http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
//		   
//		        http
//                .antMatcher("/inhouse/home")
//                .authorizeRequests()
//                .anyRequest()
//                .authenticated()
//                .and()
//                .formLogin()//
//                .loginProcessingUrl("/inhouse/home")
//                .loginPage("/inhouse/login")
//                .defaultSuccessUrl("/inhouse/home")
//                .failureUrl("/inhouse/login?error=true")
//                .usernameParameter("username")
//                .passwordParameter("password")
//                .and().logout().logoutUrl("/inhouse/logout").logoutSuccessUrl("/inhouse/logoutInHouseSuccessful");
//		        
//		        http.authorizeRequests().and()
//		        .rememberMe().tokenRepository(this.persistentTokenRepository2())
//		        .tokenValiditySeconds(1 * 24 * 60 * 60);
//		    }
//		 
//		    @Bean
//		    public PersistentTokenRepository persistentTokenRepository2() {
//		        JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
//		        db.setDataSource(dataSource);
//		        return db;
//		    }
//	  }
//}
