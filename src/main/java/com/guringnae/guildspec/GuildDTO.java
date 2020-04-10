package com.guringnae.guildspec;

import org.codehaus.jackson.annotate.JsonProperty;

public class GuildDTO {
	
	@JsonProperty(value="guild_code")
	private String guild_code;
	@JsonProperty(value="guild_name")
	private String guild_name;
	@JsonProperty(value="server")
	private String server;
	@JsonProperty(value="serverNm")
	private String serverNm;
	
	public String getServerNm() {
		return serverNm;
	}
	public void setServerNm(String serverNm) {
		this.serverNm = serverNm;
	}
	public String getGuild_code() {
		return guild_code;
	}
	public void setGuild_code(String guild_code) {
		this.guild_code = guild_code;
	}
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
}
