<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%!
	public class Member {
		private String member_id;
		private String password;
		private String department;
		private int grade;
		private String member_name;

		public Member() {
			member_id = "";
			password = "";
			department = "";
			grade = -1;
			member_name = "";
		}

		public ArrayList<Member> get(String... params) {
			String db_url = "jdbc:mysql://220.85.26.181:3306/DBAPP";
			String db_user = "dbapp";
			String db_password = "0000";

			String query = "";

			if (params[0].toUpperCase().equals("LOGIN")) {
				if (params[1].toUpperCase().equals("STUDENT")) {
					query = "SELECT * FROM memberInfo WHERE grade>0";
				} else if (params[1].toUpperCase().equals("PROFESSOR")) {
					query = "SELECT * FROM memberInfo WHERE grade=0";
				}
			} else if (params[0].toUpperCase().equals("STUDENTS")) {
				query = "SELECT * FROM memberInfo WHERE member_id=ANY(SELECT member_id FROM takeInfo WHERE course_id=\""
						+ params[1] + "\") AND grade>0";
			}

			Connection connection = null;
			Statement statement = null;
			ResultSet resultSet = null;

			ArrayList<Member> memberList = new ArrayList<Member>();

			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				connection = DriverManager.getConnection(db_url, db_user, db_password);
				statement = connection.createStatement();

				resultSet = statement.executeQuery(query);

				while (resultSet.next()) {
					Member member = new Member();
					member.set(resultSet.getString("member_id"),
							resultSet.getString("password"),
							resultSet.getString("department"),
							Integer.toString(resultSet.getInt("grade")),
							resultSet.getString("member_name"));

					memberList.add(member);
				}

				return memberList;
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

		public String getMember_id() {
			return this.member_id;
		}

		public String getPassword() {
			return this.password;
		}

		public String getDepartment() {
			return this.department;
		}

		public int getGrade() {
			return this.grade;
		}

		public String getMember_name() {
			return this.member_name;
		}

		public void set(String... params) {
			this.member_id = params[0];
			this.password = params[1];
			this.department = params[2];
			this.grade = Integer.parseInt(params[3]);
			this.member_name = params[4];
		}
	}
%>