package kr.or.book4zo.dto;

public class PostDto {
	private int Post_Seq;
	private String User_Id;
	private int Book_Seq;
	private String Post_Title;
	private String Post_Contents; 
	private String Post_Date;
	private int Post_Views;
	private String Post_Upload_File;
	
	
	
	public int getPost_Seq() {
		return Post_Seq;
	}
	public void setPost_Seq(int post_Seq) {
		Post_Seq = post_Seq;
	}
	public String getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(String user_Id) {
		User_Id = user_Id;
	}
	public int getBook_Seq() {
		return Book_Seq;
	}
	public void setBook_Seq(int book_Seq) {
		Book_Seq = book_Seq;
	}
	public String getPost_Title() {
		return Post_Title;
	}
	public void setPost_Title(String post_Title) {
		Post_Title = post_Title;
	}
	public String getPost_Contents() {
		return Post_Contents;
	}
	public void setPost_Contents(String post_Contents) {
		Post_Contents = post_Contents;
	}
	public String getPost_Date() {
		return Post_Date;
	}
	public void setPost_Date(String post_Date) {
		Post_Date = post_Date;
	}
	public int getPost_Views() {
		return Post_Views;
	}
	public void setPost_Views(int post_Views) {
		Post_Views = post_Views;
	}
	public String getPost_Upload_File() {
		return Post_Upload_File;
	}
	public void setPost_Upload_File(String post_Upload_File) {
		Post_Upload_File = post_Upload_File;
	}
	@Override
	public String toString() {
		return "PostDto [Post_Seq=" + Post_Seq + ", User_Id=" + User_Id + ", Book_Seq=" + Book_Seq + ", Post_Title="
				+ Post_Title + ", Post_Contents=" + Post_Contents + ", Post_Date=" + Post_Date + ", Post_Views="
				+ Post_Views + ", Post_Upload_File=" + Post_Upload_File + "]";
	}
	
	
	
	
}

