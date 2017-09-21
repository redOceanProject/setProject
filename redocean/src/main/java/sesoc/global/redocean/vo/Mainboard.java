package sesoc.global.redocean.vo;

public class Mainboard {

	int boardnum;
	String email, name, title, content, inputdate, goal_date;
	int hits;
	String originalfile, savedfile, sickName;
	int status, goal_blood,blood_present;
	
	public Mainboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Mainboard(int boardnum, String email, String name, String title, String content, String inputdate,
			String goal_date, int hits, String originalfile, String savedfile, String sickName, int status,
			int goal_blood, int blood_present) {
		super();
		this.boardnum = boardnum;
		this.email = email;
		this.name = name;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.goal_date = goal_date;
		this.hits = hits;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.sickName = sickName;
		this.status = status;
		this.goal_blood = goal_blood;
		this.blood_present = blood_present;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public String getGoal_date() {
		return goal_date;
	}

	public void setGoal_date(String goal_date) {
		this.goal_date = goal_date;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getOriginalfile() {
		return originalfile;
	}

	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}

	public String getSavedfile() {
		return savedfile;
	}

	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}

	public String getSickName() {
		return sickName;
	}

	public void setSickName(String sickName) {
		this.sickName = sickName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getGoal_blood() {
		return goal_blood;
	}

	public void setGoal_blood(int goal_blood) {
		this.goal_blood = goal_blood;
	}

	public int getBlood_present() {
		return blood_present;
	}

	public void setBlood_present(int blood_present) {
		this.blood_present = blood_present;
	}

	@Override
	public String toString() {
		return "Mainboard [boardnum=" + boardnum + ", email=" + email + ", name=" + name + ", title=" + title
				+ ", content=" + content + ", inputdate=" + inputdate + ", goal_date=" + goal_date + ", hits=" + hits
				+ ", originalfile=" + originalfile + ", savedfile=" + savedfile + ", sickName=" + sickName + ", status="
				+ status + ", goal_blood=" + goal_blood + ", blood_present=" + blood_present + "]";
	}
	
	
	
}
