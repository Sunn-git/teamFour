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
		   	PostDto postdto = new PostDto();
		 	request.setAttribute("postdto", postdto);
		 	int num =Integer.parseInt(request.getParameter("num"));
		 	postdto =postdao.getDetail(num);
		 	System.out.println("값" + num);
		  
		 	
		 	//postdto =postdao.getDetail(num);
		 	
		 	//request.setAttribute("postdto", postdto);
		 	ActionForward forward = new ActionForward();
		 	forward.setRedirect(false);
		 	forward.setPath("PostModifyAction.post");
		   	System.out.println("postdto:"+postdto);
			System.out.println("PostModifyAction.post 뷰여기까지 온거니??");
			//자 도전이다==  여기까지 못옴
			return forward;
	 }
	 
}


