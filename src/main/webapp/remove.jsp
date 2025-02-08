<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% session.removeAttribute("kh");
		response.sendRedirect("dangnhap.jsp");
		/* session.removeAttribute("gio");
		response.sendRedirect("htsach"); */
	%>
</body>
</html>