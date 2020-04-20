package com.guringnae.guildspec;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpecService {
	
	@Autowired
	private SpecMapper mapper;
	
	public List<GuildDTO> guildSelect(){
		return mapper.guildSelect();
	}
	
	public String getGuildCode(String guild_name, String server) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("guild_name", guild_name);
		param.put("server", server);
		return mapper.getGuildCode(param);
	}
	
	public void attIns(List<SpecDTO> list) {
		for(SpecDTO dto : list) {
			mapper.attIns(dto);
		}
	}
	
	public void attDel(List<SpecDTO> list) {
		for(SpecDTO dto : list) {
			mapper.attDel(dto);
			mapper.noaDel(dto);
		}
	}
	
	public String lastUdt(String guild_name, String server) { 
		return mapper.lastUdt(getGuildCode(guild_name, server)); 
	}
	
	public List<SpecDTO> allList(String guild_name, String server){
		return mapper.allList(getGuildCode(guild_name, server));
	}
	
	public List<SpecDTO> attList(String guild_name, String server){
		return mapper.attList(getGuildCode(guild_name, server));
	}
	
	public List<SpecDTO> noaSelect(String guild_name, String server){
		return mapper.noaSelect(getGuildCode(guild_name, server));
	}
	
	public void allSave(String guild_name, String server) {
		List<SpecDTO> list = mapper.allList(getGuildCode(guild_name, server));
		for(SpecDTO dto : list) {
			mapper.attIns(dto);
		}	
	}

	public void allDelete(String guild_name, String server) {
		List<SpecDTO> list = mapper.allLists(getGuildCode(guild_name, server));
		for(SpecDTO dto : list) {
			mapper.attDel(dto);
		}	
		List<SpecDTO> list2 = mapper.allLists2(getGuildCode(guild_name, server));
		for(SpecDTO dto : list2) {
			mapper.noaDel(dto);
		}	
	}
	
	public List<SpecDTO> attackList(String guild_name, String server){
		Map<String, Object> param = new HashMap<String, Object>();
		List<SupDTO> list = mapper.guildsup(getGuildCode(guild_name, server));
		List<String> inList = new ArrayList<String>();
		
		for(SupDTO dto : list) {
			inList.add(dto.getJob());
		}
		param.put("listsize", inList.size());
		param.put("code_list", inList);
		param.put("guild_code", getGuildCode(guild_name, server));
		return mapper.attackList(param);
	}
	
	public List<SpecDTO> supList(String guild_name, String server){
		Map<String, Object> param = new HashMap<String, Object>();
		List<SupDTO> list = mapper.guildsup(getGuildCode(guild_name, server));
		List<String> inList = new ArrayList<String>();
		
		for(SupDTO dto : list) {
			inList.add(dto.getJob());
		}
		param.put("listsize", inList.size());
		param.put("code_list", inList);
		param.put("guild_code", getGuildCode(guild_name, server));
		return mapper.supList(param);
	}
	
	public List<SuroDTO> suroSelect(String guild_name, String server, String suro){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("suro", suro);
		param.put("guild_code", getGuildCode(guild_name, server));
		return mapper.suroSelect(param);
	}
	
	public void suroInsert(List<SuroDTO> list) {
		for(SuroDTO dto : list) {
			mapper.suroInsert(dto);
		}
	}
	
	public void suroDelete(List<SuroDTO> list) {
		for(SuroDTO dto : list) {
			mapper.suroDelete(dto.getNickname());
		}
	}
	
	public List<JobDTO> supchoicelist(String guild_name, String server){
		return mapper.supcho(getGuildCode(guild_name, server));
	}
	
	public void supchoins(List<SupDTO> list) {
		for(SupDTO dto : list) {
			dto.setGuild_code(getGuildCode(dto.getGuild_name(), dto.getServer()));
			mapper.supchoins(dto);
		}
	}
	
	public List<SupDTO> guildsup(String guild_name, String server){
		return mapper.guildsup(getGuildCode(guild_name, server));
	}
	
	public void supchodel(List<SupDTO> list) {
		for(SupDTO dto : list) {
			dto.setGuild_code(getGuildCode(dto.getGuild_name(), dto.getServer()));
			mapper.supchodel(dto);
		}
	}
	
	public List<SpecDTO> attackList_all(String guild_name, String server){
		Map<String, Object> param = new HashMap<String, Object>();
		List<SupDTO> list = mapper.guildsup(getGuildCode(guild_name, server));
		List<String> inList = new ArrayList<String>();
		
		for(SupDTO dto : list) {
			inList.add(dto.getJob());
		}
		param.put("listsize", inList.size());
		param.put("code_list", inList);
		param.put("guild_code", getGuildCode(guild_name, server));
		return mapper.attackList_all(param);
	}
	
	public List<SpecDTO> supList_all(String guild_name, String server){
		Map<String, Object> param = new HashMap<String, Object>();
		List<SupDTO> list = mapper.guildsup(getGuildCode(guild_name, server));
		List<String> inList = new ArrayList<String>();
		
		for(SupDTO dto : list) {
			inList.add(dto.getJob());
		}
		param.put("listsize", inList.size());
		param.put("code_list", inList);
		param.put("guild_code", getGuildCode(guild_name, server));
		return mapper.supList_all(param);
	}
	
	public void gogo(String nickname) {
		SpecDTO dto = new SpecDTO();
		dto.setNickname(nickname);
		mapper.attIns(dto);
		mapper.noaDel(dto);
	}
	
	public void nono(String nickname) {
		SpecDTO dto = new SpecDTO();
		dto.setNickname(nickname);
		mapper.attDel(dto);
	}
	
	public int userSpecChk(String nickname) {
		return mapper.userSpecChk(nickname);
	}
	
	public int userAttChk(String nickname) {
		return mapper.userAttChk(nickname);
	}
	
	public int userNoaChk(String nickname) {
		return mapper.userNoaChk(nickname);
	}
	
	public void noaIns(String nickname) {
		SpecDTO dto = new SpecDTO();
		dto.setNickname(nickname);
		mapper.noaIns(dto);
		nono(nickname);
	}
}
