package kr.or.book4zo.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.PostDao;
import kr.or.book4zo.dto.PostDto;

public class PostWrite_s implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("========== PostWrite_s ===========");
		request.setCharacterEncoding("UTF-8");
		
		PostDao postdao = new PostDao();
		PostDto postdto = new PostDto();
		
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
		int result = 0;
		
		
//		String realFolder = "";
//		String saveFolder = "postUpload";
//		int filesize = 10 * 1024 * 1024; // 10M
//		realFolder = request.getSession().getServletContext()
//				    .getRealPath(saveFolder);
//		// realFolder = request.getRealPath(saveFolder);
		
		
//		int result = 0;
		try {
//			// MultipartRequest type의 mult 객체 초기화 설정
//			MultipartRequest multi = null;
//			multi = new MultipartRequest(request, // 요청 객체 (Mulitpart 와 연결)
//					realFolder, // 저장경로 (실질적 저장 경로)
//					filesize, // 파일 크기 (10M)(한번에 업로드할 최대 파일 크기)
//					"UTF-8", // 한글 인코딩
//					new DefaultFileRenamePolicy() // 파일 중복 처리 객체
//			);
//			System.out.println("잘나오고있나요??" + multi);
			postdto.setUser_id(multi.getParameter("user_id"));
			postdto.setPost_title(multi.getParameter("post_title"));
			postdto.setPost_contents(multi.getParameter("post_contents")
					.replace("\r\n", "<br>"));
			
			System.out.println("원래 받아온 파일이름 : " + multi.getParameter("post_upload_file"));
			
			//<input name="post_upload_file" type="file" />
			postdto.setPost_upload_file(multi.getParameter("post_upload_file"));
			
			// ct +sh +x (대문자)
			// insert 할 객체를 구성
			result = postdao.postInsert(postdto);
			if (result == 0) {
				System.out.println("Insert Fail");
				return null;
			}
			System.out.println("Insert success");
			// ////////////////////////////////////
			//여기서 값을 꺼내서 저장할거니까
			
			
			

			System.out.println("postNum 값을확인 :" + result); //여기는 값이 있고
			
			PostDto CurrentPost = postdao.getDetail(result);
			
			
			System.out.println("CurrentPost 확인 : " + CurrentPost);
			request.setAttribute("CurrentPost", CurrentPost);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("PostDetail.post");
			//상세보기 실행중입니다 안되면  PostList.post 다시 돌려주세용
			return forward;
			// //////////////////////////////////
			
		} catch (IOException e) {
			System.out.println("오류발생");
			e.printStackTrace();
		}

		return null;
	}
		//리쿼스트를 여기서 
}
