package kr.or.book4zo.service.post;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.PostDto;

public class PostModifyAction_s implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
			 	throws Exception{
				 request.setCharacterEncoding("utf-8");
				 ActionForward forward = new ActionForward();
				 boolean result = false;
				 
				 int num=Integer.parseInt(request.getParameter("post_seq"));
				 
				 PostDao postdao = new PostDao();
				 PostDto postdto = new PostDto();
				 
				 System.out.println("파일 업로드 관련 로직 ");
				//파일 업로드 관련
					String uploadpath = request.getSession().getServletContext().getRealPath("postUpload");
					System.out.println("uploadpath  " + uploadpath);
					int size = 1024*1024*10;
					MultipartRequest multi;
					
					System.out.println("request getContentType : " + request.getContentType());
					
					multi = new MultipartRequest(request,uploadpath, size, "UTF-8", new DefaultFileRenamePolicy());
					Enumeration filenames = multi.getFileNames();
					String file = (String)filenames.nextElement();//확장자 명
					String filename = multi.getFilesystemName(file);
					String orifilename = multi.getOriginalFileName(file);
				 
				 try{
					 postdto.setPost_seq(num);
					 postdto.setPost_title(multi.getParameter("post_title"));
					 postdto.setPost_contents(multi.getParameter("post_contents"));
					 postdto.setPost_upload_file(multi.getParameter("post_upload_file"));
					 
					 System.out.println(postdto.getPost_seq());
					 System.out.println(postdto.getPost_title());
					 System.out.println(postdto.getPost_contents());
					 System.out.println(postdto.getPost_upload_file());
					 
					 result = postdao.PostModify(postdto);
					 if(result==false){
				   		System.out.println("포스트 수정 실패");
				   		return null;
				   	 }
				   	 System.out.println("포스트 수정 완료");
				   	 
				   	 forward.setRedirect(true);
				   	 forward.setPath("./PostDetailView.post?post_seq="+postdto.getPost_seq());
				   	 //return forward;
			   	 }catch(Exception ex){
			   			ex.printStackTrace();	 
				 }
				 
				 return forward;
			 }
		}