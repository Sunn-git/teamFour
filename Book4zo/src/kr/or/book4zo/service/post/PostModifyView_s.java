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
		
		 	ActionForward forward = new ActionForward();
		 	request.setCharacterEncoding("utf-8");
		 	
		 	
		 	PostDao postdao = new PostDao();
		   	PostDto postdto = new PostDto();
		 	
		   	
		 	int num =Integer.parseInt(request.getParameter("num"));
		 	System.out.println("num값보여줘 :" + num);
		 	postdto =postdao.getDetail(num);
		 	
		  
		 	if(postdto == null) {
		 		System.out.println("(수정)상세보기 실패");
		 		return null;
		 	}
		 	System.out.println("(수정)상세보기성공");
		 	
		 	request.setAttribute("postdto", postdto);
		 	forward.setRedirect(false);
		 	forward.setPath("/WEB-INF/post/v_postModify.jsp");
		   	System.out.println("postdto:"+postdto);
			System.out.println("v_postModify.jsp 뷰를 보러가자 ??");
			//자 도전이다==  여기까지 못옴
			return forward;
	 }
	 
}


