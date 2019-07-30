<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ include file="/WEB-INF/views/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${Name}
<div>
	<object
		data='<c:url value='${path}'/>'
		type="application/pdf" width="1250" height="500">
		</object>
		</div>
</body>
</html>