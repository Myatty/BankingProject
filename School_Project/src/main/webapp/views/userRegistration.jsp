<%@ include file="header.jsp"%>
<!--  Link tags -->

</head>
<body>

	<div class="container">
		<div class="col-4 offset-4">
	
		<form method="post" 
			action="${pageContext.request.contextPath}/UserRegistration">
			<div class="mb-3 mt-5">
				<label for="exampleFormControlInput1">Name</label> <input
					type="text" class="form-control" name="username"
					placeholder="Enter your Username Here">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1">NRC </label> <input
					type="text" class="form-control" name="nrcNumber"
					placeholder="Enter your NRC Number Here">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1">Gmail </label> <input
					type="email" class="form-control" name="userGmail"
					placeholder="Enter your Gmail Here">
			</div>
			<div class="mb-3">
				<label >Choose your Career Here</label>
				<select class="form-select" aria-label="" name="career">
					<option>Teacher</option>
					<option>Student</option>
					<option>Engineer</option>
					<option>Dog</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1">Password </label> <input
					type="password" class="form-control" name="userPassword"
					placeholder="Enter your Password Here">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1">Balance </label> <input
					type="number" class="form-control" name="userBalance"
					placeholder="Enter your Initial Balance Here">
			</div>
			<button class="btn btn-success">Register</button>	
		</form>
		
		</div>
	</div>
<%@ include file="footer.jsp"%>

