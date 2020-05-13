package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.EmpDao;
import kr.or.bit.dto.Emp;

public class ServiceListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
			 EmpDao dao = new EmpDao();
			 List<Emp> empList = dao.getEmpList();
			 request.setAttribute("empList", empList);
			 System.out.println(empList); // 지금 여기서 null뜨는중
			 forward = new ActionForward();
			 forward.setRedirect(false); //forward
			 forward.setPath("/WEB-INF/Emp/empList.jsp");
		}catch (Exception e) {
			System.out.println("오류 : " +e.getMessage());
		}
		System.out.println(forward.getPath());
		return forward;
	}

}
