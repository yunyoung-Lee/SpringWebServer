<!-- http://localhost:8080/web/login -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link href="../css/style.css" rel="stylesheet">
<link href="../css/jquery-ui.css" rel="stylesheet">
<link href="../css/jquery-ui.structure.css" rel="stylesheet">
<link href="../css/jquery-ui.theme.css" rel="stylesheet">
<script type="text/javascript" src="../script/jquery.js"></script>
<script type="text/javascript" src="../script/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script type="text/javascript" src="../script/sb.admin.scripts.js"></script>
<script type="text/javascript">
var userId = "${Id}"; 
console.log("userId: "+userId);
//버튼 이미지 변경
function bulb1_On() { //LED_1_ON
	//img 요소의 src속성을 변경
	var img = document.getElementById("img_bulb");	
	img.src="/images/iot_on.png";

		//불 켜고나면 on 버튼 비활성화
		document.getElementById("btn1_On").disabled="disabled";//비활성화
		document.getElementById("btn1_Off").disabled=false;
		
		$.ajax({
			url : "/ajax/sendIot/"+userId+"/1/true",
			type:'POST',
			
			error: function (e) {
				alert('실패!');
			      	console.log(e.responseText);
			}
		})

}

function bulb1_Off() { //LED_1_OFF
	//img 요소의 src속성을 변경
	var img = document.getElementById("img_bulb");
	img.src="/images/iot_off.png";

		
		document.getElementById("btn1_On").disabled=false;
		document.getElementById("btn1_Off").disabled="disabled";//비활성화
		
		$.ajax({
			url : "/ajax/sendIot/"+userId+"/1/false",
			type:'POST',
		})
	}
	

function bulb2_On() { //LED_2_ON
	//img 요소의 src속성을 변경
	var img = document.getElementById("img_bulb2");	
	img.src="/images/iot_on2.png";
	
		
	//불 켜고나면 on 버튼 비활성화
		document.getElementById("btn2_On").disabled="disabled"; //비활성화
		document.getElementById("btn2_Off").disabled=false;
		
		$.ajax({
			url : "/ajax/sendIot/"+userId+"/2/true",
			type:'POST',
		})
}

function bulb2_Off() { //LED_2_OFF
	//img 요소의 src속성을 변경
	var img = document.getElementById("img_bulb2");
	img.src="/images/iot_off2.png";

		
		document.getElementById("btn2_On").disabled=false;
		document.getElementById("btn2_Off").disabled="disabled";//비활성화
		
		$.ajax({
			url : "/ajax/sendIot/"+userId+"/2/false",
			type:'POST',
		})
	}
	
	
/* $.ajax({
	url : "http://192.168.30.29:3000/ledState",
	type:'POST',
}) */

$(document).ready(function () { //led 1번 상태 유지
	$.ajax({
		url : "http://192.168.30.29:3000/led1State",
		type:'POST',
		success:function(data){
			var img = document.getElementById("img_bulb");
			if (data == "1") {
				//불 켜고나면 on 버튼 비활성화
				document.getElementById("btn1_On").disabled=true;
				document.getElementById("btn1_Off").disabled=false;
				
				img.src="/images/iot_on.png";
			} else {
				document.getElementById("btn1_On").disabled=false;
				document.getElementById("btn1_Off").disabled=true;
				img.src="/images/iot_off.png";
			}
		}
	})	;
	
	
	$.ajax({
		url : "http://192.168.30.29:3000/led2State", //led 2번 상태 유지
		type:'POST',
		success:function(data){
			var img = document.getElementById("img_bulb2");
			if (data == "1") {
				//불 켜고나면 on 버튼 비활성화
				document.getElementById("btn2_On").disabled=true;
				document.getElementById("btn2_Off").disabled=false;
				
				img.src="/images/iot_on2.png";
			} else {
				document.getElementById("btn2_On").disabled=false;
				document.getElementById("btn2_Off").disabled=true;
				img.src="/images/iot_off2.png";
			}
		}
	})	;
});	
	

/* function control() {
	
	$.ajax({
		url : "/ajax/sendIot/${id}/1/true",
		type:'POST',
	})
} */

</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
@font-face {
    font-family: 'HSSaemaul-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSSaemaul-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* https://daspace.tistory.com/180 */
</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden; background-color:black;">

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
				
				<div style = "font-family: 'HSSaemaul-Regular'; font-size:40px; color:white; padding-top:10px;">IoT 센서 조작</div>
				<!-- <h2 class="mt-4" style="color:white;">IoT 센서 조작</h2><br> -->
				<div class="card-body" style="text-align : center;">
					
					<div class="button1" style = "padding-bottom:40px;">
						<img src="/images/iot_off.png" alt="" id="img_bulb" style = "width: 150px;. height:auto;"/>
						<br>
						<div>
							<button id="btn1_On" class="btn btn-warning" onclick="bulb1_On()" style = "padding-right:10px;">Turn On</button>
							<button id="btn1_Off" class="btn btn-light" onclick="bulb1_Off()">Turn Off</button>
						</div>
				
					<div class="button2">
						<img src="/images/iot_off2.png" alt="" id="img_bulb2" style = "width: 150px;. height:auto;"/>
						<br>
						<button id="btn2_On" class="btn btn-warning" onclick="bulb2_On()" style = "padding-right:10px;">Turn On</button>
						<button id="btn2_Off" class="btn btn-light" onclick="bulb2_Off()">Turn Off</button>
					</div>
				</div>
				</div>
			</main>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- footer.jsp 불러오기 -->
		</div>

</body>
</html>