<%@ page language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="memberInfo.jsp" %>

<%
	String member_id = request.getParameter("member_id");
	String password = request.getParameter("password");
	String grade = request.getParameter("grade");

	Member member = new Member();
	ArrayList<Member> memberList = new ArrayList<Member>();
	memberList = member.get("LOGIN", grade);

	Boolean success = false;

	if (memberList != null) {
		for (Member m : memberList) {
			if (m.getMember_id().equals(member_id)
					&& m.getPassword().equals(password)) {
				success = true;
				break;
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

<body>
<%
	if (success == true)
		response.sendRedirect("result_success.jsp");
	else
		response.sendRedirect("result_fail.jsp");
%>
</body>
</html>