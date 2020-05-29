package kr.or.book4zo.service.user;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.UserDao;
import kr.or.book4zo.dto.UserDto;

public class Register_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8"); //제발 외워 한글 깨짐 방
		
		UserDto userdto = new UserDto();
		UserDao userdao = new UserDao();
		//파일 업로드 관련
		String uploadpath = request.getSession().getServletContext().getRealPath("userUpload");
		System.out.println("uploadpath  " + uploadpath);
		int size = 1024*1024*10;
		MultipartRequest multi;
				
		System.out.println("request getContentType : " + request.getContentType());
				
		multi = new MultipartRequest(request,uploadpath, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration filenames = multi.getFileNames();
		String file = (String)filenames.nextElement();//확장자 명
		String filename = multi.getFilesystemName(file);
		String orifilename = multi.getOriginalFileName(file);
		
//		String user_id = multi.getParameter("user_id");
//		String user_pwd = multi.getParameter("user_pwd");
//		String user_email = multi.getParameter("user_email");
//		String user_name = multi.getParameter("user_name");

//		System.out.println("service에서 받은 값 : " + user_id + "/"+ user_pwd + "/"+ user_email + "/"+ user_name + "/" + user_image);
		
		userdto.setUser_id(multi.getParameter("user_id"));
		userdto.setUser_pwd(multi.getParameter("user_pwd"));
		userdto.setUser_email(multi.getParameter("user_email"));
		userdto.setUser_name(multi.getParameter("user_name"));
		userdto.setUser_image(filename);
		
		int result = userdao.insertRegister(userdto);
    	System.out.println(result);
		 String msg="";
		 String url="";
		    if(result > 0){
		    	msg ="가입 성공";
		    	url ="Login.user";
		    }else{
		    	msg="가입 실패";
		    	url="index.jsp";
		    }
		    
		    request.setAttribute("msg",msg);
		    request.setAttribute("url", url);
		
		    ActionForward forward = new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("/WEB-INF/redirect.jsp");
		    
		return forward;
	}

}
