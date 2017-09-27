package sesoc.global.redocean.vo;

public class Sick_status {

	int sick_id;
	String sick_name, email;
	int gave_num;
	public Sick_status() {
		// TODO Auto-generated constructor stub
	}
	public Sick_status(int sick_id, String sick_name, String email, int gave_num) {
		super();
		this.sick_id = sick_id;
		this.sick_name = sick_name;
		this.email = email;
		this.gave_num = gave_num;
	}
	public int getSick_id() {
		return sick_id;
	}
	public void setSick_id(int sick_id) {
		this.sick_id = sick_id;
	}
	public String getSick_name() {
		return sick_name;
	}
	public void setSick_name(String sick_name) {
		this.sick_name = sick_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getGave_num() {
		return gave_num;
	}
	public void setGave_num(int gave_num) {
		this.gave_num = gave_num;
	}
	@Override
	public String toString() {
		return "Sick_status [sick_id=" + sick_id + ", sick_name=" + sick_name + ", email=" + email + ", gave_num="
				+ gave_num + "]";
	}

}
