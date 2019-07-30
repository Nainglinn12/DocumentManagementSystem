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
${imageName}
<img class="user-avatar " src='<c:url value='${path}'/>' height="220" width="220">
<a href='<c:url value='${path}'/>' download="pitcure">Download ${imageName}</a>
</body>
</html>