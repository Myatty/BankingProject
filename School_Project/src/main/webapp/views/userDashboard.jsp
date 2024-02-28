<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cashnex.controller.adminDashboardController"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.cashnex.model.User"%>
<%@ page import="com.cashnex.dao.UserDao"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<title>User Account Dashboard</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/userDashboard.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<style>
header, .logo {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.container {
	background-image:
		url("${pageContext.request.contextPath}/resources/images/bg.png");
	background-size: cover;
	position: relative;
	background-color: #ffff;
	padding: 25px;
	border-radius: 28px;
	max-width: 330px;
	width: 100%;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	max-height: 250px;
	margin-right: auto; /* Move the container to the left */
	margin-left: 0; /* Reset margin-left */
}

h5 {
	color: #f4f8fb;
	font-size: 16px;
}

h6, h7 {
	color: #f4f8fb;
	margin-top: 1px;
}

h6.number {
	margin-top: 0px;
	font-size: 15px;
	letter-spacing: 1px;
}

h5.name {
	margin-top: 20px;
	font-size: 18px;
}

.container .card-details {
	margin-top: 20px;
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

h7 {
	font-size: 12px;
}
</style>

</head>
<body class="sb-nav-fixed">

	<!-- JSTL Setup -->
	<c:set var="userId" value="${sessionScope.userId}" />
	<c:set var="userDao" value="<%=new UserDao()%>" />
	<c:set var="user" value="${userDao.getUserByUserId(userId)}" />

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="#" id="logo"><span
			class="brand">C</span>ash<span class="brand">N</span>ex</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->

		<!-- Navbar-->
		<ul class="navbar-nav ms-auto me-3 me-lg-4">
			<!-- Changed ms-md-0 to ms-auto -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i
					class="fas fa-user fa-fw"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item"
						href="${pageContext.request.contextPath}/views/userLogin.jsp">Logout</a></li>
				</ul></li>
		</ul>

	</nav>
	<div id="layoutSidenav" class="d-flex flex-column">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">About Me</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> My Account
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">My Profile</a> <a
									class="nav-link" href="layout-sidenav-light.html">
									Transactions</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>

							</nav>
						</div>

					</div>

				</div>
				<div class="sb-sidenav-footer mt-auto">
					<div class="small">Logged in as:</div>
					<span class="username">${user.username}</span>
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content" class="flex-grow-1">
			<main class="card_section" style="background-color: #f5f4f2;">
				<div class="container-fluid px-4">

					<div class="container mt-3">
						<header style="display: flex; align-items: center;">
							<span class="master_logo"
								style="display: flex; align-items: center;"> <img
								src="${pageContext.request.contextPath}/resources/images/logo.png"
								alt="" style="width: 38px;" />
								<h6 style="margin-left: 10px;">Master Card</h6>
							</span> <img
								src="${pageContext.request.contextPath}/resources/images/chip.png"
								alt="" class="chip" style="width: 50px;" />
						</header>

						<div class="card-details">
							<div class="name-number">
								<h5>Card Number</h5>
								<h6 class="number">
									<c:set var="accountNumber" value="${user.accountNumber}" />
									<c:out value="${fn:substring(accountNumber, 0, 4)}" />
									&hairsp;
									<c:out value="${fn:substring(accountNumber, 4, 8)}" />
									&hairsp;
									<c:out value="${fn:substring(accountNumber, 8, 12)}" />
									&hairsp;
									<c:out value="${fn:substring(accountNumber, 12, 16)}" />
								</h6>

								<h5 class="name">${user.username}</h5>
							</div>
							<div class="valid-date">
								<h7>Exp Date</h7>
								<h5>05/28</h5>
							</div>
						</div>

					</div>

				</div>
				<div>


					<c:out value="${userId}" />
					<c:out value="${user.username}" />
					<c:out value="${user.email}" />
				</div>
			</main>
		</div>



		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			crossorigin="anonymous"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
			crossorigin="anonymous"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/chart-area-demo.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/chart-bar-demo.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
			crossorigin="anonymous"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/datatables-simple-demo.js"></script>
		<%@ include file="footer.jsp"%>