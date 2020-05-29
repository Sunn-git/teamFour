package kr.or.book4zo.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.dao.BookDao;
import kr.or.book4zo.dao.UserDao;
import kr.or.book4zo.dto.BookDto;
import kr.or.book4zo.dto.UserDto;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class GetUserListAjax
 */
@WebServlet("/BookList.ajax")
public class GetUserListAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetUserListAjax() {
        super();

    }
    

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	System.out.println("UserList.ajax 타니?");
		try {
  		  	BookDao bookdao = new BookDao();
  		  	List<BookDto> data = bookdao.getAllBookList(); //사원 목록 조회
  		  	
  		  	JSONArray jsonEmpList = JSONArray.fromObject(data);
  		  	
  		  	response.setCharacterEncoding("UTF-8");
  		  	response.setContentType("text/html; charset=UTF-8");
  		  	//한글처리 하다 열받아 죽기 
  		  	
  	         response.getWriter().print(jsonEmpList);
  	         System.out.println(jsonEmpList);

		 }catch(Exception e){
		  		System.out.println(e.getMessage());
		 }
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

}
