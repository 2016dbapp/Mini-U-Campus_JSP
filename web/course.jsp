<%@ page language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="courseInfo.jsp" %>

<%
	String member_id = request.getParameter("member_id");

	Course course = new Course();

	// 전체 강의 목록 가져오기
	ArrayList<Course> courseList_entire = new ArrayList<Course>();
	courseList_entire = course.get("COURSE", "ENTIRE");

	// 수강 or 담당 강의 목록 가져오기
	ArrayList<Course> courseList_take = new ArrayList<Course>();
	courseList_take = course.get("COURSE", "TAKE", member_id);
%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

<body>
<p>전체 강의</p>
<table id="entire" width="550" border="1">
	<thead align="center">
	<tr>
		<td>강의번호</td>
		<td>강의명</td>
	</tr>
	</thead>

	<tbody align="center">
	<%
		if (courseList_entire != null) {
			for (Course c : courseList_entire) {
				String course_id = c.getCourse_id();
				String course_name = c.getCourse_name();
	%>
	<tr>
		<td id="entire_course_id"><%= course_id %>
		</td>
		<td id="entire_course_name"><%= course_name %>
		</td>
	</tr>
	<%
			}
		}
	%>
	</tbody>
</table>

<p>수강 강의</p>
<table id="take" width="550" border="1">
	<thead align="center">
	<tr>
		<td>강의번호</td>
		<td>강의명</td>
	</tr>
	</thead>

	<tbody align="center">
	<%
		if (courseList_take != null) {
			for (Course c : courseList_take) {
				String course_id = c.getCourse_id();
				String course_name = c.getCourse_name();
	%>
	<tr>
		<td id="take_course_id"><%= course_id %>
		</td>
		<td id="take_course_name"><%= course_name %>
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