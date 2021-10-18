package com.javis.web.service;
import java.util.List;
import java.util.Map;

import com.javis.web.dto.BoardDTO;

public interface BoardService {
	List<BoardDTO> allBoard();
	int deleteBoard(int bno);
	void insertBoard(BoardDTO boardDTO) throws Exception;
	int updateBoard(BoardDTO boardDTO);
	Map<String, Object> getBoardDTO(int bno) throws Exception;
	
}
