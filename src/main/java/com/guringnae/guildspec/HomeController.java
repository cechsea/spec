package com.guringnae.guildspec;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@Autowired
	private SpecService service;
	@Autowired
	private SpecUpdateService updateService;
	
	//공통
	@RequestMapping(value="/save", method = RequestMethod.POST)
	@ResponseBody
	public void attIns(@RequestBody SpecDTO list) {
		service.attIns(list.getList());
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	@ResponseBody
	public void attDel(@RequestBody SpecDTO list) {
		service.attDel(list.getList());
	}
	
	@RequestMapping(value = "/{server}/{guild_name}", method = RequestMethod.GET)
	public ModelAndView home_test(@PathVariable String guild_name, @PathVariable String server) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("server", server);
		mav.addObject("guildName", guild_name);
		mav.addObject("udtTime",service.lastUdt(guild_name, server));
		mav.setViewName("home8");
		return mav;
	}
	
	@RequestMapping(value = "/allselect/{server}/{guild_name}", method = RequestMethod.GET)
	@ResponseBody
	public List<SpecDTO> allSelect(@PathVariable String guild_name, @PathVariable String server){
			return service.allList(guild_name, server);
	}
	
	@RequestMapping(value="/alldel", method = RequestMethod.POST)
	@ResponseBody
	public void allAttDel(@RequestBody SpecDTO list) {
		service.allDelete(list.getGuildName(), list.getServer());
	}
	
	@RequestMapping(value="/allsave", method = RequestMethod.POST)
	@ResponseBody
	public void allAttIns(@RequestBody SpecDTO list) {
		service.allSave(list.getGuildName(), list.getServer());
	}
	
	@RequestMapping(value = "/select/{server}/{guild_name}", method = RequestMethod.GET)
	@ResponseBody
	public List<SpecDTO> select(@PathVariable String guild_name, @PathVariable String server){
		return service.attackList(guild_name, server);
	}
	
	@RequestMapping(value = "/supselect/{server}/{guild_name}", method = RequestMethod.GET)
	@ResponseBody
	public List<SpecDTO> supportSelect(@PathVariable String guild_name, @PathVariable String server){
		return service.supList(guild_name, server);
	}
	

	// 아래는 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	@RequestMapping(value="/guildselect", method = RequestMethod.GET)
	@ResponseBody
	public List<GuildDTO> guildSelect() {
		return service.guildSelect();
	}
	
	@RequestMapping(value="/update/{server}/{guild_name}", method = RequestMethod.GET)
	public void guildUpdate(@PathVariable String guild_name, @PathVariable String server) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		String lastUdtTime = service.lastUdt(guild_name, server); //마지막 update시간
		Date date = new Date();
		
		if(lastUdtTime == null || lastUdtTime.equals("")) lastUdtTime = "2020-01-01 12:00:00";
		
		Date lastUp = sdf.parse(lastUdtTime);
		Date now = sdf.parse(sdf.format(date));
		
		long upTime = lastUp.getTime();
		long nowTime = now.getTime();
		
		long minute = (nowTime - upTime) / 60000;
		
		if(minute >= 10) {
			updateService.specInsert(guild_name, server);
		}
	}
	
	@RequestMapping(value="/admin/{server}/{guild_name}", method = RequestMethod.GET)
	public ModelAndView guildAdmin(@PathVariable String guild_name, @PathVariable String server) throws ParseException {
		ModelAndView mav = new ModelAndView();
		mav.addObject("guildName",guild_name);
		mav.addObject("server",server);
		mav.setViewName("home2");
		return mav;
	}
}
