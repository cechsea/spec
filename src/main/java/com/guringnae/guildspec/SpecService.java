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
	
	public String selectNow() {
        return mapper.selectNow();
    }
	
	public List<SpecDTO> attackList(){
		Map<String, Object> param = new HashMap<String, Object>();
		List<String> inList = new ArrayList<String>();
		
		inList.add("비숍");
		inList.add("제로");
		inList.add("배틀메이지");
		inList.add("은월");
		
		param.put("code_list", inList);
		return mapper.attackList(param);
	}
	
	public List<SpecDTO> supList(){
		Map<String, Object> param = new HashMap<String, Object>();
		List<String> inList = new ArrayList<String>();
		
		inList.add("비숍");
		inList.add("제로");
		inList.add("배틀메이지");
		inList.add("은월");
		
		param.put("code_list", inList);
		return mapper.supList(param);
	}
}
