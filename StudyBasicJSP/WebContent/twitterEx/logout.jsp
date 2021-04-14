<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
        session.invalidate(); // 모든세션정보 삭제
      
        
 %>




  <script>
	alert('로그아웃 되었습니다.')
	location.href="twitter_login.jsp";
	</script>

