package com.javis.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.javis.web.dto.BoardDTO;
import com.javis.web.dto.ResponseData;
import com.javis.web.service.BoardService;

@RestController
public class BoardRestController {

	@Autowired
	BoardService boardService;
	

	@RequestMapping(value = "/ajax/boardList", method = RequestMethod.POST)
	public ResponseEntity<Object> list() {
		
		ResponseData resData = new ResponseData();

		try {
			resData.setValue(boardService.allBoard());
			
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/ajax/boardDetail/{bno}", method = RequestMethod.POST)
	public ResponseEntity<Object> boardDetail(@PathVariable int bno) {
		
		ResponseData resData = new ResponseData();

		try {
			resData.setValue(boardService.getBoardDTO(bno));
			
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@RequestMapping(value = "/ajax/boardInsert", method = RequestMethod.POST)
	public ResponseEntity<Object> boardInsert(BoardDTO boardDTO) throws Exception {
		
		ResponseData resData = new ResponseData();
		boardService.insertBoard(boardDTO);

		try {
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	

}