package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthCheckInterceptor implements HandlerInterceptor{

	@Override					//postHandle 컨트롤러 실행 후, afterCompletion 뷰를 실행한 이후
	public boolean preHandle( //컨트롤러(핸들러) 실행 전.
			HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession(false);
		if(session != null) {
			Object authInfo = session.getAttribute("authInfo");
			if(authInfo != null) {
				return true;
			}
		}
		
		response.sendRedirect(request.getContextPath()+ "/login"); //request.getContextPath() -> localhost:8080/sp5-chap13 이면 sp5-chap13  즉 sp5-chap13/login
		return  false;
	}
}
