package com.javis.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javis.web.dto.UserDTO;
import com.javis.web.service.UserService;

@Controller
public class UserController {

//	@RequestMapping(value = "/user/join", method = RequestMethod.GET)
//	public ModelAndView signUp() {
//		ModelAndView mav = new ModelAndView();
//		return mav;
//	}
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/face")
	public String page(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		return "/ai/face";
	}
	
	@RequestMapping(value = "/face2")
	public String page2(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		return "/ai/face2";
	}
	
	@RequestMapping(value = "/hand")
	public String page3(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		return "/ai/hand";
	}
	
	@RequestMapping(value = "/hand2")
	public String page4(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		return "/ai/hand2";
	}

	
	


}