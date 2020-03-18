package com.guringnae.guildspec;

import org.codehaus.jackson.annotate.JsonProperty;


public class SpecDTO {
	@JsonProperty(value="nickname")
	private String nickname;
	@JsonProperty(value="level")
	private String level;
	@JsonProperty(value="job")
	private String job;
	@JsonProperty(value="floor")
	private int floor;
	@JsonProperty(value="time")
	private int time;
	@JsonProperty(value="spec")
	private String spec;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	
}
