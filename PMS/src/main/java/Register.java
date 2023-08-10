
import java.io.*;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Register extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");
		String btn = req.getParameter("btn");
		if(btn.equalsIgnoreCase("signup")) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","Aarav","admin");
				String uname = req.getParameter("username").trim().toLowerCase();
				String fname = req.getParameter("fname").trim();
				String lname = req.getParameter("lname").trim();
				String name=(fname+" "+lname).trim();
				String phone = req.getParameter("phone").trim();
				String email = req.getParameter("email").trim();
				String pass = req.getParameter("password").trim();
				String cpass = req.getParameter("Cpassword").trim();
				
				String sql = "SELECT username from register";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				if(uname.length()==0||name.length()==0||email.length()==0||pass.length()==0||cpass.length()==0) {
					out.print("<center><h2 style='Color:red;'><b>Registration Failled!</b> '*' denote mandatory field.</h2></center>");
					RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
					rd.include(req, resp);
				}
				else {
					while(rs.next()) {
						if(uname.equals(rs.getString("username"))) {
							out.print("<center><h2 style='Color:red;'>This username is not available</h2></center>");
							RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
							rd.include(req, resp);
						}
					}
					if(pass.equals(cpass)==false) {
						out.print("<center><h2 style='Color:red;'>The username "+uname+" is not available</h2></center>");
						RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
						rd.include(req, resp);
					}
					else {
						String sql1 = "insert into register values('"+uname+"','"+name+"','"+email+"','"+phone+"','"+pass+"')";
						PreparedStatement ps1 = con.prepareStatement(sql1);
						int i = ps1.executeUpdate();
						if(i>0) {
							out.print("<center><h2 style='Color:green;'>Registered Successfully, Go to Login Page</h2></center>");
							RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
							rd.include(req, resp);
						}
					}
				}
					
			}catch (Exception e) {
				e.printStackTrace();
			}
				
		}
		if(btn.equalsIgnoreCase("signin")) {
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
}

