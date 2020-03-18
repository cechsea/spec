package com.guringnae.guildspec;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@Autowired
	private SpecService service;
	
	private List<SpecDTO> allList;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		 String ip = req.getHeader("X-Forwarded-For");
		 if (ip == null) ip = req.getRemoteAddr();
		 System.out.println("접속ip = " + ip);
		 System.out.println(service.selectNow());
		return "home";
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	@ResponseBody
	public List<SpecDTO> select(){
			return service.attackList();
	}
	
	@RequestMapping(value = "/supselect", method = RequestMethod.GET)
	@ResponseBody
	public List<SpecDTO> supportSelect(){
		return service.supList();
	}
	
}
