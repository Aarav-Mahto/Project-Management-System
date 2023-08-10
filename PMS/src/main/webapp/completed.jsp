<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.util.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>projects/completed</title>
	<link rel="stylesheet" type="text/css" href="CommonStyle.css">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="projects.css">
</head>
<body>
<%!
String nm=null;
String uname=null;
%>
<%
nm = (String)session.getAttribute("name");
uname = (String)session.getAttribute("username");
%>
	<form id="container" method="post" action="completedjsp">
		<div id="header">
			<div id="title"><i class="fa-solid fa-ellipsis"></i></div>
			<div id="tabs">
				<ul>
					<li name="btn" value="project"><a href="projects.jsp">Project <i class="fa-solid fa-grip-lines-vertical"></i></a></li>
					<li name="btn" value="assign"><a href="assign.jsp">NewAssign <i class="fa-solid fa-grip-lines-vertical"></i></a></li>
					<li name="btn" value="running"><a href="running.jsp">Running <i class="fa-solid fa-spinner"></i></a></li>
					<li name="btn" value="completed" style="background-color: rgba(102, 0, 102, 0.6);"><a href="completed.jsp">Completed <i class="fa-solid fa-circle-check"></i></a></li>
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
		<div id="table_container">
			<div>
				<button name="btn" value="addProject" class="addProject" onclick="fun1()"><i class="fa-solid fa-plus"></i> Add Project</button>
				<div class="newData">
				<%if(request.getAttribute("event")=="newProject"){ %> 
					<span>
						<label>Project Id*</label><br><input type="text" name="pid">
					</span>
					<span>
						<label>Short Name</label><br><input type="text" name="sname">
					</span>
					<span>
						<label>Description</label><br><input type="text" name="pdesc">
					</span>
					<span>
						<label>Start Date</label><br><input type="date" name="sdate">
					</span>
					<span>
						<label>LastDate</label><br><input type="date" name="ldate">
					</span>
					<span>
						<label>Status*</label><br>
						<select name="pstatus" id="pstatus" required>
							<option>Select</option>  
					        <option value="running">Running</option> 
					        <option value="completed">Completed</option> 
					        <option value="pending">Pending</option>
					        <option value="newpending">Newpending</option> 
					    </select>
					</span>
					<span>
						<label>Assigned Team*</label><br><input type="text" name="assignto">
					</span>
					<span>
						<button class="save" name="btn" value="save">Save</button>
					</span>
				<% }%>
				
				
				
					<%
						if(request.getAttribute("event")=="search"){
							out.write("");
							%>	
							
									<span>
									<label>Project Id*</label><br><input type="text" name="pid" value=<%= request.getAttribute("pid") %>>
								</span>
								<span>
									<label>Short Name</label><br><input type="text" name="sname" value=<%= request.getAttribute("pname") %>>
								</span>
								<span>
									<label>Description</label><br><input type="text" name="pdesc" value=<%= request.getAttribute("pdesc") %>>
								</span>
								<span>
									<label>Start Date</label><br><input type="date" name="sdate" value=<%= request.getAttribute("psdate") %>>
								</span>
								<span>
									<label>LastDate</label><br><input type="date" name="ldate" value=<%= request.getAttribute("pldate") %>>
								</span>
								<span>
									<label>Status*</label><br>
									<select name="pstatus" id="pstatus">
										<option><%= request.getAttribute("pstatus") %></option>
								    </select>
								</span>
								<span>
									<label>Assigned Team*</label><br><input type="text" name="assignto" value=<%= request.getAttribute("pteam") %>>
								</span>
								<span>
									<!--button class="save" name="btn" value="updated">Update</button-->
								</span>
								<%	
							}
						%>
					<%
						if(request.getAttribute("event")=="update"){
							out.write("");
						%>	
						
								<span>
								<label>Project Id*</label><br><input type="text" name="pid" value=<%= request.getAttribute("pid") %>>
							</span>
							<span>
								<label>Short Name</label><br><input type="text" name="sname" value=<%= request.getAttribute("pname") %>>
							</span>
							<span>
								<label>Description</label><br><input type="text" name="pdesc" value=<%= request.getAttribute("pdesc") %>>
							</span>
							<span>
								<label>Start Date</label><br><input type="date" name="sdate" value=<%= request.getAttribute("psdate") %>>
							</span>
							<span>
								<label>LastDate</label><br><input type="date" name="ldate" value=<%= request.getAttribute("pldate") %>>
							</span>
							<span>
								<label>Status*</label><br>
								<select name="pstatus" id="pstatus">
									<option><%= request.getAttribute("pstatus") %></option>
							    </select>
							</span>
							<span>
								<label>Assigned Team*</label><br><input type="text" name="assignto" value=<%= request.getAttribute("pteam") %>>
							</span>
							<span>
								<button class="save" name="btn" value="updated" disabled>Update</button>
							</span>
							<%	
						}
					%>
							
							
						<%	
							
						if(request.getAttribute("event")=="delete"){
							out.write("");
						%>	
						
								<span>
								<label>Project Id*</label><br><input type="text" name="pid" value=<%= request.getAttribute("pid") %>>
							</span>
							<span>
								<label>Short Name</label><br><input type="text" name="sname" value=<%= request.getAttribute("pname") %>>
							</span>
							<span>
								<label>Description</label><br><input type="text" name="pdesc" value=<%= request.getAttribute("pdesc") %>>
							</span>
							<span>
								<label>Start Date</label><br><input type="date" name="sdate" value=<%= request.getAttribute("psdate") %>>
							</span>
							<span>
								<label>LastDate</label><br><input type="date" name="ldate" value=<%= request.getAttribute("pldate") %>>
							</span>
							<span>
								<label>Status*</label><br>
								<select name="pstatus" id="pstatus">
									<option><%= request.getAttribute("pstatus") %></option>
							    </select>
							</span>
							<span>
								<label>Assigned Team*</label><br><input type="text" name="assignto" value=<%= request.getAttribute("pteam") %>>
							</span>
							<span>
								<!--button class="save" name="btn" value="save" disabled>Save</button-->
							</span>
							<%	
						}
					%>
					
				</div>
			
				<div class="btn_edit">
					<span><input type="text" name="search" placeholder="Project Id"></span><br>
					<span><button class="search" name="btn" value="search"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
					<button class="update" name="btn" value="update"><i class="fa-solid fa-pen"></i> Update</button>
					<button class="delete" name="btn" value="delete"><i class="fa-solid fa-trash"></i> Delete</button></span>
				</div>
			</div>
			<div><h1>Completed Projects</h1></div>
			<div id="table_parent">
				<table id="data">
					<thead>
						<tr>
							<th>ProjectId</th>
							<th>ShortName</th>
							<th>Date</th>
							<th>Status</th>
							<th>Team</th>
						</tr>
					</thead>
					<tbody>
						<%
					
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","Aarav","admin");
						PreparedStatement ps = con.prepareStatement("select *from project where pstatus='Completed'");
						ResultSet rs = ps.executeQuery();
						while(rs.next()){
							%>		
							
					
					
						<tr>
							<td><input type="text" value=<%= rs.getString("pid") %>></td>
							<td><input type="text" value=<%= rs.getString("pname") %>></td>
							<td><input type="text" value=<%= rs.getDate("pldate") %>></td>
							<td><input type="text" value=<%= rs.getString("pstatus") %>></td>
							<td><input type="text" value=<%= rs.getString("pteam") %>></td>
						</tr>
						<%
						}
					}
					catch (Exception e) {
						e.printStackTrace();
					}
						%>
						
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>