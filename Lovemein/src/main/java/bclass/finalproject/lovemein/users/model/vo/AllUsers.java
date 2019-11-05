package bclass.finalproject.lovemein.users.model.vo;

import java.io.Serializable;
import java.sql.Date;

//회원 세션 저장용 VO by 귀정
public class AllUsers implements Serializable{

	private static final long serialVersionUID = 1115L;
	
	private String u_no;
	private String u_email;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private int u_coin;
	private String u_billing;
	private String u_intro;
	private String u_profile;
	private java.sql.Date join_date;
	private java.sql.Date u_birth;
	private String u_gender;
	private String u_loc;
	private String u_edu;
	private String u_shcool;
	private String u_job;
	private int u_height;
	private String u_weight;
	private String u_blood;
	private String u_char;
	private String u_rei;
	private int u_drinking;
	private int u_smoking;
	private String s_appeal;
	private String s_inter;
	private String s_ds;
	private String s_ls;
	private int i_height;
	private String i_loc;
	private String i_edu;
	private int i_age;
	private String i_weight;
	
	public AllUsers() {}

	public AllUsers(String u_no, String u_email, String u_pw, String u_name, String u_phone, int coin, String u_billing,
			String u_intro, String u_profile, Date join_date, Date u_birth, String u_gender, String u_loc, String u_edu,
			String u_shcool, String u_job, int u_height, String u_weight, String u_blood, String u_char, String u_rei,
			int u_drinking, int u_smoking, String s_appeal, String s_inter, String s_ds, String s_ls, int i_height,
			String i_loc, String i_edu, int i_age, String i_weight) {
		super();
		this.u_no = u_no;
		this.u_email = u_email;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_coin = coin;
		this.u_billing = u_billing;
		this.u_intro = u_intro;
		this.u_profile = u_profile;
		this.join_date = join_date;
		this.u_birth = u_birth;
		this.u_gender = u_gender;
		this.u_loc = u_loc;
		this.u_edu = u_edu;
		this.u_shcool = u_shcool;
		this.u_job = u_job;
		this.u_height = u_height;
		this.u_weight = u_weight;
		this.u_blood = u_blood;
		this.u_char = u_char;
		this.u_rei = u_rei;
		this.u_drinking = u_drinking;
		this.u_smoking = u_smoking;
		this.s_appeal = s_appeal;
		this.s_inter = s_inter;
		this.s_ds = s_ds;
		this.s_ls = s_ls;
		this.i_height = i_height;
		this.i_loc = i_loc;
		this.i_edu = i_edu;
		this.i_age = i_age;
		this.i_weight = i_weight;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public int getU_coin() {
		return u_coin;
	}

	public void setU_Coin(int coin) {
		this.u_coin = coin;
	}

	public String getU_billing() {
		return u_billing;
	}

	public void setU_billing(String u_billing) {
		this.u_billing = u_billing;
	}

	public String getU_intro() {
		return u_intro;
	}

	public void setU_intro(String u_intro) {
		this.u_intro = u_intro;
	}

	public String getU_profile() {
		return u_profile;
	}

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public java.sql.Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(java.sql.Date join_date) {
		this.join_date = join_date;
	}

	public java.sql.Date getU_birth() {
		return u_birth;
	}

	public void setU_birth(java.sql.Date u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_loc() {
		return u_loc;
	}

	public void setU_loc(String u_loc) {
		this.u_loc = u_loc;
	}

	public String getU_edu() {
		return u_edu;
	}

	public void setU_edu(String u_edu) {
		this.u_edu = u_edu;
	}

	public String getU_shcool() {
		return u_shcool;
	}

	public void setU_shcool(String u_shcool) {
		this.u_shcool = u_shcool;
	}

	public String getU_job() {
		return u_job;
	}

	public void setU_job(String u_job) {
		this.u_job = u_job;
	}

	public int getU_height() {
		return u_height;
	}

	public void setU_height(int u_height) {
		this.u_height = u_height;
	}

	public String getU_weight() {
		return u_weight;
	}

	public void setU_weight(String u_weight) {
		this.u_weight = u_weight;
	}

	public String getU_blood() {
		return u_blood;
	}

	public void setU_blood(String u_blood) {
		this.u_blood = u_blood;
	}

	public String getU_char() {
		return u_char;
	}

	public void setU_char(String u_char) {
		this.u_char = u_char;
	}

	public String getU_rei() {
		return u_rei;
	}

	public void setU_rei(String u_rei) {
		this.u_rei = u_rei;
	}

	public int getU_drinking() {
		return u_drinking;
	}

	public void setU_drinking(int u_drinking) {
		this.u_drinking = u_drinking;
	}

	public int getU_smoking() {
		return u_smoking;
	}

	public void setU_smoking(int u_smoking) {
		this.u_smoking = u_smoking;
	}

	public String getS_appeal() {
		return s_appeal;
	}

	public void setS_appeal(String s_appeal) {
		this.s_appeal = s_appeal;
	}

	public String getS_inter() {
		return s_inter;
	}

	public void setS_inter(String s_inter) {
		this.s_inter = s_inter;
	}

	public String getS_ds() {
		return s_ds;
	}

	public void setS_ds(String s_ds) {
		this.s_ds = s_ds;
	}

	public String getS_ls() {
		return s_ls;
	}

	public void setS_ls(String s_ls) {
		this.s_ls = s_ls;
	}

	public int getI_height() {
		return i_height;
	}

	public void setI_height(int i_height) {
		this.i_height = i_height;
	}

	public String getI_loc() {
		return i_loc;
	}

	public void setI_loc(String i_loc) {
		this.i_loc = i_loc;
	}

	public String getI_edu() {
		return i_edu;
	}

	public void setI_edu(String i_edu) {
		this.i_edu = i_edu;
	}

	public int getI_age() {
		return i_age;
	}

	public void setI_age(int i_age) {
		this.i_age = i_age;
	}

	public String getI_weight() {
		return i_weight;
	}

	public void setI_weight(String i_weight) {
		this.i_weight = i_weight;
	}

	@Override
	public String toString() {
		return "AllUsers [u_no=" + u_no + ", u_email=" + u_email + ", u_pw=" + u_pw + ", u_name=" + u_name
				+ ", u_phone=" + u_phone + ", u_coin=" + u_coin + ", u_billing=" + u_billing + ", u_intro=" + u_intro
				+ ", u_profile=" + u_profile + ", join_date=" + join_date + ", u_birth=" + u_birth + ", u_gender="
				+ u_gender + ", u_loc=" + u_loc + ", u_edu=" + u_edu + ", u_shcool=" + u_shcool + ", u_job=" + u_job
				+ ", u_height=" + u_height + ", u_weight=" + u_weight + ", u_blood=" + u_blood + ", u_char=" + u_char
				+ ", u_rei=" + u_rei + ", u_drinking=" + u_drinking + ", u_smoking=" + u_smoking + ", s_appeal="
				+ s_appeal + ", s_inter=" + s_inter + ", s_ds=" + s_ds + ", s_ls=" + s_ls + ", i_height=" + i_height
				+ ", i_loc=" + i_loc + ", i_edu=" + i_edu + ", i_age=" + i_age + ", i_weight=" + i_weight + "]";
	}
	
	
	
}
