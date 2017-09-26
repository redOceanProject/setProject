package sesoc.global.redocean.vo;

public class Bdcard {

   String bdcardnum, consituent, btype, bdbar_num, bdbirth, gender, name, bddate, bdcenter, email;
   int status;
   String bloodvolume, toemail;
   int boardnum;
   public Bdcard() {
      super();
      // TODO Auto-generated constructor stub
   }
   public Bdcard(String bdcardnum, String consituent, String btype, String bdbar_num, String bdbirth, String gender,
         String name, String bddate, String bdcenter, String email, int status, String bloodvolume, String toemail,
         int boardnum) {
      super();
      this.bdcardnum = bdcardnum;
      this.consituent = consituent;
      this.btype = btype;
      this.bdbar_num = bdbar_num;
      this.bdbirth = bdbirth;
      this.gender = gender;
      this.name = name;
      this.bddate = bddate;
      this.bdcenter = bdcenter;
      this.email = email;
      this.status = status;
      this.bloodvolume = bloodvolume;
      this.toemail = toemail;
      this.boardnum = boardnum;
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
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
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
   public int getStatus() {
      return status;
   }
   public void setStatus(int status) {
      this.status = status;
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
   public int getBoardnum() {
      return boardnum;
   }
   public void setBoardnum(int boardnum) {
      this.boardnum = boardnum;
   }
   @Override
   public String toString() {
      return "Bdcard [bdcardnum=" + bdcardnum + ", consituent=" + consituent + ", btype=" + btype + ", bdbar_num="
            + bdbar_num + ", bdbirth=" + bdbirth + ", gender=" + gender + ", name=" + name + ", bddate=" + bddate
            + ", bdcenter=" + bdcenter + ", email=" + email + ", status=" + status + ", bloodvolume=" + bloodvolume
            + ", toemail=" + toemail + ", boardnum=" + boardnum + "]";
   }
   
   
   
}