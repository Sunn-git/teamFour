package kr.or.book4zo.dto;

public class ReplyDto {
	private int reply_seq, book_seq, reply_star_rate, reply_like, refer, depth, step;
	private String user_id, reply_content, reply_date;
	
	public ReplyDto() {}
	public ReplyDto(int reply_seq,int book_seq,int reply_star_rate,int reply_like,int refer,int depth,int step,String user_id,String reply_content,String reply_date ) {
		super();
		this.reply_seq = reply_seq;
		this.user_id = user_id;
		this.book_seq = book_seq;
		this.reply_star_rate = reply_star_rate;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.reply_like = reply_like;
		this.refer = refer;
		this.depth = depth;
		this.step = step;
	}
	
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public int getBook_seq() {
		return book_seq;
	}
	public void setBook_seq(int book_seq) {
		this.book_seq = book_seq;
	}
	public int getReply_star_rate() {
		return reply_star_rate;
	}
	public void setReply_star_rate(int reply_star_rate) {
		this.reply_star_rate = reply_star_rate;
	}
	public int getReply_like() {
		return reply_like;
	}
	public void setReply_like(int reply_like) {
		this.reply_like = reply_like;
	}
	public int getRefer() {
		return refer;
	}
	public void setRefer(int refer) {
		this.refer = refer;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}
	
	
	@Override
	public String toString() {
		return "ReplyDto [reply_seq=" + reply_seq + ", book_seq=" + book_seq + ", reply_like=" + reply_like + ", refer="
				+ refer + ", depth=" + depth + ", step=" + step + ", user_id=" + user_id + ", reply_content="
				+ reply_content + ", reply_date=" + reply_date + "]";
	}
	
	
}
