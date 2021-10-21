<!-- http://localhost:8080/web/login -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="../css/Mainbackground.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="../css/jquery-ui.css" rel="stylesheet">
<link href="../css/jquery-ui.structure.css" rel="stylesheet">
<link href="../css/jquery-ui.theme.css" rel="stylesheet">
<script type="text/javascript" src="../script/background.js"></script>
<script type="text/javascript" src="../script/jquery.js"></script>
<script type="text/javascript" src="../script/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script type="text/javascript" src="../script/sb.admin.scripts.js"></script>
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script> -->
<script src="http://172.20.10.11:3000/socket.io/socket.io.js"></script>
<script type="text/javascript">

	var socket = io.connect("http://172.20.10.11:3000");
	socket.emit("start-stream");

	socket.on("liveStream", function (url) {
  	$("#stream").attr("src", "data:image/jpg;base64," + url.buffer);
  $(".start").show();
});
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden;" >

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		
		<div id="layoutSidenav_content">
			<main>
			<div class="scroll" >
				<div style="padding: 100px 0px;">
					<div style = "height:60px; padding-top:10px; background-color: rgba( 0, 0, 0, 0.5 );">
     					<h1>실시간 영상</h1>
     				</div>
     			</div>
			</div>
			<div class="container-fluid px-4">
				<a style="font-family: 'GowunBatang-Regular'; font-size: 20px;">
				</a>
					
					<div class="card-body" style="text-align : center;">
						<!-- <img width="640" height="480" src="" id="stream" /> -->
						<br><br>
						<img width="1100" height="570" src="" id="stream" />
						<!-- <div style="padding:10px;">
							<img id="realTimeImage" class="profile" style="width:800px; height:auto;" src="/resources/images/mg_stream.jpg">
						</div>
						<div style="padding:10px;">
							<button type="button" onclick="goMedia()" class="btn btn-dark">Receive</button> &nbsp;
							<button type="button" onclick="sendMedia()" class="btn btn-dark">&nbsp; Send &nbsp;</button>
						</div> -->
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