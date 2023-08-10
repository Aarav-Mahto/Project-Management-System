import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class Assign extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String btn = req.getParameter("btn");
		String pid_search = req.getParameter("search").trim();
		if(btn.equalsIgnoreCase("project")) {
			RequestDispatcher rd = req.getRequestDispatcher("projects.jsp");
			rd.forward(req, resp);
		}
		if(btn.equalsIgnoreCase("assign")) {
			RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
			rd.forward(req, resp);
		}
		if(btn.equalsIgnoreCase("running")) {
			RequestDispatcher rd = req.getRequestDispatcher("running.jsp");
			rd.forward(req, resp);
		}
		if(btn.equalsIgnoreCase("completed")) {
			RequestDispatcher rd = req.getRequestDispatcher("completed.jsp");
			rd.forward(req, resp);
		}
		if(btn.equalsIgnoreCase("pending")) {
			RequestDispatcher rd = req.getRequestDispatcher("pending.jsp");
			rd.forward(req, resp);		
		}
		if(btn.equalsIgnoreCase("save")) {//pid sname pdesc sdate ldate pstatus assignto
			String pid = req.getParameter("pid");	
			String sname = req.getParameter("sname");
			String pdesc = req.getParameter("pdesc");
			String sdate = req.getParameter("sdate");
			String ldate = req.getParameter("ldate");
			String pstatus = req.getParameter("pstatus");
			String assignto = req.getParameter("assignto");
			if(pid.length()==0||pstatus.length()==0||assignto.length()==0) {
				resp.setContentType("text/html");
				out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>'*' denote mandatory field.</h2>");
				RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
				rd.include(req, resp);
			}
			else {
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","Aarav","admin");
					PreparedStatement ps = con.prepareStatement("insert into project values('"+pid+"','"+sname+"','"+pdesc+"','"+sdate+"','"+ldate+"','"+pstatus+"','"+assignto+"')");
					int i=ps.executeUpdate();
					if(i>0) { 
						resp.setContentType("text/html");
						out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>Added Successfully.</h2>");
						RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
						rd.include(req, resp);
					}
					else {
						resp.setContentType("text/html"); 
						out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>!Not Added, Try Again.</h2>");
						RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
						rd.include(req, resp);
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if(btn.equalsIgnoreCase("delete")||btn.equalsIgnoreCase("update")||btn.equalsIgnoreCase("search")) {
			if(pid_search.length()>0) {
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","Aarav","admin");
					PreparedStatement ps2 = con.prepareStatement("SELECT * FROM project WHERE pid='"+pid_search+"'");
					ResultSet rs2 = ps2.executeQuery();//"select *from project where pstatus='Pending'"
					if(rs2.next()) {
						PreparedStatement ps1 = con.prepareStatement("SELECT * FROM project WHERE pid='"+pid_search+"'");
						ResultSet rs = ps1.executeQuery();
						while(rs.next()) {
							req.setAttribute("pid", rs.getString("pid"));
							req.setAttribute("pname", rs.getString("pname"));
							req.setAttribute("pdesc", rs.getString("pdesc"));
							req.setAttribute("psdate", rs.getString("psdate"));
							req.setAttribute("pldate", rs.getString("pldate"));
							req.setAttribute("pstatus", rs.getString("pstatus"));
							req.setAttribute("pteam", rs.getString("pteam"));
						}
						if(btn.equalsIgnoreCase("delete")) {
							PreparedStatement ps = con.prepareStatement("DELETE FROM project WHERE pid='"+pid_search+"'");
							int i1=ps.executeUpdate();
							if(i1>0){
								req.setAttribute("event","delete");
								resp.setContentType("text/html");
								out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>You Deleted.</h2>");
								RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
								rd.include(req, resp);
							}
							else {
								req.setAttribute("event","delete");
								resp.setContentType("text/html");
								out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>Technical Issue, Try again Later</h2>");
								RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
								rd.include(req, resp);
							}
						}
						else if(btn.equalsIgnoreCase("update")) {
							req.setAttribute("event","update");
							resp.setContentType("text/html");
							out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>Updation not Working!</h2>");
							RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
							rd.include(req, resp);
						}
						else if(btn.equalsIgnoreCase("search")) {
							req.setAttribute("event","search");
							resp.setContentType("text/html");
							out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>Item Found.</h2>");
							RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
							rd.include(req, resp);
						}
					}
					else {
						resp.setContentType("text/html");
						out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>Item Not Found.</h2>");
						RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
						rd.include(req, resp);
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else {
				resp.setContentType("text/html");
				out.print("<h2 style='color:red;position:absolute;top:90px;left:40%;z-index:1;'>Enter Project Id</h2>");
				RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
				rd.include(req, resp);
			}
		}
		if(btn.equalsIgnoreCase("addProject")) {
			req.setAttribute("event","newProject");
			resp.setContentType("text/html");
			out.print("<h2 style='color:yellow;position:absolute;top:90px;left:40%;z-index:1;'>Enter Data</h2>");
			RequestDispatcher rd = req.getRequestDispatcher("assign.jsp");
			rd.include(req, resp);
		}
	}
}
