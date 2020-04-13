package com.guringnae.guildspec;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class SpecInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//List<BlackListDTO> blacklist = new SpecService().blacklist();
		/*HttpServletRequest req = (HttpServletRequest) request;
		String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();
        for(BlackListDTO black : blacklist) {
        	if(black.getIp().equals(ip)) {
        		response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('도배 때문에 글작성이 하루동안 제한됩니다.');history.go(-1);</script>");
                out.flush();
              return false;
        	}
        }*/
        
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
