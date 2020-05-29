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
import kr.or.book4zo.service.user.Login_s;
import kr.or.book4zo.service.user.Register_s;

/**
 * Servlet implementation class UserController
 */
@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserController() {
        super();

    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	//response.getWriter().append("Served at: ").append(request.getContextPath());
    	
    	// 주소 요청의 판단 근거 (함수)
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlCmd = requestURI.substring(contextPath.length());    	
    
    	//System.out.println("requestURI : " + requestURI);
		System.out.println("contextPath : " + contextPath + "&  urlCmd : " + urlCmd);
		
		ActionForward forward = null;
		Action action = null;
		
		//요청 판단
		String viewPage = "";
		
		
		//----------------------- View 연결 ------------------------
		//로그인 페이지 연결
		if (urlCmd.equals("/Login.user")) {
			System.out.println("/Login.user 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/user/v_login.jsp");
			
		}
		//로그아웃 페이지 연결
		else if(urlCmd.equals("/Logout.user")) {
			System.out.println("/Logout.user 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/user/v_logout.jsp");
		}
		//회원가입 페이지 연결 
		else if(urlCmd.equals("/Register.user")) {
			System.out.println("/Register.user 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/user/v_register.jsp");
		}
		//마이페이지 연결 
		else if(urlCmd.equals("/Mypage.user")) {
			System.out.println("/Mypage.book 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/user/v_myPage.jsp");
		}
		//내 정보 수정 연결 
		else if(urlCmd.equals("/InfoEdit.user")) {
			System.out.println("/InfoEdit.book 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/user/v_infoEdit.jsp");
		}
		
		
		//------------------------서비스 연결-------------------------
		//로그인 서비스 연결
		else if(urlCmd.equals("/LoginAction.user")) {
			System.out.println("/LoginAction.user 실행");
			action = new Login_s();
			forward = action.execute(request, response);
			
		}
		//회원가입 서비스 연결
		else if(urlCmd.equals("/RegisterAction.user")) {
			System.out.println("/RegisterAction.user 실행");
			action = new Register_s();
			forward = action.execute(request, response);
		}
		
		
		///////////////////////////////////////////////////////////////////////
		//------------------------뷰로 실제로 보내주는 역할.-------------------------
		if(forward != null){
			if(forward.isRedirect()) {
			response.sendRedirect(forward.getPath());
			}
			else {
			//여기서 뷰단을 진짜 지정해서 보내는 역할.
			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
			dis.forward(request, response);
			}
		}
	}
    //-------------------------------------------------------------------------------------------------------------------------
    
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	}

   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		try {
			doProcess(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	}


}
