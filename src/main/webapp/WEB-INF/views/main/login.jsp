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
<script type="text/javascript" src="../script/sb.admin.scripts.js"></script>
<script type="text/javascript">
	function login() {
		document.getElementById("loginForm").submit();
	}
</script>
<title>회원가입</title>
</head>
<body class="bg-dark"> <!-- background="resources/images/mainImage.jpg"> -->

	<!--
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> 어두운 배경색: bg-dark
	<div class="container-fluid">
		<a class="navbar-brand" href="#"> 링크 이동 <img src="/images/Logo.png" alt="Logo" style="width: 230px;">
		</a> <span class="nabar-text" style="font-size: 20px; font-weight: bold; white-space: nowrap;"> 사용자 별 행동인식 웹 페이지 입니다. </span>
	</div>
	</nav>
	<br>
	<br> -->

	<!-- Content -->
	<div id="layoutAuthentication">
            <div id="layoutAuthentication_content" style = "background-image: url(/images/loginImage.jpg); background-size : cover;"> 
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
	                            <div class="col-lg-5">
	                                <div class="card shadow-lg border-0 rounded-lg mt-5 border-secondary mb-3">
	                                    <div class="card-header"><h3 class="text-center font-weight-normal my-4"><img src="/images/Logo.jpg" alt="Logo" style="width: 230px;"></h3></div>
	                                    <div class="card-body">
	                                        <form action="/j_security_check" method="post" id="loginForm">
	                                            <div class="form-floating mb-3">
	                                                <input class="form-control" id="username" name="username" placeholder="user ID" />
	                                                <label for="inputEmail">User ID</label>
	                                            </div>
	                                            <div class="form-floating mb-3">
	                                                <input class="form-control" id="inputPassword" name="password" type="password" placeholder="Password" />
	                                                <label for="inputPassword">Password</label>
	                                            </div>
	                                           
	                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
	                                                <a class="small" href="password.html"></a>
	                                                <a class="btn btn-dark" href="javascript:login();">로그인</a>
	                                            </div>
	                                        </form>
	                                    </div>
	                                    <div class="card-footer text-center py-3">
	                                       <button class="btn btn-outline-dark" type="button" onclick="location.href='/join'">회원가입</button>
	                                    </div>
	                                </div>
	                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">©AI_6조</div>
					<div>
						남영준 &middot; 오명균 &middot; 이윤영
					</div>
				</div>
			</div>
			</footer>
            </div>
        </div>





	
</body>
</html>