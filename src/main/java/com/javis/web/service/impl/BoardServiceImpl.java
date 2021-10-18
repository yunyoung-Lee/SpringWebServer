package com.javis.web.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javis.web.dto.BoardDTO;
import com.javis.web.dto.FileDTO;
import com.javis.web.model.Board;
import com.javis.web.repository.BoardMapper;
import com.javis.web.repository.FileMapper;
import com.javis.web.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	FileMapper fileMapper;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	BoardMapper boardMapper;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	@Override
//	public int boardDTO(BoardDTO BoardDTO) {
//		Board board = new Board();
//		board.setBno(BoardDTO.getBno());
//		board.setSubject(BoardDTO.getSubject());
//		board.setContent(BoardDTO.getContent());
//		board.setWriter(BoardDTO.getWriter());
//		board.setRegDate(BoardDTO.getRegDate());
//		
//		return boardMapper.boarder(board);
//	}

	@Override
	public List<BoardDTO> allBoard() {
		List<Board> boards = boardMapper.boardList();
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		BoardDTO boardDTO = null;
		Board board = null;
		for (int i = 0; i < boards.size(); i++) {
			boardDTO = new BoardDTO();
			board = boards.get(i);
			boardDTO.setBno(board.getBno());
			boardDTO.setRowNum(board.getRowNum());
			boardDTO.setSubject(board.getSubject());
			boardDTO.setContent(board.getContent());
			boardDTO.setWriter(board.getWriter());
			boardDTO.setRegDate(board.getRegDate());
			boardDTO.setRegDateStr(sdf.format(board.getRegDate()));
			
			list.add(boardDTO);
		}
		return list;
	}

	@Override
	public int deleteBoard(int bno){
		return boardMapper.boardDelete(bno);
	}
	
	/*
	 * @Override public int insertBoard(BoardDTO boardDTO) { return
	 * boardMapper.boardInsert(bno,subject,content,writer,reg_date); }
	 */

	@Override
	public int updateBoard(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, Object> getBoardDTO(int bno) throws Exception {
		Map<String, Object> data = new HashMap<>();//Map: 인터페이스이므로 선언 가능, 객체 생성 불가능 ->HashMap으로 객체 생성
		
		BoardDTO boardDTO = new BoardDTO();
		Board board = boardMapper.boardDetail(bno);
		boardDTO.setBno(board.getBno());
		boardDTO.setRowNum(board.getRowNum());
		boardDTO.setSubject(board.getSubject());
		boardDTO.setContent(board.getContent());
		boardDTO.setWriter(board.getWriter());
		boardDTO.setRegDate(board.getRegDate());
		boardDTO.setRegDateStr(sdf.format(board.getRegDate()));
		
		FileDTO fileDTO = fileMapper.selectFileInfoByBno(bno);
		data.put("board", boardDTO);
		data.put("file", fileDTO);
		
		return data;
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception {
		
		boardMapper.boardInsert(boardDTO); //board insert
		
		
		MultipartFile files = boardDTO.getFiles(); //파일추출
		
		if(!files.isEmpty()) {
			String uuid = UUID.randomUUID().toString().replaceAll("-", ""); //유니크 파일명 생성.(중복 파일 없도록)
			String ofn = files.getOriginalFilename(); //파일원본이름

			//확장자추출
			int p = ofn.lastIndexOf(".");
			String ext = ofn.substring(p);
			
			String fileName = uuid + ext; //최종파일이름
			String dir = servletContext.getRealPath("resources/images") + "\\"; //파일경로
		
			FileDTO fileDTO = new FileDTO();
			fileDTO.setBno(boardDTO.getBno());
			fileDTO.setFileOriName(ofn);
			fileDTO.setFileName(fileName);
			fileDTO.setFileUrl(dir);
			boardMapper.fileInsert(fileDTO); //file insert
			
			files.transferTo(new File(dir+fileName)); // 해당경로에 파일저장
		}
	}
}
