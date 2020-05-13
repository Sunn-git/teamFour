package kr.or.bit.action;

//servlet 요청 : 화면전달, 로직제어(DB), view의 경로 설정 
//이러한 요청들을 표준화하고싶은 것이다.
public class ActionForward {
	private boolean isRedirect = false; // 화면단을 가져갈 것인지 아니면 로직을 제어할 것인지를 판단하는 변수
	private String path = null; // 이동경로(view 의 주소)
	
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
	
}
