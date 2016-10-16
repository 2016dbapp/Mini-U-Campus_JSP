<%@ page language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="courseInfo.jsp" %>

<%
	String course_id = request.getParameter("course_id");

	Course course = new Course();
	ArrayList<Course> courseList = new ArrayList<Course>();
	courseList = course.get("PLAN", course_id);
%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

<body>
<p>강의계획서</p>
<form action="plan_write.jsp">
	<input type="hidden" name="course_id" value="<%= course_id %>">

	<table id="entire" width="550" border="1">
		<tbody align="center">
		<%
			if (courseList != null) {
				Course c = courseList.get(0);

				String course_name = c.getCourse_name();
				String time = Integer.toString(c.getTime());
				String prof_id = c.getProf_id();
				String seats = Integer.toString(c.getSeats());
				String detail = c.getDetail();
		%>
		<tr>
			<td>강의번호</td>
			<td id="course_id"><%= course_id %>
			</td>
		</tr>

		<tr>
			<td>강의명</td>
			<td id="course_name"><%= course_name %>
			</td>
		</tr>

		<tr>
			<td>강의시간</td>
			<td id="time"><%= time %>
			</td>
		</tr>

		<tr>
			<td>담당교수</td>
			<td id="prof_id"><%= prof_id %>
			</td>
		</tr>

		<tr>
			<td>수강인원</td>
			<td id="seats"><%= seats %>
			</td>
		</tr>

		<tr>
			<td colspan="2">강의내용</td>
		</tr>

		<tr>
			<td id="detail" colspan="2">
				<input type="text" name="detail" style="font-size: 12pt;" value="<%= detail %>">
			</td>
		</tr>
		<%
			}
		%>
		</tbody>
	</table>

	<button>확인</button>
</form>
</body>
</html>