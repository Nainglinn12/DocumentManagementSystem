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
<div class="center">
      <video controls="controls">
      ${Name}
        <source src="<c:url value='${path}' />" type="video/ogg" />
        <a href="/images/myw3schoolsimage.jpg" download>
      </video>
    </div>
</body>
</html>