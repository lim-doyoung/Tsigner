<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인인포</title>
</head>
<body>
    <!-- 세션에서 token을 가져와서 출력한다. -->
    ${sessionScope.token}
    <a href = "/tsigner/logout/">로그아웃</a><br>

</body>
</html>