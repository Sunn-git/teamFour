package kr.or.book4zo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.service.PostList_s;
import kr.or.book4zo.service.PostWrite_s;

/**
 * Servlet implementation class PostController
 */
@WebServlet("*.post")
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostController() {
		super();

	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url_Command = requestURI.substring(contextPath.length());

		// http://localhost:8090/WebServlet_94_Board_Model2_Mvc/boardwrite.bbs
		System.out.println("requestURI : " + requestURI);
		System.out.println("contextPath : " + contextPath);
		System.out.println("url_Command : " + url_Command);

		// BoardCmd cmd = null;
		// String viewPage = null;
		ActionForward forward = null;
		Action action = null;

		String viewpage = "";

		/////////////////// 여기부터 수정하면 됨////////////////////////////

		// 포스트 리스트 보자
		if (url_Command.equals("/PostList.post")) {
			System.out.println("PostList여기에 타고있니??");
			action = new PostList_s();
			forward = action.execute(request, response);
		}
		
		else if (url_Command.equals("/PostListView.post")) {
			System.out.println("/PostListView.post 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/post/v_postView.jsp");
			System.out.println("v_postView.jsp 여기까지는 가니??");

		}

		// 포스트에 글쓰러 가자
		else if (url_Command.equals("/PostWrite_s.post")) {
			System.out.println("POST 글쓰기");
			action = new PostWrite_s(); // 다형성
			try {
				forward = action.execute(request, response);
				System.out.println("POST 글쓰기 처리 완료");
			} catch (Exception e) {

				e.printStackTrace();
			}
			
			//post 쀼 보러가기
		} else if (url_Command.equals("/PostWriteAction.post")) {
			System.out.println("/PostWriteAction.post 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/post/v_postWrite.jsp");
			System.out.println("/글쓰기 쀼 실행 ");

		}

		
		
		
		// 4. 뷰 지정하기
		// RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		if (forward != null) {
			if (forward.isRedirect()) { // true
				response.sendRedirect(forward.getPath()); // redirect는 주소가 바뀌기 때문에 잘 안쓰지만 학습용이라 사용했다
			} else { // false(모든자원)사용
				System.out.println("콘솔보자");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);

			}

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
