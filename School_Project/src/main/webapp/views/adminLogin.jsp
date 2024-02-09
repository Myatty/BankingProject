<%@ include file="header.jsp"%>
<!--  Link tags -->

</head>
<body>

	<!-- Main -->
	<div class="container">
		<div class="col-4 offset-4">
	
		<form method="post"
			action="${pageContext.request.contextPath}/adminLogin">
			<div class="mb-3 mt-5">
				<label for="exampleFormControlInput1">Username </label> <input
					type="text" class="form-control" name="adminUsername"
					placeholder="Enter your Username Here">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1">Password </label> <input
					type="password" class="form-control" name="adminPassword"
					placeholder="Enter your Password Here">
			</div>
			<button class="btn btn-success">Submit</button>
		</form>
		
		</div>
	</div>
	<%@ include file="footer.jsp"%>