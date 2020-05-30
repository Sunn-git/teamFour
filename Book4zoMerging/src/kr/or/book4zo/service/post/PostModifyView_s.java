package kr.or.book4zo.service.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.PostDto;

public class PostModifyView_s implements Action {
	
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 	
		 	request.setCharacterEncoding("utf-8");
		 	PostDao postdao = new PostDao();
		 	int num =Integer.parseInt(request.getParameter("post_seq"));
		 	PostDto postdto =postdao.getDetail(num);
		 	
		 	System.out.println("값" + num);
		 	
			if(postdto == null){
				System.out.println("수정 상세보기 실패");
				return null;
			}
			System.out.println("수정 상세보기 성공");
			request.setAttribute("CurrentPost", postdto);
			
		 	ActionForward forward = new ActionForward();
		 	forward.setRedirect(false);
		 	forward.setPath("/WEB-INF/post/v_postModify.jsp");
		 	
			return forward;
	 }
	 
}


