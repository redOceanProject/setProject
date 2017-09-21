package sesoc.global.redocean.vo;

public class Reply {

	int replynum;
	String email, text, inputdate; 
	int boardnum;
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reply(int replynum, String email, String text, String inputdate, int boardnum) {
		super();
		this.replynum = replynum;
		this.email = email;
		this.text = text;
		this.inputdate = inputdate;
		this.boardnum = boardnum;
	}

	public int getReplynum() {
		return replynum;
	}

	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	@Override
	public String toString() {
		return "Reply [replynum=" + replynum + ", email=" + email + ", text=" + text + ", inputdate=" + inputdate
				+ ", boardnum=" + boardnum + "]";
	}
	
	
}
