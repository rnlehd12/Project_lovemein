package bclass.finalproject.lovemein.talk.model.vo;

public class TalkPartner {

	private static final long serialVersionUID = 2225L;
	
	private String p_no;
	private String p_name;	//좋아하는 사람 이름  //찜받은 사람 이름
	private String p_profileImg;	//좋아하는 사람 프로필 //찜받은 사람 프로필
	private String p_age; 
	private String p_job; 
	private String p_sch; 
	private String p_loc;  
	private String p_feed;  //상대피드
	
	public TalkPartner() {}

	

	public TalkPartner(String p_no, String p_name, String p_profileImg, String p_age, String p_job, String p_sch,
			String p_loc, String p_feed) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_profileImg = p_profileImg;
		this.p_age = p_age;
		this.p_job = p_job;
		this.p_sch = p_sch;
		this.p_loc = p_loc;
		this.p_feed = p_feed;
	}



	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_profileImg() {
		return p_profileImg;
	}

	public void setP_profileImg(String p_profileImg) {
		this.p_profileImg = p_profileImg;
	}

	public String getP_age() {
		return p_age;
	}

	public void setP_age(String p_age) {
		this.p_age = p_age;
	}

	public String getP_job() {
		return p_job;
	}

	public void setP_job(String p_job) {
		this.p_job = p_job;
	}

	public String getP_sch() {
		return p_sch;
	}

	public void setP_sch(String p_sch) {
		this.p_sch = p_sch;
	}

	public String getP_loc() {
		return p_loc;
	}

	public void setP_loc(String p_loc) {
		this.p_loc = p_loc;
	}
	
	

	public String getP_feed() {
		return p_feed;
	}



	public void setP_feed(String p_feed) {
		this.p_feed = p_feed;
	}



	@Override
	public String toString() {
		return "TalkPartner [p_no=" + p_no + ", p_name=" + p_name + ", p_profileImg=" + p_profileImg + ", p_age="
				+ p_age + ", p_job=" + p_job + ", p_sch=" + p_sch + ", p_loc=" + p_loc + ", p_feed=" + p_feed + "]";
	}



	
	
}
