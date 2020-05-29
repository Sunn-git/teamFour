package kr.or.book4zo.service.post;
//지금 이코드도 사용하지 않고있다. 포스트 디테일 ㅅ ㅓ비스 라는 소리인데..... 이러니;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.PostDto;

public class PostDetail_s implements Action {
	//아직 값을 못가지고와서 수정중..
		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			//System.out.println("뭐가 나오나: "+request); 여기까지는 입장했음
			//System.out.println("뭐가 나오나: "+response); 여기까지는 입장했음
			request.setCharacterEncoding("utf-8");

			//여기는 지금 실행이 되고있는데 값을 왜 못가지고이지...


			PostDao postdao = new PostDao();
			PostDto postdto = new PostDto();
			
		
			
			int num = Integer.parseInt(request.getParameter("post_seq"));
			System.out.println("뭐가나오냐 :" + num);
			postdto = postdao.getDetail(num);
			System.out.println("뭐가나오냐 :" + postdto);
			if (postdto == null) {
				System.out.println("상세보기 실패");
				return null;
			}
			System.out.println("상세보기 성공");

			request.setAttribute("postdto", postdto);
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("PostDetailView.post");
			System.out.println("디테일서비스 뷰여기까지 온거니??");
			//자 도전이다==  여기까지 못옴
			return forward;

		}
	}
