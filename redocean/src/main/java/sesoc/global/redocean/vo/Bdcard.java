package sesoc.global.redocean.vo;

public class Bdcard {

	String bdcardnum, consituent, btype, bdbar_num, bdbirth, gender, bddate, bdcenter, email;
	int regi_type;
	String bloodvolume, toemail;
	public Bdcard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bdcard(String bdcardnum, String consituent, String btype, String bdbar_num, String bdbirth, String gender,
			String bddate, String bdcenter, String email, int regi_type, String bloodvolume, String toemail) {
		super();
		this.bdcardnum = bdcardnum;
		this.consituent = consituent;
		this.btype = btype;
		this.bdbar_num = bdbar_num;
		this.bdbirth = bdbirth;
		this.gender = gender;
		this.bddate = bddate;
		this.bdcenter = bdcenter;
		this.email = email;
		this.regi_type = regi_type;
		this.bloodvolume = bloodvolume;
		this.toemail = toemail;
	}
	public String getBdcardnum() {
		return bdcardnum;
	}
	public void setBdcardnum(String bdcardnum) {
		this.bdcardnum = bdcardnum;
	}
	public String getConsituent() {
		return consituent;
	}
	public void setConsituent(String consituent) {
		this.consituent = consituent;
	}
	public String getBtype() {
		return btype;
	}
	public void setBtype(String btype) {
		this.btype = btype;
	}
	public String getBdbar_num() {
		return bdbar_num;
	}
	public void setBdbar_num(String bdbar_num) {
		this.bdbar_num = bdbar_num;
	}
	public String getBdbirth() {
		return bdbirth;
	}
	public void setBdbirth(String bdbirth) {
		this.bdbirth = bdbirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBddate() {
		return bddate;
	}
	public void setBddate(String bddate) {
		this.bddate = bddate;
	}
	public String getBdcenter() {
		return bdcenter;
	}
	public void setBdcenter(String bdcenter) {
		this.bdcenter = bdcenter;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getRegi_type() {
		return regi_type;
	}
	public void setRegi_type(int regi_type) {
		this.regi_type = regi_type;
	}
	public String getBloodvolume() {
		return bloodvolume;
	}
	public void setBloodvolume(String bloodvolume) {
		this.bloodvolume = bloodvolume;
	}
	public String getToemail() {
		return toemail;
	}
	public void setToemail(String toemail) {
		this.toemail = toemail;
	}
	@Override
	public String toString() {
		return "Bdcard [bdcardnum=" + bdcardnum + ", consituent=" + consituent + ", btype=" + btype + ", bdbar_num="
				+ bdbar_num + ", bdbirth=" + bdbirth + ", gender=" + gender + ", bddate=" + bddate + ", bdcenter="
				+ bdcenter + ", email=" + email + ", regi_type=" + regi_type + ", bloodvolume=" + bloodvolume
				+ ", toemail=" + toemail + "]";
	}
	
}
