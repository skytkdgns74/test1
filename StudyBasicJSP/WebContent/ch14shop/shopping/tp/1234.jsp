<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function printName()  {
  const name1 = document.getElementById('name1').value;
  const name2 = document.getElementById('name2').value;
 console.log(name1);
  if((name2==null||name2=="")||(name1==null||name1=="")){
	  document.getElementById("result").innerText ="값을 입력하시오";
	  document.getElementById("result").style.color = "black";
  }else if(name1==name2){
  document.getElementById("result").innerText = name1;
  document.getElementById("result").style.color = "green";
  }
  else{
  document.getElementById("result").innerText = "불일치";
  document.getElementById("result").style.color = "red";
  }

}

</script>
</head>
<body>
<input type="text" name="name1">
<input type="text" name="name2" onblur='printName()'/>
<p id="result" style="color()"></p>

</body>
</html>