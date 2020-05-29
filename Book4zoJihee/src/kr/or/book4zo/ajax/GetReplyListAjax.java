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
			String book_seq = request.getParameter("book_seq");
  		  	ReplyDao replydao = new ReplyDao();
  		  	List<ReplyDto> replyList = replydao.getReplyList(book_seq);
  		  	System.out.println("여기까지 되니?");
//  		  	죽을거같아요
  		  	List<ReplyDto> replyOriginList = null;
  		  	List<ReplyDto> reReplyList = null;
  		  	System.out.println("여기까지 되니?");
//			for (ReplyDto reply : replyList) {
//				
//				if(reply.getDepth() == 0) {
//					ReplyDto origin = new ReplyDto();
//					origin.setBook_seq(reply.getBook_seq());
//					origin.setReply_seq(reply.getReply_seq());
//					origin.setUser_id(reply.getUser_id());
//					origin.setReply_content(reply.getReply_content());
//					origin.setReply_date(reply.getReply_date());
//					origin.setReply_like(reply.getReply_like());
//					origin.setReply_star_rate(reply.getReply_star_rate());
//					origin.setRefer(reply.getRefer());
//					origin.setDepth(reply.getDepth());
//					origin.setStep(reply.getStep());
//					replyOriginList.add(origin);
//				}
//				if(reply.getDepth() == 1) {
//					ReplyDto reReply = new ReplyDto();
//					reReply.setBook_seq(reply.getBook_seq());
//					reReply.setReply_seq(reply.getReply_seq());
//					reReply.setUser_id(reply.getUser_id());
//					reReply.setReply_content(reply.getReply_content());
//					reReply.setReply_date(reply.getReply_date());
//					reReply.setReply_like(reply.getReply_like());
//					reReply.setReply_star_rate(reply.getReply_star_rate());
//					reReply.setRefer(reply.getRefer());
//					reReply.setDepth(reply.getDepth());
//					reReply.setStep(reply.getStep());
//					reReplyList.add(reply);
//				}
//				
//			}
  		  	
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
