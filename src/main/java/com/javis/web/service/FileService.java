package com.javis.web.service;

import java.io.File;
import java.net.URL;

import com.javis.web.dto.FileDTO;

public interface FileService {

	void downloadToDir(URL url, File file);
	void downloadToFile(URL url, File savedFile);
	
	public void PostURL(String url, String fullPath);
	FileDTO fileDownload(String bno) throws Exception;

}
