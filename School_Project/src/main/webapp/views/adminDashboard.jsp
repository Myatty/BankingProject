<%@ include file="header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>

	<div class="container">
		<div class="col-4 offset-4 mt-4">
			<div class="alert alert-info" role="alert">
				<strong>Upcoming Messages:</strong>
				<ul id="upcoming-messages" class="list-unstyled">
				
					<c:set var="test" value="${requestScope.test}" />
					
					<c:set var="adminApproval" value="${requestScope.adminApproval}" />
					<c:set var="userName" value="dog" />
					<c:set var="nrcNumber" value="${requestScope.nrcNumber}" />

					<c:out value="${userName}"/>
			
					<c:choose>
						<c:when test="${test eq 1}">
							<p>There will be a list</p>
							<button class="btn btn-success" id="approveBtn">Approve</button>
							<button class="btn btn-secondary" id="denyBtn">Deny</button>
							<!-- Text bar to get number input (initially hidden) -->
							<div id="buttonContainer">
								<input type="text" id="numberInput" style="display: none;">
							</div>
						</c:when>
						<c:otherwise>
							<p id="nothingHereMessage" style="display: none;">Nothing
								here</p>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>
	</div>
	
	
<script>
    // Add event listener to the Approve button
    document.getElementById('approveBtn').addEventListener('click', function() {
        // Retrieve the values of userName and nrcNumber
        var userName = "${userName}";
        var nrcNumber = "${nrcNumber}";

        // Create a form element
        var form = document.createElement('form');
        

        // Create hidden input fields for userName and nrcNumber
        var userNameInput = document.createElement('input');
        userNameInput.type = 'hidden';
        userNameInput.name = 'userName';
        userNameInput.value = userName;
        form.appendChild(userNameInput);

        var nrcNumberInput = document.createElement('input');
        nrcNumberInput.type = 'hidden';
        nrcNumberInput.name = 'nrcNumber';
        nrcNumberInput.value = nrcNumber;
        form.appendChild(nrcNumberInput);

        // Append the form to the body and submit it
        document.body.appendChild(form);
        form.method = 'post';
        form.action = 'userToDatabase';
        form.submit();
    });
</script>
<!-- 

	<script>
		// Function to create Confirm and Cancel buttons
		function createConfirmCancelButtons() {
			const confirmBtn = document.createElement('button');
			confirmBtn.className = 'btn btn-success';
			confirmBtn.textContent = 'Confirm';
			confirmBtn.id = 'confirmBtn';

			const cancelBtn = document.createElement('button');
			cancelBtn.className = 'btn btn-danger';
			cancelBtn.textContent = 'Cancel';
			cancelBtn.id = 'cancelBtn';

			const container = document.getElementById('buttonContainer');
			container.appendChild(confirmBtn);
			container.appendChild(cancelBtn);

			// Add event listener to the Confirm button
			confirmBtn.addEventListener('click', function() {
				sendDataToAdminController();
			});
		}

		// Function to remove Confirm and Cancel buttons
		function removeConfirmCancelButtons() {
			const confirmBtn = document.getElementById('confirmBtn');
			const cancelBtn = document.getElementById('cancelBtn');
			if (confirmBtn) {
				confirmBtn.remove();
			}
			if (cancelBtn) {
				cancelBtn.remove();
			}
		}

		// Get the button and text input elements
		const approveBtn = document.getElementById('approveBtn');
		const denyBtn = document.getElementById('denyBtn');
		const numberInput = document.getElementById('numberInput');
		const nothingHereMessage = document
				.getElementById('nothingHereMessage');

		// Add event listener to the Approve button
		approveBtn.addEventListener('click', function() {
			// Show the text input and remove approve and deny buttons
			numberInput.style.display = 'block';
			approveBtn.style.display = 'none';
			denyBtn.style.display = 'none';
			// Create Confirm and Cancel buttons
			createConfirmCancelButtons();
		});

		// Add event listener to the Deny button
		denyBtn.addEventListener('click', function() {
			// Hide the text input and show the "Nothing here" message
			numberInput.style.display = 'none';
			nothingHereMessage.style.display = 'block';
			approveBtn.style.display = 'none';
			denyBtn.style.display = 'none';
		});

		// Add event listener to the Cancel button
		document.addEventListener('click', function(e) {
			if (e.target && e.target.id === 'cancelBtn') {
				// Hide the text input and show the approve and deny buttons
				numberInput.style.display = 'none';
				nothingHereMessage.style.display = 'none';
				approveBtn.style.display = 'block';
				denyBtn.style.display = 'block';
				// Remove Confirm and Cancel buttons
				removeConfirmCancelButtons();
			}
		});
	</script> -->
	<%@ include file="footer.jsp"%>