package site.xinghui.pblog_sb.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import site.xinghui.pblog_sb.exception.CustException;

public class ErrorInteceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		if (null != modelAndView) {
			CustException custException = new CustException(request.getRemoteHost(), "真的是未知原因",
					request.getRequestURL().toString());
			modelAndView.addObject("custException", custException);
			modelAndView.setViewName("fore/err");
		}
		super.postHandle(request, response, handler, modelAndView);
	}

}
