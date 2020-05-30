package kr.or.book4zo.dto;

public class PostDto {
	private int post_seq;
	private String user_id;
	private int book_seq;
	private String post_title;
	private String post_contents; 
	private String post_date;
	private int post_views;
	private String post_upload_file;
	
	
	
	
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBook_seq() {
		return book_seq;
	}
	public void setBook_seq(int book_seq) {
		this.book_seq = book_seq;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_contents() {
		return post_contents;
	}
	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public int getPost_views() {
		return post_views;
	}
	public void setPost_views(int post_views) {
		this.post_views = post_views;
	}
	public String getPost_upload_file() {
		return post_upload_file;
	}
	public void setPost_upload_file(String post_upload_file) {
		this.post_upload_file = post_upload_file;
	}
	@Override
	public String toString() {
		return "PostDto [post_seq=" + post_seq + ", user_id=" + user_id + ", book_seq=" + book_seq + ", post_title="
				+ post_title + ", post_contents=" + post_contents + ", post_date=" + post_date + ", post_views="
				+ post_views + ", post_upload_file=" + post_upload_file + "]";
	}

	
}