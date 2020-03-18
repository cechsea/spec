package com.guringnae.guildspec;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpecMapper {
	 String selectNow();
	 
	 List<SpecDTO> attackList(Map<String, Object> param);
	 
	 List<SpecDTO> supList(Map<String, Object> param);
}
