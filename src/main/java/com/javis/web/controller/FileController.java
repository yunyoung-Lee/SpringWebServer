package com.javis.web.controller;


import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.javis.web.dto.FileDTO;
import com.javis.web.dto.ResponseData;
import com.javis.web.service.FileService;
import com.javis.web.util.JavisUrl;


@RestController
public class FileController {
	@Autowired
	FileService fileService;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = "/ajax/createMovie", method = {RequestMethod.GET, RequestMethod.POST}) //Iot 서버에서 영상 받기
	public ResponseEntity<Object> createMovie() {
		
		ResponseData resData = new ResponseData();
		
		try {
			URL url = new URL(JavisUrl.IOT_URL + JavisUrl.IOT_GET_VIDEO);
			String dir = servletContext.getRealPath("resources/videos");
			fileService.downloadToDir(url,	new File(dir));
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@RequestMapping(value = "/ajax/sendMovie", method = RequestMethod.POST)//인공지능 서버로 영상 보내기
	public ResponseEntity<Object> sendMovie() {
		
		ResponseData resData = new ResponseData();
		
		try {
			String dir = servletContext.getRealPath("resources/videos") + "/userVideo.mp4";
			fileService.PostURL(JavisUrl.AI_URL + JavisUrl.AI_URL_IMAGE_UPLOAD + "/3",dir);
			return new ResponseEntity<Object>(resData, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			resData.setCode(false);
			resData.setMsg(e.getLocalizedMessage());
			return new ResponseEntity<Object>(resData, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@RequestMapping(value = "/fileDownload/{fno}", method = RequestMethod.GET)//게시판 파일 업로드
    public ResponseEntity<InputStreamResource> fileDownload(@PathVariable String fno) throws Exception {

		FileDTO fileDTO = fileService.fileDownload(fno);
		if(fileDTO == null) {
			return ResponseEntity.noContent().build();
		}
		
        File file = new File(fileDTO.getFileUrl()+fileDTO.getFileName());
        if (!file.exists()) {
            return ResponseEntity.noContent().build();
        }
        
        InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

        String utf8FileName = URLEncoder.encode(fileDTO.getFileOriName(), "utf-8");
        utf8FileName = utf8FileName.replaceAll("\\+", "%20");

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + utf8FileName)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .contentLength(file.length())
                .body(resource);
    }
}
