<%@ include file="header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>

	<div class="container">
		<div class="col-4 offset-4 mt-4">
			<div class="alert alert-info" role="alert">
				<strong>Upcoming Messages:</strong>
				<ul id="upcoming-messages" class="list-unstyled">
					<c:set var="test" value="1" />

					<c:choose>
						<c:when test="${test eq 1}">
							<p>There will be a list</p>
						</c:when>
						<c:otherwise>
							<p>Nothing here</p>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>
	</div>

	<%@ include file="footer.jsp" %>