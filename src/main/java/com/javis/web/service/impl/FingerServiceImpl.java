package com.javis.web.service.impl;

import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javis.web.dto.FingerDTO;
import com.javis.web.model.Finger;
import com.javis.web.repository.FingerMapper;
import com.javis.web.service.FingerService;
import com.javis.web.util.JavisUrl;

@Service
public class FingerServiceImpl implements FingerService {
	
	@Autowired
	FingerMapper fingerMapper;
	
	//손동작 추가
	@Override
	public int fingerJoinDTO(FingerDTO fingerDTO) {
		Finger finger = new Finger();
		finger.setUserId(fingerDTO.getUserId());
		finger.setSensorIdx(fingerDTO.getSensorIdx());
		finger.setBehaviorOn(fingerDTO.getBehaviorOn());
		finger.setBehaviorOff(fingerDTO.getBehaviorOff());
		return fingerMapper.fingerJoin(finger);
	}
	
	@Override
	public void sendLedOnOff(String userId, int finger) {
		
		List<Finger> fingerList = fingerMapper.findByUserId(userId);
		if (fingerList != null && !fingerList.isEmpty()) {
			for (Finger fingerModel : fingerList) {
				if (fingerModel.getSensorIdx() == 1) {
					if (fingerModel.getBehaviorOn().equals(String.valueOf(finger))) {
						sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED_ON);
					} else if (fingerModel.getBehaviorOff().equals(String.valueOf(finger))) {
						sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED_OFF);
					}
				} else if (fingerModel.getSensorIdx() == 2) {
					if (fingerModel.getBehaviorOn().equals(String.valueOf(finger))) {
						sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED2_ON);
					} else if (fingerModel.getBehaviorOff().equals(String.valueOf(finger))) {
						sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED2_OFF);
					}
				}
				
			}
			
		}
	}
	
	public void snedIotControl(String userId, int sensorIdx, boolean signal) {
		List<Finger> fingerList = fingerMapper.findByUserId(userId);
		if (fingerList != null && !fingerList.isEmpty()) {
			for (Finger fingerModel : fingerList) {
				if (fingerModel.getSensorIdx() == sensorIdx) {
					if (sensorIdx == 1) {
						if (signal == true) {
							sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED_ON);
							System.out.println("led1on");
						} else if (signal == false) {
							sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED_OFF);
							System.out.println("led1off");
						}
					} else if (sensorIdx == 2) {
						if (signal == true) {
							sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED2_ON);
							System.out.println("led2on");
						} else if (signal == false) {
							sendHttpGet(JavisUrl.IOT_URL + JavisUrl.IOT_LED2_OFF);
							System.out.println("led2off");
						}
					}
					
				}
				
			}
			
		}
	}
	
	private boolean sendHttpPost(String url, HttpEntity httpEntity) {
		try {  
			HttpPost request = new HttpPost(url);
			request.setEntity(httpEntity);
			
			HttpClient client = HttpClientBuilder.create().build(); // HttpClient 생성
			HttpResponse response = client.execute(request);
			System.out.println("reponse = "+response);
			return true;
		} catch (Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	
	private boolean sendHttpGet(String url) {
		try {  
			HttpGet request = new HttpGet(url);
			
			HttpClient client = HttpClients.createDefault();
			client.execute(request);
			//System.out.println("reponse = "+httpResponse);
			return true;
		} catch (Exception e){
			e.printStackTrace();
		}
		return false;
	}

}
