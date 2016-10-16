<%@ page language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="memberInfo.jsp" %>

<%
	String course_id = request.getParameter("course_id");

	Member member = new Member();
	ArrayList<Member> memberList = new ArrayList<Member>();
	memberList = member.get("STUDENTS", course_id);
%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

<body>
<p>학생 정보</p>
<table id="students" width="550" border="1">
	<thead align="center">
	<tr>
		<td>학번</td>
		<td>학과</td>
		<td>학년</td>
		<td>이름</td>
	</tr>
	</thead>

	<tbody align="center">
	<%
		if (memberList != null) {
			for (Member m : memberList) {
				String member_id = m.getMember_id();
				String department = m.getDepartment();
				String grade = Integer.toString(m.getGrade());
				String member_name = m.getMember_name();
	%>
	<tr>
		<td id="member_id"><%= member_id %>
		</td>
		<td id="department"><%= department %>
		</td>
		<td id="grade"><%= grade %>
		</td>
		<td id="member_name"><%= member_name %>
		</td>
	</tr>
	<%
			}
		}
	%>
	</tbody>
</table>
</body>
</html>