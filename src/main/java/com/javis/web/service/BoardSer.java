package com.javis.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javis.web.dto.BoardDTO;
import com.javis.web.dto.FileDTO;
import com.javis.web.model.Board;
import com.javis.web.repository.BoardMapper;
 

@Service
public class BoardSer {
 
    @Autowired
    BoardMapper boardMapper;
    
    public List<Board> boardListService() throws Exception{
        
        return boardMapper.boardList();
    }
    
    public Board boardDetailService(int bno) throws Exception{
        
        return boardMapper.boardDetail(bno);
    }
    
    public int boardInsertService(BoardDTO board) throws Exception{
        
//        return mBoardMapper.boardInsert(board);
    	return 1;
    }
    
    public int boardUpdateService(BoardDTO board) throws Exception{
        
//        return mBoardMapper.boardUpdate(board);
    	return 1;
    }
    
    public int boardDeleteService(int bno) throws Exception{
        
        return boardMapper.boardDelete(bno);
    }
    
  //BoardService.java
    public int fileInsertService(FileDTO file) throws Exception{
        return boardMapper.fileInsert(file);
    }
    
    public FileDTO fileDetailService(int bno) throws Exception{
        
        return boardMapper.fileDetail(bno);
    }
    
public int fileDeleteService(int bno) throws Exception{
        
        return boardMapper.fileDelete(bno);
    }


}


