package com.javis.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javis.web.dto.UserDTO;
import com.javis.web.service.UserService;


@Controller
public class MainController {

	@Autowired
	private UserService userService;  
	@RequestMapping(value="/")
    public String main(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
//		if (principal != null) {
//			try {
//				UserDTO user = userService.getUserOne(principal.getName());
//				model.addAttribute("userId", user.getUserName());
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
        return "/main/main";
    }
	
	@RequestMapping(value="/home")
    public String page(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
        return "/main/main";
    }
	
	@Autowired
	private UserService service;
	@RequestMapping(value="/mypage")
	public String page5(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = service.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		model.addAttribute("Name", vo.getUserName());
		model.addAttribute("Birth", vo.getUserBirth());
		model.addAttribute("Email", vo.getUserEmail());
        return "/view/mypage";
    }
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "/main/join";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String signUp() {
		return "/main/login";
	}
}