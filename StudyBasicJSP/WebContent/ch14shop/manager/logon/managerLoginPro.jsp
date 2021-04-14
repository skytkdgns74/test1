<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.master.ShopBookDBBean"%>

<% request.setCharacterEncoding("utf-8");%>

<%
    String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
															//싱글턴패턴 : 생성자를 private로 선언하여 다른클래스에서 해당 클래스의 인스턴스를 new로 생성하지 못하게 하고, getInstance()함수를 통해서 인스턴스를 갖도록 한다
	ShopBookDBBean manager = ShopBookDBBean.getInstance(); //getInstance() 싱글턴패턴. 하나의 인스턴스만 가지고 공유해서 쓴다.
    int check = manager.managerCheck(id,passwd); 			//관리자 인증메소드 managerCheck() 사용 1:인증성공, 0:비밀번호오류, -1:아이디틀림 

	if(check == 1){
		session.setAttribute("managerId",id);
		response.sendRedirect("../managerMain.jsp");	//response.sendRedirect()  특정 조건일 때에 지정한 페이지로 이동
	}else if(check == 0){%>
    <script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<% }else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<% }%>