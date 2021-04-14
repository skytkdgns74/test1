<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<% request.setCharacterEncoding("UTF-8"); 

	String msg=request.getParameter("msg");
	//String로 불가능. Object로 가져와야함
	Object username=session.getAttribute("username");
	ArrayList<String> msgs=(ArrayList<String>)application.getAttribute("msgs");
	
	if(msgs ==null) {
		msgs=new ArrayList<String>();
		application.setAttribute("msgs",msgs);
	}
	msgs.add(username+ " :: " + msg + ", " + new java.util.Date());
	//톰캣 콘솔을 통한 로깅
	application.log(msg+"추가됨");
	
	//목록 화면으로 리다이렉팅
	response.sendRedirect("twitter_list.jsp");
	
%>