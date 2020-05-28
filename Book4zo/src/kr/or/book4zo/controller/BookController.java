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
import kr.or.book4zo.service.book.Book_SaveDataToDB_s;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.book")
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookController() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		
		//main 페이지 연결
		if (urlCmd.equals("/Main.book")) {
			System.out.println("/Main.book 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/index.jsp");
			
		}
		//sidebar 페이지 연결 
		else if(urlCmd.equals("/Search.book")) {
			System.out.println("/Search.book 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/book/v_search.jsp");
			
		}
		//detail
		else if(urlCmd.equals("/Detail.book")) {
			System.out.println("/Detail.book 실행");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/book/v_detail.jsp");
		}
		
		//---------------- action ------------------
		
		
		///////////////////////////////////////////////////
		//API 자료를 DB에 저장하기
	    else if(urlCmd.equals("/SaveDataToDB.book")) {
	       System.out.println("/SaveDataToDB.book 실행");
	         
	       action = new Book_SaveDataToDB_s();
	       forward = action.execute(request, response);
	       System.out.println("SaveDataToDB.book 끝");
	         
	    }

		///////////////////////////////////////////////////////////////////////
		//------------------------뷰로 실제로 보내주는 역할.-------------------------
		if(forward != null){
		if(forward.isRedirect()) {
		response.sendRedirect(forward.getPath());
		}
		else {
		//여기서 뷰단을 진짜 지정해서 보내는거임. 나는 만들기만 하고 한번도 보낸적이 없다
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
