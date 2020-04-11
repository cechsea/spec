package com.guringnae.guildspec;

import org.codehaus.jackson.annotate.JsonProperty;

public class JobDTO {
	@JsonProperty(value="job")
	private String job;

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
}
