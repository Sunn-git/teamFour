package kr.or.book4zo.dto;

public class UserDto {
	private String user_id,user_pwd,user_email,user_name,user_image;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	@Override
	public String toString() {
		return "UserDto [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_email=" + user_email + ", user_name="
				+ user_name + ", user_image=" + user_image + "]";
	}
}
