package com.yc.boqi.util;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class BackLoginInterCeptor extends MethodFilterInterceptor {
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> session = ActionContext.getContext().getSession();
		Object obj = session.get(AllSessions.LOGIN_ADMIN);
		System.out.println("session中："+session.get(AllSessions.LOGIN_ADMIN));
		if(obj == null){
			session.put("errorMsg", "请先登录");
			return "backlogin";
		}
		return invocation.invoke();
	}
}
