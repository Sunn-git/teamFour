package kr.or.book4zo.ajax;

import java.io.IOException;
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
 * Servlet implementation class ReplyWriteAjax
 */
@WebServlet("/ReplyWrite.ajax")
public class ReplyWriteAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReplyWriteAjax() {
        super();
      
    }

	
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("BookList.ajax 타니?");
    	request.setCharacterEncoding("UTF-8");	
		int result = 0;
		
		try {
			String book_seq = request.getParameter("book_seq");
			String reply_writer = request.getParameter("reply_writer");
			String reply_content = request.getParameter("reply_content");
			String reply_pass = request.getParameter("reply_pass");
			
			System.out.println("== parameter 확인 ==");
			System.out.println(book_seq);
			System.out.println(reply_writer);
			System.out.println(reply_content);
			System.out.println(reply_pass);
			System.out.println("========");
			
			ReplyDao replydao = new ReplyDao();
			result = replydao.replyWrite(); //수정해야함 
			
			if(result == 0) {
				System.out.println("댓글 등록 실패");
			}else {
				System.out.println("댓글 등록 성공");
			}
			
			List<ReplyDto> replyList = replydao.getReplyList(book_seq);
			
			JSONArray jsonReplyList = JSONArray.fromObject(replyList);
			
			System.out.println("== ServiceCommentWriteAction ==");
			System.out.println(jsonReplyList);
			
			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(jsonReplyList);
			
		} catch (Exception e) {
			System.out.println("ServiceCommentWriteAction 오류발생");
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
