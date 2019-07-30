<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ include file="/WEB-INF/views/common/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel='stylesheet'
	href='<c:url value="/resources/chosen/chosen.css"/>'>
<script>
	window.console = window.console || function(t) {
	};
</script>
<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>
</head>
<body translate="no">
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="tab-content">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="home-tab"
							data-toggle="tab" href="#home" role="tab" aria-controls="home"
							aria-selected="true">Upload From Computer</a></li>
						<li class="nav-item"><a class="nav-link" id="profile-tab"
							data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">Chose From
								Existing</a></li>
					</ul>
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="home" role="tabpanel"
							aria-labelledby="home-tab">
							<br> <br> <br> <br>
							<form id="uploadForm" method="post" enctype="multipart/form-data">
								<input type="file" name="file" />
								<button id="uploadImage" class="btn btn-primary" type="submit">Upload</button>
								<div id="insertFiles"></div>
							</form>
						</div>
						<div class="tab-pane fade row" id="profile" role="tabpanel"
							aria-labelledby="profile-tab">
							Search File <input type="text" id="searchFile"/>
							<br>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary px-4"
							data-dismiss="modal">Confirm</button>
						<button type="reset" class="btn btn-primary px-4"
							data-dismiss="modal">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form:form
		action="${pageContext.request.contextPath}/savesharefile.htm"
		modelAttribute="share_fileDto">
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-borderless" id="dataTable" width="100%"
						cellspacing="0">
						<tr>
							<td>Choose User Name</td>
							<td><form:select data-placeholder="Choose user name"
									path="receiver" name="senderList"
									class="chosen-select col-sm-12 form-control form-control-user"
									multiple="multiple">
									<c:forEach var="users" items="${userList }" varStatus="index">
										<form:option value="${users.id}">
											<img class="img-profile rounded-circle"
												src="<c:url value='/resources/profiles/${user.photo}'/>">${users.name}</form:option>
									</c:forEach>
								</form:select></td>
						</tr>
						<tr>
							<td>Choose File</td>
							<td><form:input type="hidden" id="file_id" path="file_id" />
								<div style="display: none" id="show">
									<input type="text" id="file">
								</div>
								<button type="button" class="btn btn-primary px-4"
									data-toggle="modal" data-target="#myModal">Choose Your
									file</button> <!--   start modal --></td>
						</tr>
						<tr><td></td>
							<td><input type="submit" class="btn btn-primary px-4"
								value="Submit"> <input type="button"
								class="btn btn-primary px-4" value="Cancel"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<input type="hidden" id="pageContext"
			value="${pageContext.request.contextPath}" />
	</form:form>
	<script src='<c:url value="/resources/vendor/jquery/jquery.min.js" /> '></script>
	<script src='<c:url value="/resources/chosen/chosen.jquery.js"/>'></script>
	<script id="rendered-js">
		jQuery(function($) {
			$('.chosen-select').chosen();
			$('#uploadImage').click(function(e) {
				alert("upload");
				e.preventDefault();

				$(this).prop('disabled', true);

				var form = $('#uploadForm')[0];
				var formData = new FormData(form);

				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/ajax/send_file",
					enctype : 'multipart/form-data',
					data : formData,
					cache : false,
					contentType : false,
					processData : false,
					timeout : 1000000,
					success : function(data, textStatus, jqXHR) {
						alert(data.name)
						$("#show").show();
						$("#file").val(data.name);
						$("#file_id").val(data.id);
						console.log("SUCCESS : ", data);
						$("#uploadImage").prop("disabled", false);
						$('#uploadForm')[0].reset();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
						$("#result").html(jqXHR.responseText);
						console.log("ERROR : ", jqXHR.responseText);
						$("#uploadImage").prop("disabled", false);

					}
				});
			});
		
		});
	</script>
</body>
</html>

