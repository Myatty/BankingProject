<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/home_style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
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
	<div class="form-popup">
		<div class="form-box login">
			<div class="form-content">
				<h2>LOGIN</h2>
				<form method="post"
					action="${pageContext.request.contextPath}/adminLogin">
					<div class="input-field">
						<input type="text" required> <label>Email</label>
					</div>
					<div class="input-field">
						<input type="password" required> <label>Password</label>
					</div>
					<a href="#" class="forgot-pass-link">Forgot password?</a>
					<button type="submit">Log In</button>
				</form>
				<div class="bottom-link">
					Don't have an account? <a href="#" id="signup-link">Register</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Header and paragraph-->

</body>
<!-- End -->

<%@ include file="footer.jsp"%>

</html>

<!--
                       _oo0oo_
                      o8888888o
                      88" . "88
                      (| -_- |)
                      0\  =  /0
                    ___/`---'\___
                  .' \\|     |// '.
                 / \\|||  :  |||// \
                / _||||| -:- |||||- \
               |   | \\\  -  /// |   |
               | \_|  ''\---/''  |_/ |
               \  .-\__  '-'  ___/-. /
             ___'. .'  /--.--\  `. .'___
          ."" '<  `.___\_<|>_/___.' >' "".
         | | :  - \.;\ _ /;./ -  : | |
         \  \ _.   \_ \ / _/   .- /  /
     =====-.____.___ \_____/___.-`___.-'=====
                       `=---='

     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            ဘုရား        တရား        သံဃာ
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    -->