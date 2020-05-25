package kr.or.book4zo.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception; //서블릿이 가진 함수의 파라미터와 똑같다. 
	
}
