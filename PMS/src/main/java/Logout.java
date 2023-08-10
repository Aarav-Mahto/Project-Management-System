import java.io.IOException;
import java.io.PrintWriter;

import com.mysql.cj.Session;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/logout")
public class Logout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.removeAttribute("name");
		session.removeAttribute("username");
		session.invalidate();
		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");
		out.print("<center><h2 style='Color:red;'>Logged Out Successfully.</h2></center>");
		RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
		rd.include(req, resp);
	}
}
