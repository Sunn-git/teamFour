package kr.or.book4zo.service.post;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.PostDto;

public class PostDelete_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		request.setCharacterEncoding("UTF-8");
		//view 단 구성
		//글번호를 가지고 와서 
		int num =Integer.parseInt(request.getParameter("post_seq"));
		PostDao postdao = new PostDao();
		PostDto currentPost = new PostDto();
		
		currentPost = postdao.getDetail(num);
		
		if(currentPost == null){
			System.out.println("Null Data 처리");
			return null;
		}
		System.out.println("postDto Data 완료");
		//데이터 가지고 ...
		//view 페이지에서 처리되는 Dto 객체
		
		request.setAttribute("CurrentPost", currentPost);
		System.out.println(">>>>>>"+request.toString());
		System.out.println("검증: " +request.getAttribute("CurrentPost"));
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/post/v_postDelete.jsp");
		return forward;
	}

}
