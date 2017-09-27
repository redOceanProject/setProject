package sesoc.global.redocean.vo;

public class Bdvolume {

	String bdvolume, consituent;
	public Bdvolume() {
		// TODO Auto-generated constructor stub
	}
	public Bdvolume(String bdvolume, String consituent) {
		super();
		this.bdvolume = bdvolume;
		this.consituent = consituent;
	}
	public String getBdvolume() {
		return bdvolume;
	}
	public void setBdvolume(String bdvolume) {
		this.bdvolume = bdvolume;
	}
	public String getConsituent() {
		return consituent;
	}
	public void setConsituent(String consituent) {
		this.consituent = consituent;
	}
	@Override
	public String toString() {
		return "Bdvolume [bdvolume=" + bdvolume + ", consituent=" + consituent + "]";
	}
	
}
