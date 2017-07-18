var iddiv = document.getElementById("iddiv");
var pwdiv = document.getElementById("pwdiv");
var txtid = document.getElementById("txtid");
var txtpw = document.getElementById("inputPassword");
var txtpw2 = document.getElementById("inputPassword_repeat");


function idChk(){
	//아이디 중복확인 
    $.ajax({ 
           type:"POST", 
           url:"idchk", //아작스 서버 주소 파일명 
           data: {"id":txtid.value},  //좌측 joinid 피라미터 이름에 우측 $joinid변수값을 저장 
           datatype:"post",//서버의 실행된 결과값을 사용자로 받아오는 방법 
           success: function (data) {//success는 아작스로 받아오는것이 성공했을경우
           if(data.indexOf('true')!=-1){
        		iddiv.innerHTML = 
        			 "<font color='a10303'><strong>중복된 아이디가있습니다</strong></font><br>";
        		txtid.value="";
           }   
           else{
        	   iddiv.innerHTML = 
      			 "<br>";
           }
        	  
     }, 
     error:function(){ 
            alert("data error"); 
       } 
      });//$.ajax 
	

	//txtid.value="";
	txtid.placeholder="학번"

	id_check();
}

function pwChk(){
	if(txtpw.value==txtpw2.value){
		pwdiv.innerHTML = "<br>";
	}
	else{
		pwdiv.innerHTML = 
			 "<font color='a10303'><strong>PW 확인이 일치 하지 않습니다</strong></font><br>";
		txtpw2.value ="";
	}
	
	
	
}

function onload(){
	document.getElementById("login_card").style.height="450";
}

function test(){
	
}

function id_check(){ 
	   
	} 