<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.addrbook.*,java.util.*"%>
 
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ab" scope="page" class="jspbook.addrbook.AddrBean"/>
<jsp:useBean id="addrbook" class="jspbook.addrbook.AddrBook"/>
<jsp:setProperty property="*" name="addrbook"/>

<%
	//컨트롤러 요청 파라미터
String action = request.getParameter("action");

//마라미터에 따른 요청 처리
//주소록 목록 요청인 경우

	if(action.equals("list")) {
		ArrayList<AddrBook> datas=ab.getDBList();
		request.setAttribute("datas",datas);
		pageContext.forward("addrbook_list.jsp");
	}

	else if(action.equals("insert")) {
		if(ab.insertDB(addrbook)) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		}else
			throw new Exception("DB입력오류");
	}

	else if (action.equals("edit")) {
	    AddrBook abook = ab.getDB(addrbook.getAb_id());
	    if (!request.getParameter("upasswd").equals("jsppass")) {
	        out.println("<script>alert('비밀번호가 틀렸습니다!!'); history.go(-1);</script>");
	    } else {
	        request.setAttribute("ab", abook);
	        pageContext.forward("addrbook_edit_form.jsp");
	    }
	} else if (action.equals("update")) {
	    if (ab.updateDB(addrbook)) {
	        response.sendRedirect("addrbook_control.jsp?action=list");
	    } else {
	        throw new Exception("DB 갱신 오류");
	    }
	} else if (action.equals("delete")) {
	    if (ab.deleteDB(addrbook.getAb_id())) {
	        response.sendRedirect("addrbook_control.jsp?action=list");
	    } else {
	        throw new Exception("DB 삭제 오류");
	    }
	} else {
	    
	}
	
%>	
	