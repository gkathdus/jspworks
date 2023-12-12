package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TestDAO;

@WebServlet("*.do") // 디렉터리 패턴
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TestDAO dao = new TestDAO();
 
    public TestController() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// http://localhost:8080/testweb/board/list.do
		
		// 경로 생성
		// uri -> 컨텍스트 + 요청 경로
		// context -> 컨텍스트
		String uri = request.getRequestURI();
		//String contextPath = request.getContextPath();
		
		// 커멘드 패턴(요청 경로)
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);
		
		String nextPage = "";
		
		if(command.equals("/list.do")) {
			//System.out.println("/list.do 경로가 요청되었습니다");
			dao.list();
			nextPage = "/board/boardlist.jsp";
		
		}else if(command.equals("/write.do")) {
			//System.out.println("/write.do 경로가 요청되었습니다");
			dao.write();
	
		}else if(command.equals("/test.do")) {
			String message = "안냥";
			// 모델 생성 후 저장
			request.setAttribute("msg", message);
			nextPage = "/test.jsp";
		}
		
			// 페이지 이동
			RequestDispatcher dispatch =
					request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		
		
		
		//System.out.println(uri);
		//System.out.println(contextPath);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
