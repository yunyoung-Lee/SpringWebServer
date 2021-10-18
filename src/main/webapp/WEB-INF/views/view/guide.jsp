<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> <!-- spring url 쓰려면 필요 -->
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/style.css" rel="stylesheet" type="text/css">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- font awesome -->
<title>Javis Camera 홈페이지</title>

<style>
	@font-face {
    font-family: 'GowunBatang-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'GowunBatang-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	/* 왼쪽 메뉴바 */ 
	nav{ 
        width:200px; /* 메뉴바 가로 넓이 */
        position:fixed; /*공중에 떠서 공간을 차지하지 않음*/
        height:100%; /*fixed를 해서 높이 100%가 가능해짐, fixed없이 height 100% -> 적용되지 않는다. */
    }
    
    h2{ font-size:25px;  padding:20px; } /* 글자 '카테고리' 부분 */


     .menu li a:hover { background-color:yellowgreen; color:white;} 
	
	.footer{
	    /* position: absolute;
	 	bottom:0;	
	 	width:100%;  */
	 	position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		color: white;
		background-color: black;
	 }
    
</style>

</head>
<body  style="overflow-y:hidden" > <!-- 스크롤바 없애기 / 배경이미지 -->

<!-- navigation -->
<div class="navbar navbar-expand-lg navbar-light bg-light"> <!-- 어두운 배경색: bg-dark -->
    <div class="container-fluid">
        <a class="navbar-brand" href="#"> <!-- 링크 이동 -->
        	<img src="<spring:url value='/resources/images/Logo.png'/>" alt="Logo" style = "width:230px;" OnClick="location.href ='/home'";>
        </a>
    <span class="nabar-text" style="font-size: 20px; font-weight:bold; white-space: nowrap;">
    	사용자 별 행동인식 웹 페이지 입니다.
    </span>
    </div>
</div>
<br><br>
<!-- 메뉴바 -->
<!-- 왼쪽 메뉴바 -->
	<nav class="left_sub_menu" style = "background-color:black; opacity:0.8;">
			<h2 style = "font-family:'GowunBatang-Bold'; color:#ffffff;">카테고리</h2>
			<ul class="menu">
				<li style = " list-style: none;"> <a href="/hardware" style = "font-family:'GowunBatang-Regular'; 
				text-decoration:none; font-size:20px; color:#fff14a;"> 하드웨어 조작 </a> </li>
			</ul>
	</nav>
<!-- 오른쪽 메뉴바 -->
	<div
		style="position: relative; float: right; top: 80px; height: 100%; font-family: verdana; background-color: #f5fbff; text-align: center;">

		<a style="font-family: 'GowunBatang-Regular'; font-size: 20px;">
			환영합니다. ${sessionScope.loginUser.userName}님! <br> <br>
		</a>
		<!-- <a href="/jquery/logout" style = "font-family:'GowunBatang-Regular'; text-decoration:none; color:black; font-size:20px;">
		로그아웃
			</a> -->
		<input type="button" onclick="location.href = '/logout' "
			style="background-color: white; border: 3px solid skyblue;"
			value="로그아웃" /> <br>
		<br> <a href="/mypage"
			style="font-family: 'GowunBatang-Regular'; text-decoration: none; color: black; font-size: 20px;">
			마이 페이지 </a> <br>
		<br>

		<!-- 사용 설명서 -->
		<div OnClick="location.href ='/guide'"
			style="font-family: 'GowunBatang-Regular'; font-size: 20px; border-top:1px solid skyblue; cursor: pointer;">
			<br><br> 사용 설명서<br>바로가기<br>
			<br> <i class="fas fa-question-circle fa-7x" style="color: red"></i>
		</div>
		<br><br>
	</div>



<!-- Content -->
	
	
 	<div class="container">
	<center><h2>공지사항</h2></center>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						
						<td>01</td>
						<td>안녕하세요</td>
						<td>2021-08-02</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	
	
	
	


	<!-- 하단 -->
 <div class="footer">    
	<div class = "mb-5 container-fluid">
	    <br>
	    <p>©AI_ | 남00ㆍ오00ㆍ이00입니다. &nbsp;</p>
		<!-- <a href="#">Privacy</a> ㆍ <a href="#">Terms</a> -->
	</div>	
</div> 
</body>
</html>


