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
function boardInsert(){
	/* 
	var subject = $("#subject").val();
	var content = $("#content").val();
	var writer = $("#writer").val();
	var files = $("#files").val();
	 */
	
	
	$.ajax({
        url: '/ajax/boardInsert',
        type: 'post',
        enctype: 'multipart/form-data',
        processData: false, //데이터를 쿼리 문자열로 변환하는 jQuery 형식 방지
        contentType: false,
        dataType: 'json',
        cache: false,
        mimeType: "multipart/form-data",
        data: new FormData($("#insertform")[0]),//파일업로드를 위해, FormDataAPI사용
        success: function (data) {
        	location.href = "/list";
        },
        error: function (err) {
        	
        }
    });
	
	
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
		
		
		
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
			
				<div class="p-3 mb-2 bg-secondary text-white"><div style = "font-family: 'HSSaemaul-Regular'; font-size:30px;"><i class="fas fa-calendar-minus"></i>&nbsp;게시글 상세보기</div></div>
				
				<div class="card mb-4">
 
					<div class="container" style = "padding:40px;">
					    <form id="insertform">
					      <div class="form-group" style = "padding-bottom:20px;">
					        <label for="subject">제목</label><br>
					        <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
					      </div>
					      <div class="form-group" style = "padding-bottom:20px;">
					        <label for="writer">작성자</label><br>
					        <input type="text" class="form-control" id="writer" name="writer" placeholder="내용을 입력하세요.">
					      </div>
					      <div class="form-group" style = "padding-bottom:20px;">
					        <label for="content">내용</label><br>
					        <textarea class="form-control" id="content" name="content" rows="3"></textarea>
					      </div>
					      	<div style="text-align:left;"> <!-- 파일첨부 ㅜㅜ -->
					      		<input type="file"  id="files" name="files">
					 		</div>
	     					<div class = "button">
	     						<div style="text-align:right;">
	     							<a class="btn btn-dark" style="width:80px;" href="javascript:boardInsert();">작성</a>
								</div>
								<div style="text-align:left; padding-top:20px;">
	     						<button class="btn btn-success" type="button" onclick="location.href='/list'">게시판으로 이동하기</button>
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

