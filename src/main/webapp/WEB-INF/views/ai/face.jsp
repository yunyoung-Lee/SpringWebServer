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

</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden">

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
				<h2 class="mt-4">인물 등록</h2><br>
				<a style="font-family: 'GowunBatang-Regular'; font-size: 20px;">
				</a>
				<div class="card mb-4">
					<div class="card-header">
						<div style = "float: left;">
							<i class="far fa-grin-wink"></i>&nbsp; 인물등록
						</div>
						<div style="float:right;">
						<button class="btn btn-primary" style="font-size: 0.7em;" onclick="location.href='/mypage'">취소</button>
						</div>
					</div>
					<div class="card-body"style="padding:50px;">
					<!-- 주의사항 넣기 !!!!!!!!!!!!!!!!!!!!!!!!!-->
						<div class="card text-white bg-dark mb-3" style="max-width: auto; text-align : center;">
							  <div class="card-header">주의사항</div>
							  <div class="card-body">
							    <h5 class="card-title">주의사항 필독!</h5>
							    <p class="card-text">주의 사항 여기에 적어두기!</p>
							  </div>
						</div>
						<div style="padding-top:20px; text-align : center;">
							인물 등록을 시작하시겠습니까? &nbsp;
							<button id="btn1" class="btn btn-warning"onclick="location.href='/face2'">Yes</button>
							<!-- <button id="btn1" class="btn btn-warning"onclick="location.href='/mypage'" style="cursor:pointer;">취소</button> -->
						</div>
					</div>
				</div>
			</div>
			</main>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- footer.jsp 불러오기 -->
		</div>

	
	
	
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>