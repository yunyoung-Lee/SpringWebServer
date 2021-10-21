package com.javis.web.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javis.web.dto.FileDTO;
import com.javis.web.repository.FileMapper;
import com.javis.web.service.FileService;



@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	FileMapper fileMapper;

	/** 정해진 file로 url의 내용을 저장한다. (저장되는 파일명은 url과 무관함)  **/
	public void downloadToFile(URL url, File savedFile){
		if (url==null) throw new IllegalArgumentException("url is null.");
		if (savedFile==null) throw new IllegalArgumentException("savedFile is null.");
		if (savedFile.isDirectory()) throw new IllegalArgumentException("savedFile is a directory."); //경로에 있는 객체가 Folder이면 true
		downloadTo(url, savedFile, false);
	}

	/** 정해진 디렉토리로 url의 내용을 저장한다. (저장되는 파일명이 url에 따라서 달라짐) **/
	public void downloadToDir(URL url, File dir) {//url 과 file을 검사
		if (url==null) throw new IllegalArgumentException("url is null.");
		if (dir==null) throw new IllegalArgumentException("directory is null.");
		if (!dir.exists()) throw new IllegalArgumentException("directory is not existed.");
		if (!dir.isDirectory()) throw new IllegalArgumentException("directory is not a directory."); //경로에 있는 객체가 Folder이면 true
		downloadTo(url, dir, true);
	}

	private void downloadTo(URL url, File targetFile, boolean isDirectory){//url통해 이미지 다운로드하여 로컬 c:/Temp에 저장            
		try {
			HttpURLConnection httpConn = (HttpURLConnection) url.openConnection();//HttpURLConnection 클래스에서 Connection설정
			int responseCode = httpConn.getResponseCode();  //HTTP 응답 메세지 상태 코드를 가져온다.

			if (responseCode == HttpURLConnection.HTTP_OK) { //HTTP_OK가 200 정상
				String fileName = "";
				String disposition = httpConn.getHeaderField("Content-Disposition"); //헤더값들 중에 content-disposition에 해당하는 값을 가져옴.
				File saveFilePath=null;

				if (isDirectory) {//경로에 있는 객체가 Folder일 경우(true)
					if (disposition != null) { //null이 아닐 때
						int index = disposition.indexOf("filename=");//filename=을 index에 넣는다.
						if (index > -1) { //filename이 있을경우 
							fileName = disposition.substring(index + 9, //문자열 자르기
									disposition.length());
						}
						//System.out.println(disposition.toString());
						
					} else { //경로에 있는 객체가 Folder가 아닐 경우(false)
						String fileURL=url.toString();//url에서 file부분을 문자열로 반환
						fileName = fileURL.substring(fileURL.lastIndexOf("/") + 1, fileURL.length());//url의 끝에서 /다음부터 문자열 길이(끝)까지 문자열 자르고 fileName에 담기.
						int questionIdx=fileName.indexOf("?");//fileName에서 ? 찾기
						if (questionIdx>=0) {//filename에 ?가 있을 경우
							fileName=fileName.substring(0, questionIdx);//처음부터 ?전까지 문자열을 뽑는다.
						}
						fileName=URLDecoder.decode(fileName); //url인코딩되어 있는 것을 문자열로 변환
						//System.out.println(fileURL);
					}    
					saveFilePath = new File(targetFile, fileName);
				}
				else {//경로에 있는 객체가 Folder가 아닐 경우
					saveFilePath=targetFile;
				}

				InputStream inputStream = httpConn.getInputStream();//(바이트 기반)입력 스트림

				FileOutputStream outputStream = new FileOutputStream(saveFilePath);

				int bytesRead = -1;
				byte[] buffer = new byte[4096];// 데이터를 받기위해 충분한 양의 버퍼(공간)만들기.
				while ((bytesRead = inputStream.read(buffer)) != -1) {//데이터 읽기, 데이터를 모두 읽었다면 -1을 반환
					outputStream.write(buffer, 0, bytesRead); //읽은 것을 파일에 써준다.
				}

				outputStream.close(); //데이터 출력 스트림 종료
				inputStream.close(); //데이터 입력 스트림 종료
				System.out.println("File downloaded to " + saveFilePath);

				//PostURL();
			} else { //HTTP_OK가 정상x
				System.err.println("No file to download. Server replied HTTP code: " + responseCode);
			}
			httpConn.disconnect();       
		}

		catch (Exception e) {
			e.printStackTrace();//에러 메시지 처리
		}

	}



	public void PostURL(String url, String fullPath) { 
		try {  
			//String fileName="C://Temp//abc.mp4";
			File file = new File(fullPath);
		    HttpEntity entity = MultipartEntityBuilder.create()
		    		.addPart("video", new FileBody(file))
//		    		.addTextBody("video", "abc.mp4")
		    .build();
		    //HttpPost request = new HttpPost("http://192.168.30.30:5000/upload/3/");
			 HttpPost request = new HttpPost(url);
			 request.setEntity(entity);
			
			 HttpClient client = HttpClientBuilder.create().build();
			 HttpResponse response = client.execute(request);
			 System.out.println("reponse = "+response);
			 
		} catch (Exception e){
			e.printStackTrace();
		}
	}

	
	@Override
	public FileDTO fileDownload(String fno) throws Exception {
		return fileMapper.selectFileInfoByFno(fno);
		
	}  
}  




