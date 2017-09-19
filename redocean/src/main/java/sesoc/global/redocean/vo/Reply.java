package sesoc.global.redocean.vo;

public class Reply {

	int replynum;
	String custid, text, inputdate; 
	int boardnum;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int replynum, String custid, String text, String inputdate, int boardnum) {
		super();
		this.replynum = replynum;
		this.custid = custid;
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

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
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
		return "Reply [replynum=" + replynum + ", custid=" + custid + ", text=" + text + ", inputdate=" + inputdate
				+ ", boardnum=" + boardnum + "]";
	}

	
}
