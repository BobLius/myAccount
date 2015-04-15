package com.miteno.myAccount.security.util;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import com.miteno.myAccount.security.exception.UserNotFoundException;
import com.miteno.myAccount.security.user.service.UserService;
@Component
public class UserInfoUtil {
	@Resource
	private UserService userService;
	public static String getLoggedUsername(){
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if(auth.getPrincipal() instanceof String)
			return auth.getPrincipal().toString();
		return getSecurityUser().getUsername();		
	}
	public static User getSecurityUser(){
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if(auth.getPrincipal() instanceof String)
			return null;
		return  (User) auth.getPrincipal();
	}
	public com.miteno.myAccount.security.user.entity.User getLoggedUser(){
		try {
			return userService.getUserByUsername(getLoggedUsername());
		} catch (UserNotFoundException e) {
			return null;
		}
	}
}
