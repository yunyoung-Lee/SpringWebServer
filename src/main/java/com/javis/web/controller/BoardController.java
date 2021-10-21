package com.javis.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.javis.web.dto.BoardDTO;
import com.javis.web.dto.FileDTO;
import com.javis.web.dto.UserDTO;
import com.javis.web.service.BoardSer;
import com.javis.web.service.UserService;

@Controller
public class BoardController {
 
    @Autowired
    BoardSer mBoardService; //BoardMapper boardMapper;  
    
    @Autowired
	private UserService userService; 
    
    @RequestMapping("/list") //게시판 리스트 화면 호출  
    private String boardList(Principal principal,Model model) throws Exception{
    	String id = principal.getName();
    			UserDTO vo = userService.getUserOne(id);
    			model.addAttribute("Id", vo.getUserId());
        //model.addAttribute("list", mBoardService.boardListService());
        
        return "/board/list"; //생성할 jsp
    }
    
    @RequestMapping("/detail/{bno}") 
    private String boardDetail(@PathVariable int bno, Principal principal, Model model) throws Exception{
    	String id = principal.getName();
		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		
        model.addAttribute("bno", bno);
        return "/board/detail";
    }
    
    @RequestMapping("/insert") //게시글 작성폼 호출  
    private String boardInsertForm(Principal principal, Model model){
    	String id = principal.getName();
		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		
        return "/board/insert";
    }
    
    @RequestMapping("/insertProc")
    private String boardInsertProc(HttpServletRequest request, @RequestPart MultipartFile files, Principal principal, Model model) throws Exception{
    	String id = principal.getName();
		UserDTO vo = userService.getUserOne(id);
		model.addAttribute("Id", vo.getUserId());
		
        BoardDTO board = new BoardDTO();
        FileDTO  file  = new FileDTO();
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));
        
        
        if(files.isEmpty()){ //업로드할 파일이 없을 시
            mBoardService.boardInsertService(board); //게시글 insert
        }else{
            String fileName = files.getOriginalFilename(); 
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase(); 
            File destinationFile; 
            String destinationFileName; 
            String fileUrl = "C:\\Users\\Admin\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\SpringWebServer\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";
            do { 
                destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
                destinationFile = new File(fileUrl+ destinationFileName); 
            } while (destinationFile.exists()); 
            
            destinationFile.getParentFile().mkdirs(); 
            files.transferTo(destinationFile); 
            mBoardService.boardInsertService(board); //게시글 insert
            
            file.setBno(board.getBno());
            file.setFileName(destinationFileName);
            file.setFileOriName(fileName);
            file.setFileUrl(fileUrl);
            
            mBoardService.fileInsertService(file); //file insert
        }
        
        
        return "redirect:/list";
    }
 
//    @RequestMapping("/updateProc")
//    private String boardUpdateProc(HttpServletRequest request) throws Exception{
//        
//        BoardDTO board = new BoardDTO();
//        board.setSubject(request.getParameter("subject"));
//        board.setContent(request.getParameter("content"));
//        board.setBno(Integer.parseInt(request.getParameter("bno")));
//        
//        mBoardService.boardUpdateService(board);
//        
//        return "redirect:/detail/"+request.getParameter("bno"); 
//    }
    
    @RequestMapping("/delete/{bno}")
    private String boardDelete(@PathVariable int bno) throws Exception{
        
        mBoardService.boardDeleteService(bno);
        mBoardService.fileDeleteService(bno);
        
        return "redirect:/list";
    }
    
    @RequestMapping("/fileDown/{bno}")
    private void fileDown(@PathVariable int bno, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        request.setCharacterEncoding("UTF-8");
        FileDTO fileVO = mBoardService.fileDetailService(bno);
        
        //파일 업로드된 경로 
        try{
            String fileUrl = fileVO.getFileUrl();
            fileUrl += "/";
            String savePath = fileUrl;
            String fileName = fileVO.getFileName();
            
            //실제 내보낼 파일명 
            String oriFileName = fileVO.getFileOriName();
            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";
            
            //파일을 읽어 스트림에 담기  
            try{
                file = new File(savePath, fileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }
            
            client = request.getHeader("User-Agent");
            
            //파일 다운로드 헤더 지정 
            response.reset();
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Description", "JSP Generated Data");
            
            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    response.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    response.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                response.setHeader("Content-Length", "" + file.length());
                os = response.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                response.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e.getMessage());
        }
        
    }
}


