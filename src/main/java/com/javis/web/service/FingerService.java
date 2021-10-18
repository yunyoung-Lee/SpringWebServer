package com.javis.web.service;

import com.javis.web.dto.FingerDTO;

public interface FingerService {
	
	public void sendLedOnOff(String userId, int finger);
	
	//손동작 추가
	int fingerJoinDTO(FingerDTO fingerDTO);
	
	public void snedIotControl(String userId, int sensorIdx, boolean signal);

}
