package com.guringnae.guildspec;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class SpecFilter implements Filter{

	@Override
	public void destroy() {
		System.out.println("PrintURLFilter destroy() ---------------------------------");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("PrintURLFilter doFileter() 시작 ------------------------------------");
		HttpServletRequest req = (HttpServletRequest) request;
		String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();
		System.out.println("요청 URL: " + req.getRequestURL());
		System.out.println("요청 IP: " + ip);
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

}
