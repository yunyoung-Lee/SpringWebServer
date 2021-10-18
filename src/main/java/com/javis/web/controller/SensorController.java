package com.javis.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javis.web.dto.ResponseData;
import com.javis.web.dto.UserDTO;
import com.javis.web.service.FingerService;
import com.javis.web.service.UserService;

@Controller
public class SensorController {

	@Autowired
	private UserService userService;  
	@Autowired
	private FingerService fingerService;  
	
	@RequestMapping(value="/iotmain")
    public String page(Principal principal, Model model) throws Exception {
		String id = principal.getName();

		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());

        return "/ai/iotmain";
    }
	
	
	@RequestMapping(value = "/ajax/sendIot/{userId}/{sensorIdx}/{signal}", method = RequestMethod.POST) //Iotmain에서 Iot 조작
	public ResponseEntity<Object> sendMovie(@PathVariable String userId, @PathVariable int sensorIdx, @PathVariable boolean signal) {
		
		ResponseData resData = new ResponseData();
		
		try {
			fingerService.snedIotControl(userId,sensorIdx,signal);
			
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}