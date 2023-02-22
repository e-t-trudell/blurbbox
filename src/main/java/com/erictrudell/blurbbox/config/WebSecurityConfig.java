package com.erictrudell.blurbbox.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class WebSecurityConfig {
	private UserDetailsService userDetailsService;
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		http.
	            authorizeRequests()
	                .antMatchers("/css/**", "/js/**", "/registration").permitAll()
	                .anyRequest().authenticated()
	                .and()
	            .formLogin()
	                .loginPage("/login")
	                .permitAll()
	                .and()
	            .logout()
	                .permitAll();
		
		return http.build();
	}
//	For Below:
//	Any URL that starts with "/admin" requires the user to have ROLE_ADMIN. Restart your server, login, and visit 'localhost:8080/admin'. You should see a 403 for Access Denied. 
//	This is the expected output since we have not added any users that have admin privileges.
	@Bean
	protected SecurityFilterChain filterAChain(HttpSecurity http) throws Exception{
		
		http.
	        authorizeRequests()
	            .antMatchers("/css/**", "/js/**", "/registration").permitAll()
	            .antMatchers("/admin/**").access("hasRole('ADMIN')")    // NEW
	            .anyRequest().authenticated()
	            .and()
	        .formLogin()
	            .loginPage("/login")
	            .permitAll()
	            .and()
	        .logout()
	            .permitAll();
		
		return http.build();
	}
//	configureGlobal(AuthenticationManagerBuilder): 
//	This method is configuring Spring Security to use our custom implementation of the UserDetailsService with Bcrypt.
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    } 
	
}