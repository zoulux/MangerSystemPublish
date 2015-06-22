package com.zlx.tools;

public class UserBean {

	@Override
	public String toString() {
		return "UserBean [sno=" + sno + ", sname=" + sname + ", sports="
				+ sports + ", shufen=" + shufen + ", jiexi=" + jiexi
				+ ", gaodai=" + gaodai + ", safe=" + safe + ", english="
				+ english + ", englishNet=" + englishNet + ", lishi=" + lishi
				+ ", wuli=" + xingshi + "]" + "\n";
	}

	public UserBean(String sno, String sname, String sports, String shufen,
			String jiexi, String gaodai, String safe, String english,
			String englishNet, String lishi, String xingshi) {
		this.sno = sno;
		this.sname = sname;
		this.sports = sports;
		this.shufen = shufen;
		this.jiexi = jiexi;
		this.gaodai = gaodai;
		this.safe = safe;
		this.english = english;
		this.englishNet = englishNet;
		this.lishi = lishi;
		this.xingshi = xingshi;
	}

	String sno;
	String sname;
	String sports;
	String shufen;
	String jiexi;
	String gaodai;
	String safe;
	String english;
	String englishNet;
	String lishi;
	String xingshi;

	public String getXingshi() {
		return xingshi;
	}

	public void setXingshi(String xingshi) {
		this.xingshi = xingshi;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getGaodai() {
		return gaodai;
	}

	public void setGaodai(String gaodai) {
		this.gaodai = gaodai;
	}

	public String getEnglishNet() {
		return englishNet;
	}

	public void setEnglishNet(String englishNet) {
		this.englishNet = englishNet;
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSnamne(String snamne) {
		this.sname = snamne;
	}

	public String getSports() {
		return sports;
	}

	public void setSports(String sports) {
		this.sports = sports;
	}

	public String getShufen() {
		return shufen;
	}

	public void setShufen(String shufen) {
		this.shufen = shufen;
	}

	public String getJiexi() {
		return jiexi;
	}

	public void setJiexi(String jiexi) {
		this.jiexi = jiexi;
	}

	public String getSafe() {
		return safe;
	}

	public void setSafe(String safe) {
		this.safe = safe;
	}

	public String getEnglish() {
		return english;
	}

	public void setEnglish(String english) {
		this.english = english;
	}

	public String getLishi() {
		return lishi;
	}

	public void setLishi(String lishi) {
		this.lishi = lishi;
	}


}
