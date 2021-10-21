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
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
@font-face {
    font-family: 'ONE-Mobile-POP';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff') format('woff');
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
			<div class="p-3 mb-2 bg-warning text-white"><div style = "font-family: 'ONE-Mobile-POP'; font-size:35px;">손동작 등록</div></div>
				<br>
				<div class="card mb-4">
					<div class="card-header">
						<div style = "float: left;">
							<i class="far fa-grin-wink"></i>&nbsp; 손동작 등록
						</div>
						<div style="float:right;">
						<button class="btn btn-primary" style="font-size: 0.8em;" onclick="location.href='/mypage'">취소</button>
						</div>
					</div>
					<div class="card-body"style="padding:50px;">
					<!-- 주의사항 넣기 !!!!!!!!!!!!!!!!!!!!!!!!!-->
						<div class="card text-white bg-dark mb-3" style="max-width: auto; text-align : center;">
							  <h3 class="card-header" style="font-family: 'ONE-Mobile-POP';">주의사항</h3>
							  <div class="card-body">
							    <!-- <h5 class="card-title">주의사항 필독!</h5> -->
							    <p class="card-text" style="font-family: 'GowunDodum-Regular'; font-size:20px;">센서별 ON/OFF 설정을 하십시오.<br>
									선택한 숫자만큼의 손가락을 카메라가 인식하면 센서를 조절할 수 있습니다.<br>
									반드시 같은 숫자가 겹치지 않도록 설정해주십시오.</p>
							  </div>
						</div>
						<div style="padding-top:20px; text-align : center;  font-size:20px;">
							<div style = " font-family: 'GowunDodum-Regular';">손동작 등록을 시작하시겠습니까? &nbsp;</div>
							<div style = "padding-top:15px;">
								<button id="btn1" class="btn btn-warning"onclick="location.href='/hand2'" style = "width:150px;">Yes</button>
							</div>
							<!-- <button id="btn1" class="btn btn-warning"onclick="location.href='/mypage'" style="cursor:pointer;">취소</button> -->
						</div>
					</div>
				</div>
			</div>
			</main>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- footer.jsp 불러오기 -->
		</div>

	
</body>
</html>