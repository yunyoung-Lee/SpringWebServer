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
<script type="text/javascript" src="../script/jquery.serializeObject.js" ></script>
<script type="text/javascript">

function signUpValidation(){
	
	var userName = $("#userName").val();
	var userId = $("#userId").val();
	var userPw = $("#userPw").val();
	var userRepw = $("#userRepw").val();
	var userBirth = $("#userBirth").val();
	var userEmail = $("#userEmail").val();

	if(!userName){
		alert("이름 입력은 필수입니다.");
		$("#userName").focus();
	}else if(!userId){
		alert("아이디 입력은 필수입니다.");
		$("#userId").focus();
	}else if(!userPw){
		alert("비밀번호 입력은 필수입니다.");
		$("#userPw").focus();
	}else if(!userRepw){
		alert("비밀번호 확인 입력은 필수입니다.");
		$("#userRepw").focus();
	}else if(userPw != userRepw){
		alert("비밀번호가 맞지 않습니다.");
		$("#userRepw").focus();		
	}else if(!userBirth){
		alert("생일 입력은 필수입니다.");
		$("#userBirth").focus();
	}else if(!userEmail){
		alert("이메일 입력은 필수입니다.");
		$("#userEmail").focus();
	}else {
		signUp();
	}
	
}
	
function signUp(){
	var jsonObj = JSON.stringify($("#registerform").serializeObject());

	$.post("/ajax/join", //UserRestController
			$( "#registerform" ).serialize(),
		      function(data){
				if (data.code == 0)
					location.href = "/login";
				else if (data.code == 1) {
					alert("회원가입 실패했습니다!");	
				}
		      }, "json");
	
}

</script>
<title>회원가입</title>
</head>
<body class="bg-primary">

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
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4 border-secondary mb-3"><img src="/images/Logo.jpg" alt="Logo" style="width: 230px;"></h3></div>
                                    <div class="card-body">
                                        <form id="registerform">
                                        	<div class="form-floating mb-3">
                                                <input class="form-control" id="userName" name="userName" type="text" placeholder="이름" />
                                                <label>이름</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userBirth" name="userBirth" type="text" placeholder="생년월일 (8자리)" />
                                                <label>생년월일 (8자리)</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userId" name="userId" type="text" placeholder="아이디" />
                                                <label>아이디</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="userEmail" name="userEmail" type="email" placeholder="name@example.com" />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userPw" name="userPw" type="password" placeholder="Create a password" />
                                                        <label for="inputPassword">Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="userRepw" name="userRepw" type="password" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">Confirm Password</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><a class="btn btn-dark" href="javascript:signUpValidation();">회원가입</a></div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3" style = "text-decoration: none;">
                                        <button class="btn btn-outline-dark" type="button" onclick="location.href='/login'">LOGIN</button>
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