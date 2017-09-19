package sesoc.global.redocean.vo;

public class Donation {
	int gave_num;
	String bdcardnum, email, toEmail;
	public Donation() {
		// TODO Auto-generated constructor stub
	}
	public Donation(int gave_num, String bdcardnum, String email, String toEmail) {
		super();
		this.gave_num = gave_num;
		this.bdcardnum = bdcardnum;
		this.email = email;
		this.toEmail = toEmail;
	}
	
	public int getGave_num() {
		return gave_num;
	}
	public void setGave_num(int gave_num) {
		this.gave_num = gave_num;
	}
	public String getBdcardnum() {
		return bdcardnum;
	}
	public void setBdcardnum(String bdcardnum) {
		this.bdcardnum = bdcardnum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getToEmail() {
		return toEmail;
	}
	public void setToEmail(String toEmail) {
		this.toEmail = toEmail;
	}
	@Override
	public String toString() {
		return "Donation [gave_num=" + gave_num + ", bdcardnum=" + bdcardnum + ", email=" + email + ", toEmail="
				+ toEmail + "]";
	}
	
	
	
}
