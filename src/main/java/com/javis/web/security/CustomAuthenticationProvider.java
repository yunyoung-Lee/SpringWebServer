package com.javis.web.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import com.javis.web.model.User;
import com.javis.web.repository.UserMapper;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private UserMapper userMapper;

	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		Object principal = authentication.getPrincipal();
        Object password = authentication.getCredentials();
        User user = null;
        try {
        	user = userMapper.findByUserId(principal.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        if (!password.equals(user.getUserPw())) {
        	throw new BadCredentialsException("password is invaild");
        }
        
        Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
        
		roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        
        
        return new UsernamePasswordAuthenticationToken(principal, password, roles);
	}

	public boolean supports(Class<?> authentication) {
		return Authentication.class.isAssignableFrom(authentication);
	}
}
