package kr.or.book4zo.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.UserDao;

public class Login_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		
		System.out.println(user_id+"/"+user_pwd);
		
		UserDao userdao = new UserDao();
		Boolean isLogin;
		
		isLogin = userdao.userLogin(user_id, user_pwd);
			
		String login_msg = "";
		String login_url = "";
		
		//유저 프로필사진 담을 객체 생성
		String user_image = "";
		
		if(isLogin) { //id와 pwd가 맞으면..
			
			//세션 가져와서 login 정보 저장
			HttpSession session = request.getSession();
			//session.invalidate();
			session.setAttribute("user_id",user_id);
			user_image = userdao.getUser_image(user_id);
			
			System.out.println("user_image : " + user_image);
			
			session.setAttribute("user_image",user_image);
			System.out.println(user_image);
			String uploadpath = request.getSession().getServletContext().getRealPath("userUpload");
			System.out.println("uploadpath  " + uploadpath);
			
			login_msg = "로그인 성공";
			login_url = "index.jsp";
		}else {
			login_msg = "로그인 실패";
			login_url = "Login.user";
		}
		request.setAttribute("msg",login_msg);
	    request.setAttribute("url", login_url);
	    
	    ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
	    forward.setPath("/WEB-INF/redirect.jsp");
	    
	return forward;
	
	}

}
