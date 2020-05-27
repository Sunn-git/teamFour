package kr.or.book4zo.service.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;

public class PostWrite_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
	
		/*
		try {
		BoardDao bDao = new BoardDao();
		List boardlist = new ArrayList();
		
		int page = 1;
		int limit = 10;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// 사용자가 요청한 페이지 번호 처리
		// 기본 1번 : View
		// 그렇지 않다면 : 요청한 페이지 번호

		int listcount = bDao.getListCount(); // 총 리스트 수를 받아옴
		boardlist = bDao.getBoardList(page, limit); // 리스트를 받아옴
		// page =2 , limit =10 (페이지당 개수)

		// 총 페이지 수
		// listcount =12/10
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 0.95를 더해서 올림 처리

		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		///////////////////////////////////////////////////////////
		//Controller 에서 했던 작업 동일 (게시판 로직)
		///////////////////////////////////////////////////////////
		
		
		//request 객체의 주소 : Controller에서 보낸 request 주소와 동일
		//key point
		request.setAttribute("page", page); //현재 페이지
		request.setAttribute("maxpage", maxpage); //페이지 마지막 번호
		request.setAttribute("startpage", startpage); //
		request.setAttribute("endpage", endpage); //
		request.setAttribute("listcount", listcount); //
		request.setAttribute("boardlist", boardlist); //
		
		//forward 에 대한 처리
		//ActionForward 클래스 (forward or redirect 설정하고 View 정의)
		  
		 
		 */
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("PostWriteAction.post");
	
		/*
		}catch(Exception e) {
			e.getMessage();
		}
		*/
		return forward;
	}

}
