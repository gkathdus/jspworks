package servlet.forward;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/for/second")
public class ForSecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForSecondServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h3>이름: " + name + "<br>");
		out.println("<h3>dispatcher를 이용한 포워딩 실습입니다.</h3>");
		out.println("</body></html>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
