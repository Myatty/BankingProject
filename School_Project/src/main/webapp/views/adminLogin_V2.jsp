<%@ include file="header.jsp"%>

<!--  Link tags -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home_style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/userRegistration_style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>

<body class="show-popup">

	<!-- Below For Eclipse-->


	<nav class="navbar navbar-expand-lg navbar-light bg-light">

		<div class="container">
			<a class="navbar-brand" href="#" id="logo"><span class="brand">C</span>ash<span
				class="brand">N</span>ex</a>
		</div>

	</nav>

	<div class="blur-bg-overlay"></div>

	<div class="form-popup" id="blur">
		<div class="form-box login">
			<div class="form-content">
				<h2>Admin Login</h2>
				<form method="post"
					action="${pageContext.request.contextPath}/adminLogin"
					onsubmit="showNotification()">
					<div class="input-field">
						<input type="text" name="adminUsername" required> <label>Name</label>
					</div>
					<div class="input-field" style="display: flex;">
						<input name="adminPassword" id="password" type="password" required
							style="border-radius: 3px 0 0 3px; border-right: none;">
						<div class="pass" onclick="togglePassword()">
							<span class="password-eye show-password" data-toggle="tooltip"
								data-placement="top" title="show password"></span> <span
								class="password-eye hide-password hide" data-toggle="tooltip"
								data-placement="top" title="hide password"></span>
						</div>
						<label>Password</label>
					</div>
					<button type="submit" onclick="toggle()">Login as Admin</button>
				</form>

			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script>
	var con = true;
	function changes(sel) {
		document.getElementById(sel.id).classList.add("activated");
	}
	function togglePassword() {
		const pass = document.getElementById("password");
		var show = document.getElementsByClassName("show-password");
		var hide = document.getElementsByClassName("hide-password");
		if (con) {
			pass.type = "text";
			show[0].classList.add("hide");
			hide[0].classList.remove("hide");
		} else {
			pass.type = "password";
			show[0].classList.remove("hide");
			hide[0].classList.add("hide");
		}
		console.log("Hello :))")
		con = !con;

	}

	function toggle() {
		var blur
		document.getElementById('blur');
		blur.classList.toggle('active');
		var popup = document.getElementById('popup');
		popup.classList.toggle('active');
	}
</script>

</html>
<%@ include file="footer.jsp"%>

