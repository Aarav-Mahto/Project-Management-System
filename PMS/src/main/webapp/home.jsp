<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="home.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
		<%!
		int pAssing=0;
		int pPending=0;
		int pCompleted=0;
		int pRunning=0;
		int pTotal=0;
		String nm=null;
		String uname=null;
		%>
		<%
			
			nm = (String)session.getAttribute("name");
			uname = (String)session.getAttribute("username");
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","Aarav","admin");
				PreparedStatement ps = con.prepareStatement("select pstatus from project");
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					pTotal++;
					if("Running".equalsIgnoreCase(rs.getString("pstatus"))){ pRunning++;}
					if("Completed".equalsIgnoreCase(rs.getString("pstatus"))){ pCompleted++;}
					if("Pending".equalsIgnoreCase(rs.getString("pstatus"))){ pPending++;}
					if("Newpending".equalsIgnoreCase(rs.getString("pstatus"))){ pAssing++;}
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
		%>
	<form id="container" method="post" action="homejsp">
		<div id="header">
			<div id="title"><i class="fa-solid fa-ellipsis"></i></div>
			<div id="tabs">
				<ul>
					<li name="btn" value="project"><a href="projects.jsp">Project <i class="fa-solid fa-grip-lines-vertical"></i></a></li>
					<li name="btn" value="assign"><a href="assign.jsp">NewAssign <i class="fa-solid fa-grip-lines-vertical"></i></a></li>
					<li name="btn" value="running"><a href="running.jsp">Running <i class="fa-solid fa-spinner"></i></a></li>
					<li name="btn" value="completed"><a href="completed.jsp">Completed <i class="fa-solid fa-circle-check"></i></a></li>
					<li name="btn" value="pending"><a href="pending.jsp">Pending <i class="fa-solid fa-circle-pause"></i></a></li>
				</ul>
			</div>
			<div id="users">
				<ul>
					<li><a href="#"><i class="fa-regular fa-user"></i> <%=uname %> <i class="fa-solid fa-exclamation"></i></a></li>
					<li><a href="logout" style="color:red;"> &nbsp;&nbsp;&nbsp;<i class="fa-solid fa-right-from-bracket"></i></a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div><h2>Name: <%=nm %></h2>
				<h2>Username: <%=uname %></h2>
			</div>
			<div id="details">
				<table id="table" style="color:white;"
				>
					<caption><h3>Projects Counts</h3></caption>
					<thead>
						<tr>
							<th>NewAssigned</th>
							<th>Running</th>
							<th>Completed</th>
							<th>Pending</th>
							<th>Total Projects</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%=pAssing %></td>
							<td><%=pRunning %></td>
							<td><%=pCompleted %></td>
							<td><%=pPending %></td>
							<td><%=pTotal %></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="discriptions">
				<hr>
				<p><u><b>What is project management software?</b></u><br><br>Project management software is technology used to organize your business’s workflow. You can use this digital system to track, schedule and map out your company’s projects and assignments. Project management software allows your team to share a virtual space where you can view your company’s work, as well as follow up and manage ongoing projects. Everyone on your team with permission can access the program, which lets you schedule assignments and collaborate on projects.</p>
				<ul>
					<li><p><u><b>Project planning:</b></u> To define a project schedule, a project manager (PM) may use the software to map project tasks and visually describe task interactions.</p></li>
					<li><p><u><b>Task management:</b></u> Allows for the creation and assignment of tasks, deadlines and status reports.</p></li>
					<li><p><u><b>Time tracking:</b></u> Software must have the ability to track time for all tasks maintain records for third-party consultants.</p></li>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>