<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/front-end/TripAll/userTripAll.jsp">
輸入user PK
<input type="text" name="USER_ID">
<button type="submit">送出</button>
</form>
</body>
</html>