<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"> <!-- Navbar Brand--> 
	<a class="navbar-brand ps-3" href="/home" style = "font-family: 'Lobster', cursive; font-size : 22px;"><img src="/images/littlelogo.png" alt="Logo" style="width: 50px;">&nbsp; Javis Camera</a> <!-- Sidebar Toggle-->
	<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><!-- 메뉴 펼치기 -->
		<i class="fas fa-bars"></i><!-- 메뉴 아이콘 -->
	</button>
 	<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
    </form>
	<!-- Navbar Search--> <!-- Navbar-->
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
				<li><a class="dropdown-item" href="/mypage">My Page</a></li>
				<li><hr class="dropdown-divider" /></li>
				<li><a class="dropdown-item" href="/logout">Logout</a></li>
			</ul></li>
	</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"> <!-- 왼쪽 메뉴바 -->
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Main</div>
						<a class="nav-link" href="/home">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> Main
						</a> 
						<a class="nav-link" href="/list">
							<div class="sb-nav-link-icon">
								<i class="fas fa-exclamation-circle"></i>
							</div> Notice
						</a>
						
						<div class="sb-sidenav-menu-heading">Sensor</div>
						<a class="nav-link" href="/iotmain">
							<div class="sb-nav-link-icon">
								<i class="fas fa-home"></i>
							</div> IoT
						</a> 
						
						
						
						
						<!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> IOT
						</a> -->

					</div><!-- end nav -->
				</div>
				<div class="sb-sidenav-footer">
					<div class="small"> Logged in as: ${Id}</div>
				</div>
			</nav>
		</div>