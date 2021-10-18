package com.javis.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.javis.web.dto.ResponseData;
import com.javis.web.dto.UserDTO;
import com.javis.web.service.UserService;

@RestController
public class UserRestController {

	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/ajax/join", method = RequestMethod.POST)
	public ResponseEntity<Object> signUp(UserDTO userDTO) {
		
		ResponseData resData = new ResponseData();

		try {
			resData.setValue(userService.userJoinDTO(userDTO));
			
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}