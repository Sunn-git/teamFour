package kr.or.book4zo.service.post;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;

public class PostDelete_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("utf-8");
		
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		System.out.println("user_id :" + user_id);
		
	   	boolean result=false;
	   	boolean usercheck=false;
	   	int num=Integer.parseInt(request.getParameter("num"));
	   	
	   	PostDao postdao=new PostDao();
	   	usercheck=postdao.isPostWriter(num, user_id);
	   	
	   	if(usercheck==false){
	   		response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('삭제할 권한이 없습니다.');");
	   		out.println("location.href='./postList.post';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
	   	}
	   	
	   	result=postdao.PostDelete(num);
	   	if(result==false){
	   		System.out.println("포스트 삭제 실패");
	   		return null;
	   	}
	   	
	   	System.out.println("포스트 삭제 성공");
	   	forward.setRedirect(true);
   		forward.setPath("./postList.post");
   		return forward;
	 }
}