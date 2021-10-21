<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link href="../css/background.css" rel="stylesheet">
<script type="text/javascript" src="../script/background.js"></script>
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
$(document).ready(function(){
	allBoardList();
});


function allBoardList(){
	$.post("/ajax/boardList", 
			"",
		      function(data){
				if (data.code == 0) {
					createHTmlTR(data.value);
				}
				else if (data.code == 1) {
					alert("회원가입 실패했습니다!");	
				}
		      }, "json");
	
}


	function createHTmlTR(data) {
		if (data && data.length > 0) {
			for (var i = 0; i < data.length; i++) {
				$("#boardTable").append(createTd(data[i]));
			}
			$(".clickEventCls").on("click", function (e) {
				var boardId = $(this).attr("boardId");
				location.href = "/detail/" + boardId;
			});
		}
	}
	
	function createTd(data) {
		var insertTr = "";
		insertTr += "<tr boardId='"+data.bno+"' class='clickEventCls'>";
		insertTr += "<td>" + data.bno + "</td>";
		insertTr += "<td>" + data.subject + "</td>";
		insertTr += "<td>" + data.writer + "</td>";
		insertTr += "<td>" + data.regDateStr + "</td>";
		insertTr += "</tr>";
		return insertTr;
	}
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
/* table,th,td{
width: 1000px;
border: 1px solid black;
} */
</style>
<title>Javis Camera 홈페이지</title>
</head>
<body class="sb-nav-fixed" style="overflow-x: hidden">

<%@ include file="/WEB-INF/views/layout/header.jsp" %> <!-- header.jsp 불러오기 -->
		
		
		
		<div id="layoutSidenav_content">
			<main>
			<div class="scroll" >
				<div style="padding: 100px 0px;">
					<div style = "height:60px; padding-top:10px; background-color: rgba( 0, 0, 0, 0.5 );">
     					<h1>공지사항</h1>
     				</div>
     			</div>
			</div>
			<div class="container-fluid px-4">
					
					<div class="card-body" style="text-align : center;">
						
						<div class="container" style = "padding:20px;">
							<div style = "padding-top:10px; padding-bottom:20px; text-align : right;">
								<button class="btn btn-dark" type="button" onclick="location.href='/insert'">게시물 쓰기</button>
							</div>
						    <table class="table table-striped table-dark table-hover" id="boardTable">
						        <tr>
						            <th>No</th>
						            <th>Subject</th>
						            <th>Writer</th>
						            <th>Date</th>
						        </tr>
						     </table>
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
