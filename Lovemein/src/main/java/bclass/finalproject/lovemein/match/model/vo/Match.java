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
	private int my_i_age; //내이상형나이
	private String my_i_job; //내이상형직업 
	private String my_i_loc; //내이상형지역
	private int my_i_height; //내이상형키
	private String my_i_shc; //내이상형학교
	private String my_i_gen; //내이상형성별
	
	private String mat_no; // 매칭상대번호
	private String mat_name; // 상대이름
	private String mat_prof; // 상대프로필
	private int mat_age; // 상대나이
	private String mat_job; // 상대직업
	private String mat_loc; // 상대지역
	private int mat_height; // 상대키
	private String mat_shc; // 상대학교
	private String mat_gen; // 상대성별
	
	public Match() {}
	
	
	public Match(String my_no, int my_i_age, String my_i_job, String my_i_loc, int my_i_height, String my_i_shc,
			String my_i_gen, String mat_no, String mat_name, String mat_prof, int mat_age, String mat_job,
			String mat_loc, int mat_height, String mat_shc, String mat_gen) {
		super();
		this.my_no = my_no;
		this.my_i_age = my_i_age;
		this.my_i_job = my_i_job;
		this.my_i_loc = my_i_loc;
		this.my_i_height = my_i_height;
		this.my_i_shc = my_i_shc;
		this.my_i_gen = my_i_gen;
		this.mat_no = mat_no;
		this.mat_name = mat_name;
		this.mat_prof = mat_prof;
		this.mat_age = mat_age;
		this.mat_job = mat_job;
		this.mat_loc = mat_loc;
		this.mat_height = mat_height;
		this.mat_shc = mat_shc;
		this.mat_gen = mat_gen;
	}


	public String getMy_no() {
		return my_no;
	}
	
	
	public void setMy_no(String my_no) {
		this.my_no = my_no;
	}
	public int getMy_i_age() {
		return my_i_age;
	}
	public void setMy_i_age(int my_i_age) {
		this.my_i_age = my_i_age;
	}
	public String getMy_i_job() {
		return my_i_job;
	}
	public void setMy_i_job(String my_i_job) {
		this.my_i_job = my_i_job;
	}
	public String getMy_i_loc() {
		return my_i_loc;
	}
	public void setMy_i_loc(String my_i_loc) {
		this.my_i_loc = my_i_loc;
	}
	public int getMy_i_height() {
		return my_i_height;
	}
	public void setMy_i_height(int my_i_height) {
		this.my_i_height = my_i_height;
	}
	public String getMy_i_shc() {
		return my_i_shc;
	}
	public void setMy_i_shc(String my_i_shc) {
		this.my_i_shc = my_i_shc;
	}
	public String getMy_i_gen() {
		return my_i_gen;
	}
	public void setMy_i_gen(String my_i_gen) {
		this.my_i_gen = my_i_gen;
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
	public String getMat_shc() {
		return mat_shc;
	}
	public void setMat_shc(String mat_shc) {
		this.mat_shc = mat_shc;
	}
	public String getMat_gen() {
		return mat_gen;
	}
	public void setMat_gen(String mat_gen) {
		this.mat_gen = mat_gen;
	}


	@Override
	public String toString() {
		return "Match [my_no=" + my_no + ", my_i_age=" + my_i_age + ", my_i_job=" + my_i_job + ", my_i_loc=" + my_i_loc
				+ ", my_i_height=" + my_i_height + ", my_i_shc=" + my_i_shc + ", my_i_gen=" + my_i_gen + ", mat_no="
				+ mat_no + ", mat_name=" + mat_name + ", mat_prof=" + mat_prof + ", mat_age=" + mat_age + ", mat_job="
				+ mat_job + ", mat_loc=" + mat_loc + ", mat_height=" + mat_height + ", mat_shc=" + mat_shc
				+ ", mat_gen=" + mat_gen + "]";
	}
	
	
	
	
}
