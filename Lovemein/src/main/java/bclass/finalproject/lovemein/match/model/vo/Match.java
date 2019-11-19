package bclass.finalproject.lovemein.match.model.vo;

//매칭정보_서영
public class Match {
	
	private static final long serialVersionUID = 2111L;
/*	<!-- 매칭 리스트용
	<select id="matchList" parameterType="AllUsers" resultType="AllUsers">
	</select> -->*/
//	내번호 이상형나이 이상형직업 이상형지역 이상형키 이상형학교 이상형성별
//	my_no,  my_i_age, my_i_job, my_i_loc, my_i_height, my_i_shc, my_i_gen
	private String my_no; //내번호 
	
	private String mat_no; // 매칭상대번호
	private String mat_name; // 상대이름
	private String mat_prof; // 상대프로필
	
	private int mat_age; // 상대나이
	private String mat_job; // 상대직업
	private String mat_loc; // 상대지역
	private int mat_height; // 상대키
	private String mat_sch; // 상대학교

	public Match() {}

	public Match(String my_no, String mat_no, String mat_name, String mat_prof, int mat_age, String mat_job,
			String mat_loc, int mat_height, String mat_sch) {
		super();
		this.my_no = my_no;
		this.mat_no = mat_no;
		this.mat_name = mat_name;
		this.mat_prof = mat_prof;
		this.mat_age = mat_age;
		this.mat_job = mat_job;
		this.mat_loc = mat_loc;
		this.mat_height = mat_height;
		this.mat_sch = mat_sch;
	}

	public String getMy_no() {
		return my_no;
	}

	public void setMy_no(String my_no) {
		this.my_no = my_no;
	}

	public String getMat_no() {
		return mat_no;
	}

	public void setMat_no(String mat_no) {
		this.mat_no = mat_no;
	}

	public String getMat_name() {
		return mat_name;
	}

	public void setMat_name(String mat_name) {
		this.mat_name = mat_name;
	}

	public String getMat_prof() {
		return mat_prof;
	}

	public void setMat_prof(String mat_prof) {
		this.mat_prof = mat_prof;
	}

	public int getMat_age() {
		return mat_age;
	}

	public void setMat_age(int mat_age) {
		this.mat_age = mat_age;
	}

	public String getMat_job() {
		return mat_job;
	}

	public void setMat_job(String mat_job) {
		this.mat_job = mat_job;
	}

	public String getMat_loc() {
		return mat_loc;
	}

	public void setMat_loc(String mat_loc) {
		this.mat_loc = mat_loc;
	}

	public int getMat_height() {
		return mat_height;
	}

	public void setMat_height(int mat_height) {
		this.mat_height = mat_height;
	}

	public String getMat_sch() {
		return mat_sch;
	}

	public void setMat_sch(String mat_sch) {
		this.mat_sch = mat_sch;
	}

	@Override
	public String toString() {
		return "Match [my_no=" + my_no + ", mat_no=" + mat_no + ", mat_name=" + mat_name + ", mat_prof=" + mat_prof
				+ ", mat_age=" + mat_age + ", mat_job=" + mat_job + ", mat_loc=" + mat_loc + ", mat_height="
				+ mat_height + ", mat_sch=" + mat_sch + "]";
	}
	
}
