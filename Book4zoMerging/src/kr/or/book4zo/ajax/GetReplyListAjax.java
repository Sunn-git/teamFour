package kr.or.book4zo.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.book4zo.dao.ReplyDao;

import kr.or.book4zo.dto.ReplyDto;
import net.sf.json.JSONArray;

/**
 * Servlet implementation class GetReplyListAjax
 */
@WebServlet("/GetReplyList.ajax")
public class GetReplyListAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReplyListAjax() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	System.out.println("UserList.ajax 타니?");
		try {
			int book_seq = Integer.parseInt(request.getParameter("book_seq"));
  		  	ReplyDao replydao = new ReplyDao();
  		  	List<ReplyDto> replyList = replydao.getReplyList(book_seq);
  		  	System.out.println("여기까지 되니?");
//  		  	죽을거같아요
  		  	List<ReplyDto> replyOriginList = null;
  		  	List<ReplyDto> reReplyList = null;
  		  	System.out.println("여기까지 되니?");
  		  	
			JSONArray jsonReplyList = JSONArray.fromObject(replyList);
//			JSONArray jsonReplyOriginList = JSONArray.fromObject(replyOriginList);
//			JSONArray jsonReRePlyList = JSONArray.fromObject(reReplyList);
			
			System.out.println("== ServiceCommentWriteAction ==");
			System.out.println("jsonReplyList : "+jsonReplyList);
			
			response.setContentType("application/x-json; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			out.print(jsonReplyList);
			
//			out.print(jsonReplyOriginList);
//			out.print(jsonReRePlyList);

		 }catch(Exception e){
			 
		  		System.out.println("오류터짐 " + e.getMessage());
		 }
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}

}
