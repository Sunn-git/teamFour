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
 * Servlet implementation class ReplyDeleteAjax
 */
@WebServlet("/ReplyDelete.ajax")
public class ReplyDeleteAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public ReplyDeleteAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	System.out.println("ReplyModify.ajax 타니?");
    	request.setCharacterEncoding("UTF-8");	
		boolean result = false;
		
		try {
			int book_seq = Integer.parseInt(request.getParameter("book_seq"));
			System.out.println(book_seq);
			int reply_seq = Integer.parseInt(request.getParameter("reply_seq"));
			
			System.out.println("== parameter 확인 ==");
			System.out.println(book_seq);
			System.out.println(reply_seq);
			System.out.println("========");
			
			ReplyDao replydao = new ReplyDao();
			result = replydao.replyDelete(reply_seq); 
			
			if(result == true) {
				System.out.println("댓글 등록 성공");
			}else {
				System.out.println("댓글 등록 실패");
			}
			
			//인풋창 원래대로 바꾸는 법 배워야해요
			List<ReplyDto> replyList = replydao.getReplyList(book_seq);
			
			JSONArray jsonReplyList = JSONArray.fromObject(replyList);
			
			System.out.println("== ServiceCommentWriteAction ==");
			System.out.println(jsonReplyList);
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonReplyList);
			
		} catch (Exception e) {
			System.out.println("replyDeleteAjax 오류발생");
			e.printStackTrace();
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request, response);
	}
}
