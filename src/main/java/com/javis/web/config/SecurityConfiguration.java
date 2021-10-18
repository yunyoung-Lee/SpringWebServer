package com.javis.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.javis.web.security.CustomAuthenticationProvider;

@Configuration
@EnableWebSecurity

public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authenticationProvider());
	}

	@Bean
	public AuthenticationProvider authenticationProvider() {
		return new CustomAuthenticationProvider();
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/login")
						.antMatchers("/join")
						.antMatchers("/ajax/**")
						.antMatchers("/script/**")
						.antMatchers("/images/**")
						.antMatchers("/css/**");
		

//            .antMatchers(HttpMethod.OPTIONS, "/**")
//            .antMatchers("/app/**/*.{js,html}");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.NEVER).and().formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/j_security_check").permitAll()
				.defaultSuccessUrl("/")
				.usernameParameter("username")
				.passwordParameter("password")
				.failureUrl("/login?fail=1")
				.permitAll().and().authorizeRequests().anyRequest()
				.hasAnyAuthority("ROLE_ADMIN")
//          .authenticated();
//          .antMatchers("/menu/**").hasRole("ADMIN")
//          .antMatchers("/gw/domain/**").hasRole("ADMIN")
//          .antMatchers("/gw/**").hasRole("ADMIN")
//          .antMatchers("/domain/**").hasRole("ADMIN")
//          .antMatchers("/detail/**").hasRole("ADMIN")
//          .authenticated();

				.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/");

	}
}
