package com.guringnae.guildspec;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class SupDTO {

	@JsonProperty(value="job")
	private String job;
	@JsonProperty(value="guild_code")
	private String guild_code;
	@JsonProperty(value="guild_name")
	private String guild_name;
	@JsonProperty(value="server")
	private String server;
	
	public String getGuild_name() {
		return guild_name;
	}
	public void setGuild_name(String guild_name) {
		this.guild_name = guild_name;
	}
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getGuild_code() {
		return guild_code;
	}
	public void setGuild_code(String guild_code) {
		this.guild_code = guild_code;
	}
	
	private List<SupDTO> list;
	public List<SupDTO> getList() {
		return list;
	}
	public void setList(List<SupDTO> list) {
		this.list = list;
	}
}
