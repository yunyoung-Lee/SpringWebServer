package com.javis.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.javis.web.dto.FingerDTO;
import com.javis.web.dto.ResponseData;
import com.javis.web.service.FingerService;

@RestController
public class FingerController {
	
	@Autowired
	FingerService fingerService;
	
	@RequestMapping(value = "/ajax/FingerSendData/{userId}/{finger}", method = RequestMethod.POST)
	public ResponseEntity<Object> FingerSendData(@PathVariable String userId, @PathVariable String finger) {
		
		ResponseData resData = new ResponseData();

		try {
			System.out.println("FingerController FingerSendData  START userId : " +userId + " || finger : " + finger );
			int iFinger = Integer.parseInt(finger);
			fingerService.sendLedOnOff(userId, iFinger);
			System.out.println("FingerController FingerSendData  END");
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	//마이페이지 - LED 등록
	@RequestMapping(value = "/ajax/SensorSave", method = RequestMethod.POST)
	public ResponseEntity<Object> sensor1Modify(FingerDTO fingerDTO) {
		System.out.println("SensorSave Start fingerDTO : "+ fingerDTO.toString());
		
		ResponseData resData = new ResponseData();

		try {
			resData.setValue(fingerService.fingerJoinDTO(fingerDTO));
			
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
