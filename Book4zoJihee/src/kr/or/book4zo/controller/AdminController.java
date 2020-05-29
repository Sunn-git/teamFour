package kr.or.book4zo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.orbutil.fsm.Action;

import kr.or.book4zo.action.ActionForward;



/**
 * Servlet implementation class AdminController
 */
@WebServlet("*.admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		
		//sidebar 연결 페이지
		if(urlCmd.equals("/Dashboard.admin")) {
			System.out.println("/Dashboard.admin 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/admin/v_adminDashboard.jsp");
			
		}else if(urlCmd.equals("/UserTable.admin")) {
			System.out.println("/UserTable.admin 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/admin/v_adminUserTable.jsp");
			
		}else if(urlCmd.equals("/BookTable.admin")) {
			System.out.println("/BookTable.admin 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/admin/v_adminBookTable.jsp");
		}
		//책 넣기
		else if(urlCmd.equals("/InsertBookView.admin")) {
			System.out.println("/InsertBookView.admin 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/admin/v_adminBookInsert.jsp");

		}
		///////////////////////////////////////////////////////////////////////
		//------------------------뷰로 실제로 보내주는 역할.-------------------------
		if(forward != null){
        	if(forward.isRedirect()) {
        		response.sendRedirect(forward.getPath());
        	}
        	else {
        		//이 새*가 뷰단을 진짜 지정해서 보내는거임. 나는 만들기만 하고 한번도 보낸적이 없다
        		RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
        		dis.forward(request, response);
        	}
        }
    }   
    
    
    //-------------------------------------------------------------------------------------------------------------------------
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
