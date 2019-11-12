package bclass.finalproject.lovemein.payment.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Payment  implements Serializable {

	private static final long serialVersionUID = 2100;
	
	
	private String p_no;
	private java.util.Date p_date;
	private String u_no;
	private int p_coin;
	private int p_price;
	
	public Payment() {}

	public Payment(String p_no, Date p_date, String u_no, int p_coin, int p_price) {
		super();
		this.p_no = p_no;
		this.p_date = p_date;
		this.u_no = u_no;
		this.p_coin = p_coin;
		this.p_price = p_price;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public java.util.Date getP_date() {
		return p_date;
	}

	public void setP_date(java.util.Date p_date) {
		this.p_date = p_date;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public int getP_coin() {
		return p_coin;
	}

	public void setP_coin(int p_coin) {
		this.p_coin = p_coin;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	@Override
	public String toString() {
		return "Payment [p_no=" + p_no + ", p_date=" + p_date + ", u_no=" + u_no + ", p_coin=" + p_coin + ", p_price="
				+ p_price + "]";
	}
	
	
	
}
