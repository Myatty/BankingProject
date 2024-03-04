<%@ include file="header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cashnex.controller.UserDashboardController"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.cashnex.model.User"%>
<%@ page import="com.cashnex.dao.UserDao"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<title>Loan Info</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/Loan.css?version=2"
	rel="stylesheet" />

<style>
header, .logo {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.mc-card-container {
	background-image:
		url("${pageContext.request.contextPath}/resources/images/bg.png");
	background-size: cover;
	position: relative;
	background-color: #ffff;
	padding: 25px;
	border-radius: 28px;
	width: 330px;
	max-height: 250px;
	margin-right: auto;
	/* Move the container to the left */
	margin-left: 0;
	/* Reset margin-left */
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

.side-main-wrapper {
	width: 90%;
	margin: auto;
}

.indiv-balance {
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}

.input-field {
	margin-top: 15px;
	display: flex;
	flex-direction: column;
}

.input-field input {
	height: 40px;
	padding: 5px;
	padding-left: 10px;
}
</style>

</head>

<body class="sb-nav-fixed">

	<!-- JSTL Setup -->
	<c:set var="userId" value="${sessionScope.userId}" />
	<c:set var="userDao" value="<%=new UserDao()%>" />
	<c:set var="user" value="${userDao.getUserByUserId(userId)}" />
	<!--Pop Up-->
	<div class="popup-wrapper hide" id="loan-req-popup">

		<div class="popup-center" id="">
			<div class="header">
				<h3 class="title">
					Loan Request Form <span id="user_name"></span>
				</h3>
				<button type="button" class="btn-close text-reset"
					style="position: absolute; top: 5%; right: 5%;"
					onclick="togglePopup('loan-req-popup', true)"></button>
			</div>
			<div class="bb" id="0912">
				<form method="post"
					action="${pageContext.request.contextPath}/adminDashboardController?action=ADD_BALANCE&id="
					style="padding: 30px;">
					<div class="input-field">
						<label for="">Amount</label> <input type="number" name="amount" class="rounded-3 border-1"
							required>
					</div>
					<div class="input-field">
						<label for="">Reason</label> <input type="text" name="Reason" class="rounded-3 border-1"
							required>
					</div>
					<div class="input-field">
						<label for="">Documentation supporting special
							circumstances</label> <input type="file" name="file"
							style="border: 1px solid var(--bs-gray);" class="rounded-3 border-1">
					</div>
					<div class="input-field">
						<label for="">Estimated to pay back</label> <input type="date"
							name="date" class="rounded-3 border-1" required>
					</div>
					<div style="display: flex; justify-content: space-around"
						class="pt-5">
						<button type="submit" class="btn btn-primary">Request Now</button>
						<a href="${pageContext.request.contextPath}/views/termsNcon.html">Read
							Term and Conditions!!</a>
					</div>

				</form>
			</div>
		</div>

	</div>
	<div class="popup-wrapper hide" id="pay-loans-popup">

		<div class="popup-center" style="width: 90vw;">
			<div class="header">
				<h3 class="title">Pay Loan</h3>
				<small>click on the table on the right for loan payments</small>
				<button type="button" class="btn-close text-reset"
					style="position: absolute; top: 5%; right: 5%;"
					onclick="togglePopup('pay-loans-popup', true)"></button>
			</div>
			<div class="formNtable" id="1904">
				<form method="post"
					action="${pageContext.request.contextPath}/adminDashboardController?action=ADD_BALANCE&id="
					style="padding: 30px; width: 40%;">
					<div class="input-field">
						<label for="">Loan ID</label> <input type="text" name="Reason"
							disabled id="pay_loan_id">
					</div>
					<div class="input-field">
						<label for="">Account Number</label> <input type="text"
							name="Reason" disabled id="pay_loan_acc_num">
					</div>
					<div class="input-field">
						<label for="">Left Amount</label> <input type="text" name="Reason"
							disabled id="pay_loan_left_amount">
					</div>
					<div class="input-field">
						<label for="">Pay Back Amount</label>
						<div class="d-flex">
							<input type="range" name="payLoanAmount" min="0" max="1000"
								required id="payLoanRange" class="flex-grow-1 form-range">
							<input type="text" pattern="[0-9]" id="payLoanValue"
								style="padding: 5px; width: 5em; border: none;">
						</div>

					</div>
					<div style="display: flex; justify-content: left" class="pt-5">
						<button type="submit" class="btn btn-primary">Pay Now</button>
					</div>

				</form>
				<div class="container mt-4" style="box-shadow: none;">
					<div class="card-header" style="background-color: inherit;">
						<i class="fas fa-table me-1"></i>Loan History
					</div>
					<div class="card-body">
						<div
							class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
							<div class="datatable-container">
								<table class="datatable-table table" id="datatablesSimple">
									<thead>
										<tr>
											<th>Loan ID</th>
											<th>User Name</th>
											<th>Account Number</th>
											<th>Reason</th>
											<th>Loan Amount</th>
											<th>Paid Amount</th>
											<th>Due Date</th>
											<th>Actions</th>
										</tr>
									</thead>
									<!--  Following needs to be configured -->
									<!-- <tfoot>
                    <tr>
                      <th>User Name</th>
                      <th>Gmail</th>
                      <th>Career</th>
                      <th>Balance</th>
                      <th>Actions</th>
                    </tr>
                    </tfoot> -->
									<tbody>
										<c:forEach items="${userList}" var="user">
											<tr class="table-active" id="${loan.id}"
												onclick="fillIn(this.id)">
												<td>Loan ID</td>
												<td>User Name</td>
												<td>Account Number</td>
												<td>Reason</td>
												<td>Loan Amount</td>
												<td>Paid Amount</td>
												<td>Due Date</td>
												<td>Actions</td>
											</tr>
											<tr class="table-active" id="aadfadf"
												onclick="fillIn(this.id)">
												<td>12321</td>
												<td>Gae</td>
												<td>12341324134</td>
												<td>Reason</td>
												<td>100000</td>
												<td>555</td>
												<td>Due Date</td>
												<td>Actions</td>
											</tr>
											<tr class="table-danger" id="${loan.id_placeholder}"
												onclick="fillIn(this.id)">
												<td>Loan ID</td>
												<td>User Name</td>
												<td>Account Number</td>
												<td>Reason</td>
												<td>Loan Amount</td>
												<td>Paid Amount</td>
												<td>Due Date</td>
												<td>Actions</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>

						</div>
						<div class="datatable-bottom">
							<div class="datatable-info">Showing 1 to 10 of 17 entries</div>
							<nav class="datatable-pagination">
								<ul class="datatable-pagination-list">
									<li
										class="datatable-pagination-list-item datatable-hidden datatable-disabled"><a
										data-page="1" class="datatable-pagination-list-item-link">&lsaquo;</a></li>
									<li class="datatable-pagination-list-item datatable-active"><a
										data-page="1" class="datatable-pagination-list-item-link">1</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="2" class="datatable-pagination-list-item-link">2</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="3" class="datatable-pagination-list-item-link">3</a></li>
									<li class="datatable-spagination-list-item"><a
										data-page="4" class="datatable-pagination-list-item-link">4</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="5" class="datatable-pagination-list-item-link">5</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="6" class="datatable-pagination-list-item-link">6</a></li>
									<li class="datatable-pagination-list-item"><a
										data-page="2" class="datatable-pagination-list-item-link">&rsaquo;</a></li>
								</ul>
							</nav>
						</div>

					</div>
					<footer class="py-4 bg-light mt-auto">
						<div class="container-fluid px-4">
							<div
								class="d-flex align-items-center justify-content-between small">
								<div class="text-muted">Copyright &copy; CashNex</div>
								<div>
									<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
										&amp; Conditions</a>
								</div>
							</div>
						</div>
					</footer>
				</div>
			</div>
		</div>

	</div>



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
					<li>
						<hr class="dropdown-divider" />
					</li>
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
						<a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/views/loan.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Loan
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

		<div id="layoutSidenav_content">
			<div class="mt-5 userdata-heading container"
				style="margin-top: 30px !important;">

				<div class="mt-5 side-main-wrapper ">
					<div class="balance-wrapper mt-4 border p-4 rounded-3 ">

						<h4>Loan Info</h4>
						<h4>
							<small>Account Number: ${user.account_number}</small>
						</h4>
						<div class="row mt-3">
							<div class="col-sm-3 indiv-balance rounded-2">
								<span>Total Loan</span>
								<h5>
									${user.total_loan} <sub>MMK</sub>
								</h5>
							</div>
							<div class="col-sm-3 indiv-balance rounded-2">
								<span data-toggle="tooltip" title="Added at the End of Month"
									data-placement="top" s>Monthly Interest</span>
								<h5>3%</h5>
							</div>
							<div class="col-sm-3 indiv-balance rounded-2">
								<button class="btn"
									style="background-color: var(--bs-blue); color: white"
									onclick="togglePopup('pay-loans-popup', false)">Pay
									Loan</button>
							</div>
							<div class="col-sm-3 indiv-balance rounded-2">
								<button class="btn"
									style="background-color: var(--brand-color); color: white"
									onclick="togglePopup('loan-req-popup', false)">Request
									Loan</button>
							</div>
						</div>

					</div>

				</div>


			</div>
			<div class="container mt-4" style="box-shadow: none;">
				<div class="card-header" style="background-color: inherit;">
					<i class="fas fa-table me-1"></i>Loan History
				</div>
				<div class="card-body">
					<div
						class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
						<div class="datatable-top">
							<div class="datatable-dropdown">
								<label> <select id="entriesPerPage"
									class="datatable-selector">
										<option value="5">5</option>
										<option value="10" selected="">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
								</select> entries per page
								</label>

							</div>
							<div class="datatable-search">
								<input class="datatable-input" placeholder="Search..."
									type="search" title="Search within table"
									aria-controls="datatablesSimple">
							</div>

						</div>
						<div class="datatable-container">
							<table class="datatable-table table" id="datatablesSimple">
								<thead>
									<tr>
										<th>Loan ID</th>
										<th>User Name</th>
										<th>Account Number</th>
										<th>Reason</th>
										<th>Loan Amount</th>
										<th>Paid Amount</th>
										<th>Due Date</th>
										<th>Fully Paid Date</th>
										<th>Actions</th>
									</tr>
								</thead>
								<!--  Following needs to be configured -->
								<!-- <tfoot>
            <tr>
              <th>User Name</th>
              <th>Gmail</th>
              <th>Career</th>
              <th>Balance</th>
              <th>Actions</th>
            </tr>
            </tfoot> -->
								<tbody>
									<c:forEach items="${userList}" var="user">
										<tr class="table-active">
											<td>Loan ID</td>
											<td>User Name</td>
											<td>Account Number</td>
											<td>Reason</td>
											<td>Loan Amount</td>
											<td>Paid Amount</td>
											<td>Due Date</td>
											<td>Fully Paid Date</td>
											<td>Actions</td>
										</tr>

									</c:forEach>
									<tr class="table-success">
										<td>Loan ID</td>
										<td>User Name</td>
										<td>Account Number</td>
										<td>Reason</td>
										<td>Loan Amount</td>
										<td>Paid Amount</td>
										<td>Due Date</td>
										<td>Fully Paid Date</td>
										<td>Actions</td>
									</tr>

									<tr class="table-danger">
										<td>Loan ID</td>
										<td>User Name</td>
										<td>Account Number</td>
										<td>Reason</td>
										<td>Loan Amount</td>
										<td>Paid Amount</td>
										<td>Due Date</td>
										<td>Fully Paid Date</td>
										<td>Actions</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
					<div class="datatable-bottom">
						<div class="datatable-info">Showing 1 to 10 of 17 entries</div>
						<nav class="datatable-pagination">
							<ul class="datatable-pagination-list">
								<li
									class="datatable-pagination-list-item datatable-hidden datatable-disabled"><a
									data-page="1" class="datatable-pagination-list-item-link">&lsaquo;</a></li>
								<li class="datatable-pagination-list-item datatable-active"><a
									data-page="1" class="datatable-pagination-list-item-link">1</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">2</a></li>
								<li class="datatable-pagination-list-item"><a data-page="3"
									class="datatable-pagination-list-item-link">3</a></li>
								<li class="datatable-spagination-list-item"><a
									data-page="4" class="datatable-pagination-list-item-link">4</a></li>
								<li class="datatable-pagination-list-item"><a data-page="5"
									class="datatable-pagination-list-item-link">5</a></li>
								<li class="datatable-pagination-list-item"><a data-page="6"
									class="datatable-pagination-list-item-link">6</a></li>
								<li class="datatable-pagination-list-item"><a data-page="2"
									class="datatable-pagination-list-item-link">&rsaquo;</a></li>
							</ul>
						</nav>
					</div>

				</div>
				<footer class="py-4 bg-light mt-auto">
					<div class="container-fluid px-4">
						<div
							class="d-flex align-items-center justify-content-between small">
							<div class="text-muted">Copyright &copy; CashNex</div>
							<div>
								<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
									&amp; Conditions</a>
							</div>
						</div>
					</div>
				</footer>
			</div>
		</div>

	</div>

</body>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
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