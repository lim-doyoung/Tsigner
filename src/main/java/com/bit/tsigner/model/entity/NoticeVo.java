package com.bit.tsigner.model.entity;

import java.sql.Timestamp;

public class NoticeVo {
	int noti_seq, noti_hits;
	String noti_title, noti_content, noti_writer_id, noti_type;
	String noti_file_path1, noti_file_path2, noti_file_path3;
	String noti_file_path4, noti_file_path5;
	Timestamp regi_date, modi_date;
	
	
	public NoticeVo() {
		// TODO Auto-generated constructor stub
	}


	public NoticeVo(int noti_seq, int noti_hits, String noti_title, String noti_content, String noti_writer_id,
			String noti_type, String noti_file_path1, String noti_file_path2, String noti_file_path3,
			String noti_file_path4, String noti_file_path5, Timestamp regi_date, Timestamp modi_date) {
		super();
		this.noti_seq = noti_seq;
		this.noti_hits = noti_hits;
		this.noti_title = noti_title;
		this.noti_content = noti_content;
		this.noti_writer_id = noti_writer_id;
		this.noti_type = noti_type;
		this.noti_file_path1 = noti_file_path1;
		this.noti_file_path2 = noti_file_path2;
		this.noti_file_path3 = noti_file_path3;
		this.noti_file_path4 = noti_file_path4;
		this.noti_file_path5 = noti_file_path5;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
	}


	@Override
	public String toString() {
		return "NoticeVo [noti_seq=" + noti_seq + ", noti_hits=" + noti_hits + ", noti_title=" + noti_title
				+ ", noti_content=" + noti_content + ", noti_writer_id=" + noti_writer_id + ", noti_type=" + noti_type
				+ ", noti_file_path1=" + noti_file_path1 + ", noti_file_path2=" + noti_file_path2 + ", noti_file_path3="
				+ noti_file_path3 + ", noti_file_path4=" + noti_file_path4 + ", noti_file_path5=" + noti_file_path5
				+ ", regi_date=" + regi_date + ", modi_date=" + modi_date + "]";
	}


	public int getNoti_seq() {
		return noti_seq;
	}


	public void setNoti_seq(int noti_seq) {
		this.noti_seq = noti_seq;
	}


	public int getNoti_hits() {
		return noti_hits;
	}


	public void setNoti_hits(int noti_hits) {
		this.noti_hits = noti_hits;
	}


	public String getNoti_title() {
		return noti_title;
	}


	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}


	public String getNoti_content() {
		return noti_content;
	}


	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}


	public String getNoti_writer_id() {
		return noti_writer_id;
	}


	public void setNoti_writer_id(String noti_writer_id) {
		this.noti_writer_id = noti_writer_id;
	}


	public String getNoti_type() {
		return noti_type;
	}


	public void setNoti_type(String noti_type) {
		this.noti_type = noti_type;
	}


	public String getNoti_file_path1() {
		return noti_file_path1;
	}


	public void setNoti_file_path1(String noti_file_path1) {
		this.noti_file_path1 = noti_file_path1;
	}


	public String getNoti_file_path2() {
		return noti_file_path2;
	}


	public void setNoti_file_path2(String noti_file_path2) {
		this.noti_file_path2 = noti_file_path2;
	}


	public String getNoti_file_path3() {
		return noti_file_path3;
	}


	public void setNoti_file_path3(String noti_file_path3) {
		this.noti_file_path3 = noti_file_path3;
	}


	public String getNoti_file_path4() {
		return noti_file_path4;
	}


	public void setNoti_file_path4(String noti_file_path4) {
		this.noti_file_path4 = noti_file_path4;
	}


	public String getNoti_file_path5() {
		return noti_file_path5;
	}


	public void setNoti_file_path5(String noti_file_path5) {
		this.noti_file_path5 = noti_file_path5;
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
		result = prime * result + ((noti_content == null) ? 0 : noti_content.hashCode());
		result = prime * result + ((noti_file_path1 == null) ? 0 : noti_file_path1.hashCode());
		result = prime * result + ((noti_file_path2 == null) ? 0 : noti_file_path2.hashCode());
		result = prime * result + ((noti_file_path3 == null) ? 0 : noti_file_path3.hashCode());
		result = prime * result + ((noti_file_path4 == null) ? 0 : noti_file_path4.hashCode());
		result = prime * result + ((noti_file_path5 == null) ? 0 : noti_file_path5.hashCode());
		result = prime * result + noti_hits;
		result = prime * result + noti_seq;
		result = prime * result + ((noti_title == null) ? 0 : noti_title.hashCode());
		result = prime * result + ((noti_type == null) ? 0 : noti_type.hashCode());
		result = prime * result + ((noti_writer_id == null) ? 0 : noti_writer_id.hashCode());
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
		NoticeVo other = (NoticeVo) obj;
		if (noti_content == null) {
			if (other.noti_content != null)
				return false;
		} else if (!noti_content.equals(other.noti_content))
			return false;
		if (noti_file_path1 == null) {
			if (other.noti_file_path1 != null)
				return false;
		} else if (!noti_file_path1.equals(other.noti_file_path1))
			return false;
		if (noti_file_path2 == null) {
			if (other.noti_file_path2 != null)
				return false;
		} else if (!noti_file_path2.equals(other.noti_file_path2))
			return false;
		if (noti_file_path3 == null) {
			if (other.noti_file_path3 != null)
				return false;
		} else if (!noti_file_path3.equals(other.noti_file_path3))
			return false;
		if (noti_file_path4 == null) {
			if (other.noti_file_path4 != null)
				return false;
		} else if (!noti_file_path4.equals(other.noti_file_path4))
			return false;
		if (noti_file_path5 == null) {
			if (other.noti_file_path5 != null)
				return false;
		} else if (!noti_file_path5.equals(other.noti_file_path5))
			return false;
		if (noti_hits != other.noti_hits)
			return false;
		if (noti_seq != other.noti_seq)
			return false;
		if (noti_title == null) {
			if (other.noti_title != null)
				return false;
		} else if (!noti_title.equals(other.noti_title))
			return false;
		if (noti_type == null) {
			if (other.noti_type != null)
				return false;
		} else if (!noti_type.equals(other.noti_type))
			return false;
		if (noti_writer_id == null) {
			if (other.noti_writer_id != null)
				return false;
		} else if (!noti_writer_id.equals(other.noti_writer_id))
			return false;
		return true;
	}
	
	
 	
	
	
	
	
	
}
