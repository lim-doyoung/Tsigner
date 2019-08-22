package com.bit.tsigner.model.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class CommunityVo {
	
	int cmnt_seq,cmnt_hits,cmnt_recom;
	String cmnt_title,cmnt_content,cmnt_writer_id,plan_code,cmnt_file_path1,cmnt_file_path2,cmnt_file_path3,cmnt_file_path4,cmnt_file_path5,cmnt_type,cmnt_filename;
	Timestamp regi_date,modi_date;
	
	public CommunityVo() {
		// TODO Auto-generated constructor stub
	}

	public int getCmnt_seq() {
		return cmnt_seq;
	}

	public void setCmnt_seq(int cmnt_seq) {
		this.cmnt_seq = cmnt_seq;
	}

	public int getCmnt_hits() {
		return cmnt_hits;
	}

	public void setCmnt_hits(int cmnt_hits) {
		this.cmnt_hits = cmnt_hits;
	}

	public int getCmnt_recom() {
		return cmnt_recom;
	}

	public void setCmnt_recom(int cmnt_recom) {
		this.cmnt_recom = cmnt_recom;
	}

	public String getCmnt_title() {
		return cmnt_title;
	}

	public void setCmnt_title(String cmnt_title) {
		this.cmnt_title = cmnt_title;
	}

	public String getCmnt_content() {
		return cmnt_content;
	}

	public void setCmnt_content(String cmnt_content) {
		this.cmnt_content = cmnt_content;
	}

	public String getCmnt_writer_id() {
		return cmnt_writer_id;
	}

	public void setCmnt_writer_id(String cmnt_writer_id) {
		this.cmnt_writer_id = cmnt_writer_id;
	}

	public String getPlan_code() {
		return plan_code;
	}

	public void setPlan_code(String plan_code) {
		this.plan_code = plan_code;
	}

	public String getCmnt_file_path1() {
		return cmnt_file_path1;
	}

	public void setCmnt_file_path1(String cmnt_file_path1) {
		this.cmnt_file_path1 = cmnt_file_path1;
	}

	public String getCmnt_file_path2() {
		return cmnt_file_path2;
	}

	public void setCmnt_file_path2(String cmnt_file_path2) {
		this.cmnt_file_path2 = cmnt_file_path2;
	}

	public String getCmnt_file_path3() {
		return cmnt_file_path3;
	}

	public void setCmnt_file_path3(String cmnt_file_path3) {
		this.cmnt_file_path3 = cmnt_file_path3;
	}

	public String getCmnt_file_path4() {
		return cmnt_file_path4;
	}

	public void setCmnt_file_path4(String cmnt_file_path4) {
		this.cmnt_file_path4 = cmnt_file_path4;
	}

	public String getCmnt_file_path5() {
		return cmnt_file_path5;
	}

	public void setCmnt_file_path5(String cmnt_file_path5) {
		this.cmnt_file_path5 = cmnt_file_path5;
	}

	public String getCmnt_type() {
		return cmnt_type;
	}

	public void setCmnt_type(String cmnt_type) {
		this.cmnt_type = cmnt_type;
	}

	public String getCmnt_filename() {
		return cmnt_filename;
	}

	public void setCmnt_filename(String cmnt_filename) {
		this.cmnt_filename = cmnt_filename;
	}

	public Timestamp getRegi_date() {
		return regi_date;
	}

	public void setRegi_date(Timestamp regi_date) {
		this.regi_date = regi_date;
	}

	public Timestamp getModi_date() {
		return modi_date;
	}

	public void setModi_date(Timestamp modi_date) {
		this.modi_date = modi_date;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cmnt_content == null) ? 0 : cmnt_content.hashCode());
		result = prime * result + ((cmnt_file_path1 == null) ? 0 : cmnt_file_path1.hashCode());
		result = prime * result + ((cmnt_file_path2 == null) ? 0 : cmnt_file_path2.hashCode());
		result = prime * result + ((cmnt_file_path3 == null) ? 0 : cmnt_file_path3.hashCode());
		result = prime * result + ((cmnt_file_path4 == null) ? 0 : cmnt_file_path4.hashCode());
		result = prime * result + ((cmnt_file_path5 == null) ? 0 : cmnt_file_path5.hashCode());
		result = prime * result + ((cmnt_filename == null) ? 0 : cmnt_filename.hashCode());
		result = prime * result + cmnt_hits;
		result = prime * result + cmnt_recom;
		result = prime * result + cmnt_seq;
		result = prime * result + ((cmnt_title == null) ? 0 : cmnt_title.hashCode());
		result = prime * result + ((cmnt_type == null) ? 0 : cmnt_type.hashCode());
		result = prime * result + ((cmnt_writer_id == null) ? 0 : cmnt_writer_id.hashCode());
		result = prime * result + ((plan_code == null) ? 0 : plan_code.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommunityVo other = (CommunityVo) obj;
		if (cmnt_content == null) {
			if (other.cmnt_content != null)
				return false;
		} else if (!cmnt_content.equals(other.cmnt_content))
			return false;
		if (cmnt_file_path1 == null) {
			if (other.cmnt_file_path1 != null)
				return false;
		} else if (!cmnt_file_path1.equals(other.cmnt_file_path1))
			return false;
		if (cmnt_file_path2 == null) {
			if (other.cmnt_file_path2 != null)
				return false;
		} else if (!cmnt_file_path2.equals(other.cmnt_file_path2))
			return false;
		if (cmnt_file_path3 == null) {
			if (other.cmnt_file_path3 != null)
				return false;
		} else if (!cmnt_file_path3.equals(other.cmnt_file_path3))
			return false;
		if (cmnt_file_path4 == null) {
			if (other.cmnt_file_path4 != null)
				return false;
		} else if (!cmnt_file_path4.equals(other.cmnt_file_path4))
			return false;
		if (cmnt_file_path5 == null) {
			if (other.cmnt_file_path5 != null)
				return false;
		} else if (!cmnt_file_path5.equals(other.cmnt_file_path5))
			return false;
		if (cmnt_filename == null) {
			if (other.cmnt_filename != null)
				return false;
		} else if (!cmnt_filename.equals(other.cmnt_filename))
			return false;
		if (cmnt_hits != other.cmnt_hits)
			return false;
		if (cmnt_recom != other.cmnt_recom)
			return false;
		if (cmnt_seq != other.cmnt_seq)
			return false;
		if (cmnt_title == null) {
			if (other.cmnt_title != null)
				return false;
		} else if (!cmnt_title.equals(other.cmnt_title))
			return false;
		if (cmnt_type == null) {
			if (other.cmnt_type != null)
				return false;
		} else if (!cmnt_type.equals(other.cmnt_type))
			return false;
		if (cmnt_writer_id == null) {
			if (other.cmnt_writer_id != null)
				return false;
		} else if (!cmnt_writer_id.equals(other.cmnt_writer_id))
			return false;
		if (plan_code == null) {
			if (other.plan_code != null)
				return false;
		} else if (!plan_code.equals(other.plan_code))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CommunityVo [cmnt_seq=" + cmnt_seq + ", cmnt_hits=" + cmnt_hits + ", cmnt_recom=" + cmnt_recom
				+ ", cmnt_title=" + cmnt_title + ", cmnt_content=" + cmnt_content + ", cmnt_writer_id=" + cmnt_writer_id
				+ ", plan_code=" + plan_code + ", cmnt_file_path1=" + cmnt_file_path1 + ", cmnt_file_path2="
				+ cmnt_file_path2 + ", cmnt_file_path3=" + cmnt_file_path3 + ", cmnt_file_path4=" + cmnt_file_path4
				+ ", cmnt_file_path5=" + cmnt_file_path5 + ", cmnt_type=" + cmnt_type + ", cmnt_filename="
				+ cmnt_filename + ", regi_date=" + regi_date + ", modi_date=" + modi_date + "]";
	}

	public CommunityVo(int cmnt_seq, int cmnt_hits, int cmnt_recom, String cmnt_title, String cmnt_content,
			String cmnt_writer_id, String plan_code, String cmnt_file_path1, String cmnt_file_path2,
			String cmnt_file_path3, String cmnt_file_path4, String cmnt_file_path5, String cmnt_type,
			String cmnt_filename, Timestamp regi_date, Timestamp modi_date) {
		super();
		this.cmnt_seq = cmnt_seq;
		this.cmnt_hits = cmnt_hits;
		this.cmnt_recom = cmnt_recom;
		this.cmnt_title = cmnt_title;
		this.cmnt_content = cmnt_content;
		this.cmnt_writer_id = cmnt_writer_id;
		this.plan_code = plan_code;
		this.cmnt_file_path1 = cmnt_file_path1;
		this.cmnt_file_path2 = cmnt_file_path2;
		this.cmnt_file_path3 = cmnt_file_path3;
		this.cmnt_file_path4 = cmnt_file_path4;
		this.cmnt_file_path5 = cmnt_file_path5;
		this.cmnt_type = cmnt_type;
		this.cmnt_filename = cmnt_filename;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
	}


}
