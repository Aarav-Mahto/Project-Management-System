
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.protocol.a.NativeConstants.StringLengthDataType;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		
		String uname = req.getParameter("username").trim().toLowerCase();
		String pass = req.getParameter("password").trim().trim();
		String btn = req.getParameter("btn");
		if(btn.equalsIgnoreCase("login_btn")) {	
			if(uname.length()==0 || pass.length()==0){
	    		resp.setContentType("text/html");
				out.print("<center><h2 style='Color:red;'>Enter Username and password</h2></center>");
				RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);
	    	}
			else {
			
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","Aarav","admin");
					PreparedStatement ps = con.prepareStatement("select username,password,Name from register");
					ResultSet rs = ps.executeQuery();
					boolean flag=false;
					while(rs.next()) {
						if(uname.equals(rs.getString("username")) && pass.equals(rs.getString("password"))) {
							flag = true;
							HttpSession session = req.getSession();
							session.setAttribute("username", rs.getString("username"));
							session.setAttribute("name", rs.getString("Name"));
							RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
							rd.forward(req, resp);	
						}
					}
					if(!flag) {
						resp.setContentType("text/html");
						out.print("<center><h2 style='Color:red;'>Invalid UserName or Password</h2></center>");
						RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
						rd.include(req, resp);
					}
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}}	
		}
		if(btn.equalsIgnoreCase("register_btn")) {
			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);
		}
	}
}
