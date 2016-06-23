package com.yc.boqi.util;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.opensymphony.xwork2.ActionContext;
//过滤器的使用
public class BackInterCepter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		 // 获得在下面代码中要用的request,response,session对象
         HttpServletRequest servletRequest = (HttpServletRequest) request;
         HttpServletResponse servletResponse = (HttpServletResponse) response;
         HttpSession session = servletRequest.getSession();
         
         // 获得用户请求的URI
         String path = servletRequest.getRequestURI();

         // 登陆页面无需过滤
         if(path.indexOf("/login.jsp") > -1 || path.indexOf("/valiCodeImg.jsp") > -1) {
	         chain.doFilter(servletRequest, servletResponse);
	         return;
         }
         
         // 判断如果没有取到员工信息,就跳转到登陆页面
 		 Object obj = session.getAttribute(AllSessions.LOGIN_ADMIN);
         if (obj == null) {
	         // 跳转到登陆页面
	         servletResponse.sendRedirect("login.jsp");
         } else {
	         // 已经登陆,继续此次请求
	         chain.doFilter(request, response);
         }
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
