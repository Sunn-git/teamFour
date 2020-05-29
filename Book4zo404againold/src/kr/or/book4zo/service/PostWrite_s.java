package kr.or.book4zo.service;

import java.io.IOException;

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
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		PostDao postdao = new PostDao();
		PostDto postdto = new PostDto();
		
		String realFolder = "";
		String saveFolder = "postUpload";
		int filesize = 10 * 1024 * 1024; // 10M
		realFolder = request.getSession().getServletContext()
				    .getRealPath(saveFolder);
		// realFolder = request.getRealPath(saveFolder);
		
		
		boolean result = false;
		try {
			// MultipartRequest type의 mult 객체 초기화 설정
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, // 요청 객체 (Mulitpart 와 연결)
					realFolder, // 저장경로 (실질적 저장 경로)
					filesize, // 파일 크기 (10M)(한번에 업로드할 최대 파일 크기)
					"UTF-8", // 한글 인코딩
					new DefaultFileRenamePolicy() // 파일 중복 처리 객체
			);
			System.out.println(multi);
			postdto.setUser_Id(multi.getParameter("USER_ID"));
			postdto.setPost_Title(multi.getParameter("POST_TITLE"));
			postdto.setPost_Contents(multi.getParameter("POST_CONTENTS")
					.replace("\r\n", "<br>"));
			postdto.setPost_Upload_File(multi.getFilesystemName((String) multi
					.getFileNames().nextElement()));
			
			// ct +sh +x (대문자)
			// insert 할 객체를 구성
			result = postdao.postInsert(postdto);
			if (result == false) {
				System.out.println("Insert Fail");
				return null;
			}
			System.out.println("Insert success");
			// ////////////////////////////////////
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("PostList.post");
			return forward;
			// //////////////////////////////////
			
		} catch (IOException e) {
			System.out.println("오류발생");
			e.printStackTrace();
		}

		return null;
	}

}
