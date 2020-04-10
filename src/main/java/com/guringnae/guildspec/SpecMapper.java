package com.guringnae.guildspec;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SpecMapper {
	
	void attIns(SpecDTO dto);
	void attDel(SpecDTO dto);
	String getGuildCode(Map<String, Object> param);
	String lastUdt(String guild_code);
	List<SpecDTO> allList(String guild_code); 
	List<SpecDTO> allLists(String guild_code);
	List<SpecDTO> attackList(Map<String, Object> param);
	List<SpecDTO> supList(Map<String, Object> param);
	void specDelete(String guild_code); 
	void specInsert(SpecDTO dto);
	List<GuildDTO> guildSelect();
	 
	 
}
