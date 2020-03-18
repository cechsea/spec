package com.guringnae.guildspec;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	private List<SpecDTO> allList;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	@ResponseBody
	public List<SpecDTO> select(){
	List<SpecDTO> list = new ArrayList<SpecDTO>();	//데이터 저장
			
			String URL = "https://maple.gg/guild/luna/뒤에서/members?sort=level";
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
				dto.setNickName(ie1.next().text());
				if(dto.getNickName().equals("") || dto.getNickName() == null) {
					continue;
				}
				String sub_url = "https://maple.gg/u/" + dto.getNickName();
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
				
				//System.out.println(name + "\t\t" + data + "\t\t" + data2 + "\t\t" + data3 + "\t\t" + data4);
				list.add(dto);
			}
			//여기까지 데이터 list저장 완료
			//System.out.println(list.toString());
			Collections.sort(list, new SpecComp());
			
			allList = list;
			
			List<SpecDTO> nonSupList = new ArrayList<SpecDTO>();
			for(SpecDTO dto : list) {
				if(!(dto.getJob().equals("비숍") || dto.getJob().equals("배틀메이지") || dto.getJob().equals("은월") || dto.getJob().equals("제로"))) {
					nonSupList.add(dto);
				}
			}
			
			return nonSupList;
	}
	
	@RequestMapping(value = "/supselect", method = RequestMethod.GET)
	@ResponseBody
	public List<SpecDTO> supportSelect(){
		List<SpecDTO> supList = new ArrayList<SpecDTO>();
		for(SpecDTO dto : allList) {
			if(dto.getJob().equals("비숍") || dto.getJob().equals("배틀메이지") || dto.getJob().equals("은월") || dto.getJob().equals("제로")) {
				supList.add(dto);
			}
		}
		
		return supList;
	}
	
}
