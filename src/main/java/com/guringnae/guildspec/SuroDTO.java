package com.guringnae.guildspec;

import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

public class SuroDTO {
	
	@JsonProperty(value="nickname")
	private String nickname;
	@JsonProperty(value="guild_code")
	private String guild_code;
	@JsonProperty(value="suro")
	private String suro;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGuild_code() {
		return guild_code;
	}
	public void setGuild_code(String guild_code) {
		this.guild_code = guild_code;
	}
	public String getSuro() {
		return suro;
	}
	public void setSuro(String suro) {
		this.suro = suro;
	}
	
	private List<SuroDTO> list;
	public List<SuroDTO> getList() {
		return list;
	}
	public void setList(List<SuroDTO> list) {
		this.list = list;
	}
}
