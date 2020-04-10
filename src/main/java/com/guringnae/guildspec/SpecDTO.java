package com.guringnae.guildspec;

import java.util.List;

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
	@JsonProperty(value="import_time")
	private String import_time;
	@JsonProperty(value="guild_code")
	private String guild_code;
	private String guildName;
	private String server;
	
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public String getGuildName() {
		return guildName;
	}
	public void setGuildName(String guildName) {
		this.guildName = guildName;
	}
	private List<SpecDTO> list;
	
	public String getGuild_code() {
		return guild_code;
	}
	public void setGuild_code(String guild_code) {
		this.guild_code = guild_code;
	}
	public List<SpecDTO> getList() {
		return list;
	}
	public void setList(List<SpecDTO> list) {
		this.list = list;
	}
	public String getImport_time() {
		return import_time;
	}
	public void setImport_time(String import_time) {
		this.import_time = import_time;
	}
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
