<%@ page language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="courseInfo.jsp" %>

<%
	String course_id = request.getParameter("course_id");
	String detail = request.getParameter("detail");

	String db_url = "jdbc:mysql://220.85.26.181:3306/DBAPP";
	String db_user = "dbapp";
	String db_password = "0000";

	String query = "UPDATE courseInfo SET detail=\"" + detail + "\" WHERE course_id=\"" + course_id + "\"";

	Connection connection = null;
	Statement statement = null;
	int result = 0;

	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(db_url, db_user, db_password);
		statement = connection.createStatement();

		result = statement.executeUpdate(query);

		if (result > 0) {
			statement.executeUpdate(query);
			response.sendRedirect("result_success.jsp");
		} else {
			response.sendRedirect("result_fail.jsp");
		}
	} catch (Exception exp) {
		exp.printStackTrace();
	} finally {
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
			}
		}

		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
			}
		}
	}
%>