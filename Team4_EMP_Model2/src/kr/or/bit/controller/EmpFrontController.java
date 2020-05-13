package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;


@WebServlet("*.do")
public class EmpFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EmpFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    	
    	//주소 요청의 판단 근거 (함수)
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
    	
    	//requestURI :  /WebServlet_7_Member_Model2_Mvc_Url/Register.do
    	//contextPath : /WebServlet_7_Member_Model2_Mvc_Url
    	//url_Command : /Register.do
    	
    	System.out.println("requestURI : " + requestURI);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("url_Command : " + url_Command);
    	
    	//추가코드////////////////////////////////////////////
    	//redirect 와 path 정보를 갖는 클래스
    	//Action 인터페이스 타입은 모든 자식객체의 주소값을 가질 수 있다
    	ActionForward forward = null;
    	Action action = null;
    	///////////////////////////////////////////////////
    	//2. 요청 판단 처리 (화면단인지 처리인지에 대한 판단만 해주면 된다)
    	String viewpage = "";
    	
    	
    	
    	///////////////////여기부터 수정하면 됨////////////////////////////
    	if(url_Command.equals("/Register.do")) { 
    		//UI 제공 (서비스클래스가 필요 없다. 하지만 표준화 시키기 위해 이렇게 사용한다.)
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/Register/Register.jsp");
    		
    	}else if(url_Command.equals("/ok.do")) { //회원가입처리
    		//UI 제공 + 로직처리
//    		action = new MemberWriteAction();
    		forward = action.execute(request, response);
    		
    	}
    	
    	
    	
    	
    	
    	
    	
        	
    	
    	//4. 뷰 지정하기
    	//RequestDispatcher dis = request.getRequestDispatcher(viewpage);
    	if(forward != null) {
    		if(forward.isRedirect()) { // true
    			response.sendRedirect(forward.getPath()); // redirect는 주소가 바뀌기 때문에 잘 안쓰지만 학습용이라 사용했다 
    		}else { // false(모든자원)사용

        		RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
            	dis.forward(request, response);
        		
        	}
        	
    	}



	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

}
