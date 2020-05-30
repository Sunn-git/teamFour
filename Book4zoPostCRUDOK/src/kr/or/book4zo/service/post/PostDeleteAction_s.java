package kr.or.book4zo.service.post;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;

public class PostDeleteAction_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
	request.setCharacterEncoding("UTF-8");
	// TODO Auto-generated method stub
	boolean result = false;
	boolean userCheck = false;
	
	int num = Integer.parseInt(request.getParameter("post_seq"));
	
	PostDao postDao = new PostDao();

	result = postDao.PostDelete(num);
	System.out.println(result);
	if(result == false){
		System.out.println("게시물 삭제 실패");
		return null;
	}
	System.out.println("게시물 삭제 성공");
	
	///////////////////////////////////////////////////
	ActionForward forward = new ActionForward();
	forward.setRedirect(false);
	forward.setPath("/Main.book");
	return forward;
	
	}

}
