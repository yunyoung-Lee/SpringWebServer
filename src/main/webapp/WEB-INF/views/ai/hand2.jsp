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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script type="text/javascript" src="../script/sb.admin.scripts.js"></script>

<script type="text/javascript">

	var userId = "${Id}"; 
	function goHand(){
		
		$.ajax({
			
			url : "/ajax/FingerSendData/{userId}/{finger}/{seonsorIdx}",
			type:'POST',
			success:function(data){
				
			}
			
		})
	}
	///////////////////////////////////////////////
	$(document).ready(function () {
		$('#radioButton').click(function(){
			saveSensorAjax(getSensor1Data(), successCallback);
		});
	});
	
	
	function getSensor1Data() {
		
		return {
			  userId : userId,
			  behaviorOn : $('input[name="led_on"]:checked').val(),
			  behaviorOff : $('input[name="led_off"]:checked').val(),
			  sensorIdx : 1};
	}
	
	function getSensor2Data() {
		
		return {
			  userId : userId,
			  behaviorOn : $('input[name="led2_on"]:checked').val(),
			  behaviorOff : $('input[name="led2_off"]:checked').val(),
			  sensorIdx : 2,};
	}
	
	function successCallback (data) {
		if (data.code == 0){
			saveSensorAjax(getSensor2Data(), successCallbackByLocation);
		}
		else if (data.code == 1) {
			alert("등록에 실패했습니다!");	
		}
		
	}
	
	
	function successCallbackByLocation (data) {
		if (data.code == 0){
			location.href = "/mypage";
		}
		else if (data.code == 1) {
			alert("등록에 실패했습니다!");	
		}
		
	}
	 
	function saveSensorAjax (data, callBack) {
		$.post("/ajax/SensorSave", 
				 	data, 
				 	callBack,
				 	"json");
		
	}

	/* $function(){
		$('input[type="radio"][id="led1_On_2"]').on('click', function(){
			alert("선택");
			var chkValue = $('input[type=radio][id="led1_On_1"]:checked').val();
			  if(chkValue){
			             $('#test2').css('display','none');
			  }else{
			             $('#test2').css('display','display-block');
			  }
		})
	} */


// getter
/* let radioVal1 = $('input[name="led_on"]:checked').val();
let radioVal2 = $('input[name="led_off"]:checked').val();
let radioVal3 = $('input[name="led2_on"]:checked').val();
let radioVal4 = $('input[name="led2_off"]:checked').val(); */
/* alert(radioVal1);
alert(radioVal2);
alert(radioVal3);
alert(radioVal4);*/

/* function signUp(){
	var jsonObj = JSON.stringify($("#radioButton").serializeObject());
	
	let radioVal1 = $('input[name="led_on"]:checked').val();
    let radioVal2 = $('input[name="led_off"]:checked').val();
    let radioVal3 = $('input[name="led2_on"]:checked').val();
    let radioVal4 = $('input[name="led2_off"]:checked').val();
    
	$.post("/ajax/join", 
			$( "#radioButton" ).serialize(),
		      function(data){
				if (data.code == 0)
					location.href = "/login";
				else if (data.code == 1) {
					alert("회원가입 실패했습니다!");	
				}
		      }, "json");
	
} */
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden">

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
				<h2 class="mt-4">손동작 등록</h2><br>
				<a style="font-family: 'GowunBatang-Regular'; font-size: 20px;">
				</a>
				<div class="card mb-4">
					<div class="card-header">
						<div style = "float: left;">
							<i class="fa fa-spinner fa-spin fa-fw"></i></i>&nbsp;손동작 등록 중입니다.
						</div>
						<div style="float:right;">
						<button class="btn btn-primary" style="font-size: 0.7em;" onclick="location.href='/mypage'">취소</button>
						</div>
					</div>
					<div class="card-body"style="padding:50px;">
					<!-- 주의사항 넣기 !!!!!!!!!!!!!!!!!!!!!!!!!-->
					<form name="radioform">
					<div class = "LED1">
						<div class = "Button1_Name">
							<h3>LED 1 On</h3>
				  		</div>
				  		<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  		<label class="btn btn-dark active">
					    		<input type="radio" name="led_on" id="led1_On_1" autocomplete="off" value="1" checked> 1
							</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_on" id="led1_On_2" autocomplete="off" value="2"> 2
					  		</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_on" id="led1_On_3" autocomplete="off" value="3"> 3
					  		</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_on" id="led1_On_4" autocomplete="off" value="4"> 4
					  		</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_on" id="led1_On_5" autocomplete="off" value="5"> 5
					  		</label>
						</div>
						
						<div class = "Button1_Name">
							<h3>LED 1 Off</h3>
				  		</div>
				  		<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  		<label class="btn btn-dark active">
					    		<input type="radio" name="led_off" id="led1_Off_1" autocomplete="off" value="1" checked> 1
							</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_off" id="led1_Off_2" autocomplete="off" value="2"> 2
					  		</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_off" id="led1_Off_3" autocomplete="off" value="3"> 3
					  		</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_off" id="led1_Off_4" autocomplete="off" value="4"> 4
					  		</label>
					  		<label class="btn btn-dark">
					    		<input type="radio" name="led_off" id="led1_Off_5" autocomplete="off" value="5"> 5
					  		</label>
						</div>											
					</div>
					<div class = "LED2" style = "padding-top:20px;">
						<div class = "Button2_Name">
							<h3>LED 2 On</h3>
					  	</div>
					  	<div class="btn-group btn-group-toggle" data-toggle="buttons">
						  	<label class="btn btn-dark active">
						    	<input type="radio" name="led2_on" id="led2_On_1" autocomplete="off" value="1" checked> 1
							</label>
						  	<label class="btn btn-dark">
						    	<input type="radio" name="led2_on" id="led2_On_2" autocomplete="off" value="2"> 2
						  	</label>
						  	<label class="btn btn-dark">
						    	<input type="radio" name="led2_on" id="led2_On_3" autocomplete="off" value="3"> 3
						  	</label>
							<label class="btn btn-dark">
						    	<input type="radio" name="led2_on" id="led2_On_4" autocomplete="off" value="4"> 4
						  	</label>
						  	<label class="btn btn-dark">
						    	<input type="radio" name="led2_on" id="led2_On_5" autocomplete="off" value="5"> 5
						  	</label>
						</div>
						
						<div class = "Button2_Name">
							<h3>LED 2 Off</h3>
					  	</div>
					  	<div class="btn-group btn-group-toggle" data-toggle="buttons">
						  	<label class="btn btn-dark active">
						    	<input type="radio" name="led2_off" id="led2_Off_1" autocomplete="off" value="1" checked> 1
							</label>
						  	<label class="btn btn-dark">
						    	<input type="radio" name="led2_off" id="led2_Off_2" autocomplete="off" value="2"> 2
						  	</label>
						  	<label class="btn btn-dark">
						    	<input type="radio" name="led2_off" id="led2_Off_3" autocomplete="off" value="3"> 3
						  	</label>
							<label class="btn btn-dark">
						    	<input type="radio" name="led2_off" id="led2_Off_4" autocomplete="off" value="4"> 4
						  	</label>
						  	<label class="btn btn-dark">
						    	<input type="radio" name="led2_off" id="led2_Off_5" autocomplete="off" value="5"> 5
						  	</label>
						</div>		
					</div>
					</form>	
					
					<div style = "padding-top:20px;">
						<button type="button" id="radioButton" class="btn btn-dark">등록 완료</button>	
					</div>
						
					</div>
				</div>
			</div>
			</main>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- footer.jsp 불러오기 -->
		</div>
</body>
</html>