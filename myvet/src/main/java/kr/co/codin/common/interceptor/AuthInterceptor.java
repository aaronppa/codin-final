package kr.co.codin.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.codin.repository.domain.Member;

// 스프링 환경 설정 파일 등록
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("user");
		if (m != null) {
			return true;
		}
		
		System.out.println("인증 인터셉터에 로그인 안되었음이 걸렸다!");
		response.sendRedirect("../../myvet");
		
		return false;
	}
	
}
