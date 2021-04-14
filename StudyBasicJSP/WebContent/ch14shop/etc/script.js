function checkForm(writeform){

	if(!writeform.book_kind.value){
	  alert("책의 분류를 선택하십시오");
	  writeform.book_kind.focus();
	  return false;
	}
	if(!writeform.book_title.value){
	  alert("책의 제목을 입력하십시오");
	  writeform.book_title.focus();
	  return false;
	}
	
	if(!writeform.book_price.value){
	  alert("책의 가격을 입력하십시오");
	  writeform.book_price.focus();
	  return false;
	}
        
	if(!writeform.book_count.value){
	  alert("책의 수량을 입력하십시오");
	  writeform.book_count.focus();
	  return false;
	}
	
	if(!writeform.author.value){
	  alert("저자를 입력하십시오");
	  writeform.author.focus();
	  return false;
	}
	
	if(!writeform.publishing_com.value){
	  alert("출판사을 입력하십시오");
	  writeform.publishing_com.focus();
	  return false;
	}
	
	if(!writeform.book_content.value){
	  alert("책의 설명을 입력하십시오");
	  writeform.book_content.focus();
	  return false;
	}
		
	writeform.action = "bookRegisterPro.jsp";
    writeform.submit();
	
 } 
 
 function updateCheckForm(writeform){

	if(!writeform.book_kind.value){
	  alert("책의 분류를 선택하십시오");
	  writeform.book_kind.focus();
	  return false;
	}
	if(!writeform.book_title.value){
	  alert("책의 제목을 입력하십시오");
	  writeform.book_title.focus();
	  return false;
	}
	
	if(!writeform.book_price.value){
	  alert("책의 가격을 입력하십시오");
	  writeform.book_price.focus();
	  return false;
	}
        
	if(!writeform.book_count.value){
	  alert("책의 수량을 입력하십시오");
	  writeform.book_count.focus();
	  return false;
	}
	
	if(!writeform.author.value){
	  alert("저자를 입력하십시오");
	  writeform.author.focus();
	  return false;
	}
	
	if(!writeform.publishing_com.value){
	  alert("출판사을 입력하십시오");
	  writeform.publishing_com.focus();
	  return false;
	}
	
	if(!writeform.book_content.value){
	  alert("책의 설명을 입력하십시오");
	  writeform.book_content.focus();
	  return false;
	}
		
	writeform.action = "bookUpdatePro.jsp";
    writeform.submit();
	
 } 
 //회원 정보 수정시 오류찾아내기
 function CustomerCheckForm(writeform){
	
	 if(!writeform.passwd.value){
		  alert("비밀번호를 입력하시오");
		  writeform.passwd.focus();  //focus() 커서 이동
		  return false;
		}
	 
	 if(!writeform.name.value){
		  alert("이름을 입력하시오");
		  writeform.name.focus();
		  return false;
		}
	 
	 if(!writeform.address.value){
		  alert("주소를 입력하시오");
		  writeform.address.focus();
		  return false;
		}
	 
	 if(!writeform.tel.value){
		  alert("전화번호를 입력하시오");
		  writeform.tel.focus();
		  return false;
		}
	 
	 writeform.action = "customerUpdatePro.jsp";
	 writeform.submit();
	 
 }
 
 //입력값에 따라 글자색 변경 및 표기
 //getElementsByName은 배열로 저장함으로 [0].value로 값을 가져온다
 //getElementById는 그냥 사용가능. 
 function printName()  {
	  const passwd1 = document.getElementsByName('passwd')[0].value; //name1의 값을 넣는다
	  const passwd2 = document.getElementsByName('passwd2')[0].value;
	  if(passwd2==null||passwd2==""){
		  document.getElementById("result").innerText = "2차 비밀번호를 입력하세요";//빈칸일시 출력 내용
		  document.getElementById("result").style.color = "black"; //빈칸일시 출력내용 글자 색
	  }else if(passwd1==passwd2){
	  document.getElementById("result").innerText = "일치";
	  document.getElementById("result").style.color = "green";
	  }
	  else{
	  document.getElementById("result").innerText = "불일치";
	  document.getElementById("result").style.color = "red";
	  }

	  
	}
 