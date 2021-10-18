package com.javis.web.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.javis.web.dto.BoardDTO;
import com.javis.web.dto.FileDTO;
import com.javis.web.model.Board;

@Mapper
public interface BoardMapper {
	@Select("SELECT * FROM board")
	List<Board> findAll();
	
	int boarder(Board board); 
	
	//게시글 개수  
    public int boardCount() throws Exception;
    
    //게시글 목록  
    public List<Board> boardList();
    
    //게시글 상세
    public Board boardDetail(int bno);
    
    //게시글 작성  
    public int boardInsert(BoardDTO board) throws Exception;
    
    //게시글 수정  
    public int boardUpdate(Board board) throws Exception;
    
    //게시글 삭제  
    public int boardDelete(int bno);
    
    // BoardMapper.java
    public int fileInsert(FileDTO file) throws Exception;
    
    //파일 상세
    public FileDTO fileDetail(int bno) throws Exception;
    
    public int fileDelete(int bno) throws Exception;
    
}

