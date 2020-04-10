package com.guringnae.guildspec;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SpecUpdateService {
	
	@Autowired
	private SpecMapper mapper;
	
	public void specDelete(String guild_name, String server) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("guild_name", guild_name);
		param.put("server", server);
		mapper.specDelete(mapper.getGuildCode(param));
	}
	
	public void specInsert(String guild_name, String server) {
		specDelete(guild_name, server);
		// 우선 삭제
		
		String URL = "https://maple.gg/guild/" + server + "/"+ guild_name +"/members?sort=level";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(URL).get();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		Elements ele = doc.select("div.mb-2");
		
		//Iterator을 사용하여 하나씩 값 가져오기
		Iterator<Element> ie1 = ele.select("a").iterator();
		        
		while (ie1.hasNext()) {
			SpecDTO dto = new SpecDTO();
			dto.setNickname(ie1.next().text());
			if(dto.getNickname().equals("") || dto.getNickname() == null) {
				continue;
			}
			String sub_url = "https://maple.gg/u/" + dto.getNickname();
			Document sub_doc = null;
			try {
				sub_doc = Jsoup.connect(sub_url).get();
			}catch(IOException e) {
				e.printStackTrace();
			}
			
			Elements sub_ele = sub_doc.select("#character-card");
			Iterator<Element> sub_ie1_temp = sub_ele.select("li.character-card-summary-item").iterator();	//레벨, 직업
			sub_ie1_temp.next().text();
			dto.setLevel(sub_ie1_temp.next().text().replaceAll("[^0-9]",""));
			dto.setJob(sub_ie1_temp.next().text());
			
			
			//Iterator을 사용하여 하나씩 값 가져오기
			Iterator<Element> sub_ie1 = sub_ele.select("li.character-card-additional-item").iterator();	//무릉 층수
			dto.setSpec(sub_ie1.next().text());
			
			Elements sub_ele2 = sub_ele.select("li.character-card-additional-item");
			Iterator<Element> sub_ie2 = sub_ele2.select("span").iterator();
			String data2 = sub_ie2.next().text();
			
			String data3 = "0";	//분
			String data4 = "0";	//초
			if(!data2.equals("기록없음")) {
			Iterator<Element> sub_ie3 = sub_ele2.select("small").iterator();
			sub_ie3.next();
				String temp = sub_ie3.next().text();
				int idx = temp.indexOf("분");
			 	data3 = temp.substring(0, idx);
			 	data4 = temp.substring(idx+1).replaceAll("[^0-9]","");
			 	data2 = data2.replaceAll("[^0-9]","");
			}else {
				data2 = "0";
			}
			dto.setFloor(Integer.parseInt(data2));  //층수
			dto.setTime((Integer.parseInt(data3)*60)+Integer.parseInt(data4));
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("guild_name", guild_name);
			param.put("server", server);
			dto.setGuild_code(mapper.getGuildCode(param));
			mapper.specInsert(dto);
		}
	}
	
}
