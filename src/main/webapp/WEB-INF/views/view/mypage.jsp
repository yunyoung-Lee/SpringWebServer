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
</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden">

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
				<h2 class="mt-4" style="font-family: 'ONE-Mobile-POP'; font-size: 40px;"><i class="fas fa-user-alt"></i>&nbsp;My Page</h2><br>
				</a>
				<div class="card mb-4">
					
					<div class="card-body"style="padding:50px;">
					<!-- <div class="card bg-dark text-white" style = "width:1500px;">
					  <img class="card-img" src="/images/mypage_Image.jpg" alt="Card image">
					  <div class="card-img-overlay">
					    <h5 class="card-title">Card title</h5>
					    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					    <p class="card-text">Last updated 3 mins ago</p>
					  </div>
					</div> -->
					
					
					<!-- 여기부터 -->
						<div class="card" style="width: 18rem; padding-top:20px; text-align : center; margin:0 auto">
							<img class="card-img-top" src="/images/mypage_picture.jpg" alt="Card image cap">
							
							<div class="card-body">
								<!-- Name -->
								<h4 class="card-title font-weight-bold">${Name}</h4>
								<ul class="list-group list-group-flush">
									<li class="list-group-item"></li>
									<li class="list-group-item">생년월일: ${Birth}</li>
									<li class="list-group-item">이메일: ${Email}</li>
								</ul>
							</div>
						</div>
								  	
						<!-- 버튼 -->
						<div class="card-body2"style="padding-top:20px; text-align : center;">
							<div class = "goface" onclick="location.href='/face'" style="cursor:pointer;">
								<img src="/images/face.jpg" class="card-img-top"style = "padding-top: 10px; width:100px; height:auto;" alt="인물 등록">
								<h5 class="card-title" style = "padding-top:10px">얼굴 인식</h5>
							</div>
							<div class = "gohand" onclick="location.href='/hand'" style="cursor:pointer;">	
								<img src="/images/hand.jpg" class="card-img-top"style = "padding-top: 20px; width:100px; height:auto;" alt="손동작 등록">
							  	<h5 class="card-title" style = "padding-top:10px">손동작 인식</h5>
						  	</div>
						</div><!-- 여기까지 -->
						
						<!-- <div style="padding-top:20px; text-align : center;">
							인물 등록을 시작하시겠습니까? &nbsp;
							<button id="btn1" class="btn btn-warning"onclick="location.href='/face2'">Yes</button>
							<button id="btn1" class="btn btn-warning"onclick="location.href='/mypage'" style="cursor:pointer;">취소</button>
						</div> -->
					</div>
				</div>
			</div>
			</main>
			<%@ include file="/WEB-INF/views/layout/footer.jsp" %> <!-- footer.jsp 불러오기 -->
		</div>

	
</body>
</html>