package com.javis.web.model;

public class Finger {

	private String userId;
	private String behaviorOn;
	private String behaviorOff;
	private int sensorIdx;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBehaviorOn() {
		return behaviorOn;
	}
	public void setBehaviorOn(String behaviorOn) {
		this.behaviorOn = behaviorOn;
	}
	public String getBehaviorOff() {
		return behaviorOff;
	}
	public void setBehaviorOff(String behaviorOff) {
		this.behaviorOff = behaviorOff;
	}
	public int getSensorIdx() {
		return sensorIdx;
	}
	public void setSensorIdx(int sensorIdx) {
		this.sensorIdx = sensorIdx;
	}


}
