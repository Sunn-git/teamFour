package kr.or.book4zo.service.post;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.PostDto;

public class PostModifyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
		 request.setCharacterEncoding("utf-8");
		 
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		System.out.println("user_id :" + user_id); //id값 가지고온거 사용하고싶다...
		 
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 int num=Integer.parseInt(request.getParameter("num"));
		 System.out.println("값을 보여주세요 :"+ num);
		 PostDao postdao = new PostDao();
		 PostDto postdto = new PostDto();
		 
		 boolean usercheck = postdao.isPostWriter(
				 				num, request.getParameter("user_id")); //user_id를 받아와야하는데
		 //System.out.println("값을 보여주세요 :"+ request.getParameter("user_id"));
		//System.out.println("값을 보여주세요 :"+ num);
		 
		 
		 if(usercheck==false){
		   		response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('수정할 권한이 없습니다.');");
		   		out.println("location.href='./PostList.post';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 
		 try{
			 postdto.setPost_seq(num);
			 postdto.setPost_title(request.getParameter("Post_title"));
			 postdto.setPost_contents(request.getParameter("Post_contents"));
			 
			 result = postdao.PostModify(postdto);
			 if(result==false){
		   		System.out.println("포스트 수정 실패");
		   		return null;
		   	 }
		   	 System.out.println("포스트 수정 완료");
		   	 
		   	 forward.setRedirect(true);
		   	 forward.setPath(
		   			 	"./PostDetailView.post?num="+postdto.getPost_seq());
		   	 //return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return forward;
	 }
}