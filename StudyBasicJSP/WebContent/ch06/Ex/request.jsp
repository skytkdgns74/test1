<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 입력 출력</title>
<link rel="stylesheet" href="requestTestForm.css"/>
</head>
<body>
 <div>
 <form method="post" action="requestTestForm.jsp">
    <table class="b1">
     <tr class="b1">
        <td class="b1">이름</td>
        <td class="b1">
        
        <input type="text" name="name">
        </td>
     </tr>
    
     <tr class="b1">
     	<td class="b1"> 직업 </td>
     	<td class="b1">

     	<select name="job">
     	 <option value="무직">무직</option>
     	 <option value="회사원">회사원</option>
     	 <option value="전문직">전문직</option>
     	 <option value="학생">학생</option>
     	 </select>
   
     	 </td>
     </tr>
     
     <tr class="b1">
     	<td class="b1">관심분야</td>
     	<td class="b1">
     		<input type="checkbox" name="interesting" value="정치">정치
     		<input type="checkbox" name="interesting" value="사회">사회
     		<input type="checkbox" name="interesting" value="정보통신">정보통신
     	</td>
     </tr>
     
     <tr class="b1">
     	<td></td>
     	<td>
     		<input type="submit" value="확인">
     		<input type="reset" value="취소">
     	</td>
     </tr>
     	
    </table>
    </form>
 </div>
</body>
</html>