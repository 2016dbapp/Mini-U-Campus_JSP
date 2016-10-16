<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Mini U-Campus</title>
</head>

<body>
<img src="https://info.kw.ac.kr/include/images/logo.gif" width="165" height="50">

<form action="login.jsp">
	<p></p>
	<p>학번</p>
	<input type="text" name="member_id">

	<p>비밀번호</p>
	<input type="password" name="password">

	<p></p>
	<input type="hidden" name="grade" value="Student">
	<button>로그인</button>
</form>
</body>
</html>