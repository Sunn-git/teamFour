package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.bit.dto.Emp;

public class EmpDao {
	static DataSource ds;
	//1. 생성자에서 ds 객체 초기화
	//2. static 초기자 : static{ static 멤버 초기화 }
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	static {
		InitialContext ctx;
		try {
			 ctx = new InitialContext();
			 Context envctx= (Context)ctx.lookup("java:comp/env"); //기본설정
			 ds =(DataSource)envctx.lookup("/jdbc/oracle");//context.xml 에서 name="jdbc/oracle"
		}catch (Exception e) {
			System.out.println("look up Fail : " + e.getMessage());
		}
		 //Context context = new InitialContext(); //이름기반 검색
		 //ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); ///jdbc/oracle pool 검색
		
		/////////////////////////////////////////////////////////////////////////////////DB연결부분
	}
	
	//CRUD 함수
	
	//사원 목록 조회
	public List<Emp> getEmpList() {
		List<Emp> empList = null;
		
		try {
			  conn = ds.getConnection();
			  String sql="select empno,ename,job,mgr,hiredate,sal,comm,deptno from emp";
			  pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				empList = new ArrayList<Emp>();
				while(rs.next()) {
					Emp emp = new Emp();
					emp.setEmpno(rs.getInt("empno"));
					emp.setMgr(rs.getInt("mgr"));
					emp.setSal(rs.getInt("sal"));
					emp.setComm(rs.getInt("comm"));
					emp.setDeptno(rs.getInt("deptno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setHiredate(rs.getDate("hiredate"));
					
					empList.add(emp);
				}
			  
		}catch (Exception e) {
			System.out.println("오류 :" + e.getMessage());
		}finally {
			try {
				pstmt.close();
				rs.close();
				conn.close();//반환
			} catch (Exception e2) {
				
			}
			
		}
		return empList;
	}
	
	
	
}
