package kr.or.book4zo.service.post;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.PostDto;

public class PostModifyAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 request.setCharacterEncoding("utf-8");
				 ActionForward forward = new ActionForward();
				 boolean result = false;
				 
				 int num=Integer.parseInt(request.getParameter("Post_seq"));
				 
				 PostDao postdao = new PostDao();
				 PostDto postdto = new PostDto();
				 
				 boolean usercheck = postdao.isPostWriter(
						 				num, request.getParameter("user_id"));
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