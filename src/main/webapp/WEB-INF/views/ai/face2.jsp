<!-- http://localhost:8080/web/login -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="/css/camera.css">
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
function message(){
	alert("잠시만 기다려주십시오.");
}

function goMedia(){
	
	$.ajax({
		
		url : "/ajax/createMovie",
		type:'POST',
		success:function(data){
			$("#realTimeImage").attr("src","/resources/videos/userVideo.mp4?time="+new Date().getTime())
		}
		
	})
}

function sendMedia(){
		
		$.ajax({
			
			url : "/ajax/sendMovie",
			type:'POST',
			success:function(data){
				$("#realTimeImage").attr("src","/resources/videos/userVideo.mp4?time="+new Date().getTime())
				alert("등록이 완료 되었습니다.");
				location.href = "/mypage";
			},
			error:function(request,status,error){
		        alert("등록이 실패되었습니다."); // 실패 시 처리
		       }
		})
	}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
@font-face {
    font-family: 'ONE-Mobile-POP';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden">

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
				<div class="p-3 mb-2 bg-warning text-white"><div style = "font-family: 'ONE-Mobile-POP'; font-size:35px;">얼굴 등록</div></div>
				<div class="card mb-4">
					<div class="card-header">
						<div style = "float: left;">
							<i class="fa fa-spinner fa-spin fa-fw"></i></i>&nbsp;얼굴 등록 중입니다.
						</div>
						<div style="float:right;">
						<button class="btn btn-primary" style="font-size: 0.7em;" onclick="location.href='/mypage'">취소</button>
						</div>
					</div>
					<div class="card-body" style="text-align : center;">
					<!-- 주의사항 넣기 !!!!!!!!!!!!!!!!!!!!!!!!!-->
					<div style="padding:10px;">
							 <video id="realTimeImage" controls src="/resources/videos/userVideo.mp4" width='900' height='470'>
						        not use video
						    </video>
							<!-- <img id="realTimeImage" class="profile" style="width:800px; height:auto;" src="/resources/images/mg_stream.jpg"> -->
					</div>
					<div style="padding:10px;">
						<button type="button" onclick="goMedia()" class="btn btn-dark">Receive</button> &nbsp;
						<button type="button" onclick="sendMedia(); message();" class="btn btn-dark">&nbsp; Send &nbsp;</button>
					</div>	
					</div>
				</div>
			</div>
			</main>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- footer.jsp 불러오기 -->
		</div>
	
</body>
</html>