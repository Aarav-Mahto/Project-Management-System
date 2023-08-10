import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class Home extends HttpServlet{	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String btn = req.getParameter("btn");
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
		if(btn.equalsIgnoreCase("logout")){
			HttpSession session=req.getSession();
			session.invalidate();
			resp.setContentType("text/html");
			out.print("<center><h2 style='Color:red;'>Logged Out Successfully</h2></center>");
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
			
		}
	}
}
