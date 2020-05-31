package kr.or.book4zo.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


import kr.or.book4zo.dao.UserDao;

//실시간 회원가입 차트 
@WebServlet("/UserCount_s")
public class UserCount_s extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserCount_s() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserCount_s");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		UserDao userdao= new UserDao();
		int result=userdao.countUser();
		
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("count", result);
		response.getWriter().print(jsonobject);
		//response.addHeader("Refresh", "5");
		//request.setAttribute("count", result);
		//RequestDispatcher dis = request.getRequestDispatcher("/dynamicemp.jsp");
		//dis.forward(request, response);
	}
}