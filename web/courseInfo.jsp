<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%!
	public class Course {
		private String course_id;
		private String course_name;
		private int time;
		private String prof_id;
		private int seats;
		private String detail;

		public Course() {
			course_id = "";
			course_name = "";
			time = 0;
			prof_id = "";
			seats = 0;
			detail = "";
		}

		public ArrayList<Course> get(String... params) {
			String db_url = "jdbc:mysql://220.85.26.181:3306/DBAPP";
			String db_user = "dbapp";
			String db_password = "0000";

			String query = "";

			if (params[0].toUpperCase().equals("COURSE")) {
				if (params[1].toUpperCase().equals("ENTIRE")) {
					query = "SELECT * FROM courseInfo";
				} else if (params[1].toUpperCase().equals("TAKE")) {
					query = "SELECT * FROM courseInfo WHERE course_id=ANY(SELECT course_id FROM takeInfo WHERE member_id=\""
							+ params[2] + "\")";
				}
			} else if (params[0].toUpperCase().equals("PLAN")) {
				query = "SELECT * FROM courseInfo WHERE course_id=\"" + params[1] + "\"";
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;

			ArrayList<Course> courseList = new ArrayList<Course>();

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				connection = DriverManager.getConnection(db_url, db_user, db_password);
				statement = connection.createStatement();

				resultSet = statement.executeQuery(query);

				while (resultSet.next()) {
					Course course = new Course();
					course.set(resultSet.getString("course_id"),
							resultSet.getString("course_name"),
							Integer.toString(resultSet.getInt("time")),
							resultSet.getString("prof_id"),
							Integer.toString(resultSet.getInt("seats")),
							resultSet.getString("detail"));

					courseList.add(course);
				}

				return courseList;
			} catch (Exception exp) {
				exp.printStackTrace();
				return null;
			} finally {
				if (resultSet != null) {
					try {
						resultSet.close();
					} catch (SQLException e) {
					}
				}

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
		}

		public String getCourse_id() {
			return this.course_id;
		}

		public String getCourse_name() {
			return this.course_name;
		}

		public int getTime() {
			return this.time;
		}

		public String getProf_id() {
			return this.prof_id;
		}

		public int getSeats() {
			return this.seats;
		}

		public String getDetail() {
			return this.detail;
		}

		public void set(String... params) {
			this.course_id = params[0];
			this.course_name = params[1];
			this.time = Integer.parseInt(params[2]);
			this.prof_id = params[3];
			this.seats = Integer.parseInt(params[4]);
			this.detail = params[5];
		}
	}
%>