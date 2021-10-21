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
var bno = <%=request.getAttribute("bno")%>;

$(document).ready(function(){
	getBoard();
});


function getBoard(){
	$.post("/ajax/boardDetail/"+ bno, 
			"",
		      function(data){
				if (data.code == 0) {
					setElement(data.value);
				}
				else if (data.code == 1) {
					alert("회원가입 실패했습니다!");	
				}
		      }, "json");
	
}

function setElement(data) {
	$("#detailSubjectId").html(data.board.subject);
	$("#detailWriterId").html(data.board.writer);
	$("#detailRegDateStrId").html(data.board.regDateStr);
	var x = data.board.content.replace(/\n/gi, '<br>'); //줄바꿈 해준다.
	$("#detailContentId").html(x);
	$("#fileLink").html("<a href='/fileDownload/"+data.file.fno+"'>"+data.file.fileOriName+"</a>");
}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
@font-face {
    font-family: 'HSSaemaul-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSSaemaul-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden">

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		
		<div id="layoutSidenav_content" >
			<main>
			<div class="container-fluid">
				<div class="p-3 mb-2 bg-secondary text-white"><div style = "font-family: 'HSSaemaul-Regular'; font-size:30px;">게시글 상세보기</div></div>
				<br>
				<div class="card mb-4">
 
						<div class="container" style="padding:18px;">
					    <form action="/insertProc" method="post">
					      <div class="form-group">
					        <label style="padding-bottom:5px; font-family: 'Pretendard-Regular';">제목</label>
					        <p id="detailSubjectId" style="background-color:#f2f6f7; font-weight: bold; padding:10px;"></p>
					      </div>
					      <div class="form-group">
					        <label style="padding-bottom:5px; font-family: 'Pretendard-Regular';">작성자</label>
					        <p id="detailWriterId" style="background-color:#f2f6f7; font-weight: bold; padding:10px;"></p> <%-- <p>${detail.writer}</p> --%>
					      </div>
					      <div class="form-group">
					        <label style="padding-bottom:5px; font-family: 'Pretendard-Regular';">작성날짜</label>
					        <p id="detailRegDateStrId" style="background-color:#f2f6f7; font-weight: bold; padding:10px;"></p> <%-- <p>${detail.reg_date}</p> --%>
					      </div>
					      <div class="form-group"> <!-- 첨부파일 다운로드 -->
					        <label style="padding-bottom:5px; font-family: 'Pretendard-Regular';">첨부파일</label>
					         <p id="fileLink" style="background-color:#f2f6f7; padding:10px;"></p>
					         <!-- <p id="fileLink"></p>detailRegDateStrId -->
					      </div>              
					      <div class="form-group">
					        <label style="padding-bottom:5px; font-family: 'Pretendard-Regular';">내용</label>
					        <p id="detailContentId" style="background-color:#f2f6f7; font-weight: bold; padding:10px;"></p>
					        <%-- <p>${detail.content}</p> --%>
					      </div>
					      	<div class="FooterButton">
						      	<div padding:15px;">
									<button class="btn btn-success" type="button" onclick="location.href='/list'">게시판으로 이동하기</button>
									<a href="/delete/${bno}"><button class="btn btn-danger" type="button">게시물 삭제</button></a>
									<!-- <button class = "btn btn-outline-dark" onClick="/delete/{bno}" type="button">삭제</button> -->
								</div>
							</div>
					    </form>
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



