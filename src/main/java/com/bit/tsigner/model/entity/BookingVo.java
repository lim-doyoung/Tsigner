package com.bit.tsigner.model.entity;

import java.sql.Timestamp;

public class BookingVo {
	int num;
	String sub,content;
	int cnt;
	Timestamp nalja;
	
	public BookingVo() {
		// TODO Auto-generated constructor stub
	}

	public BookingVo(int num, String sub, String content, int cnt, Timestamp nalja) {
		super();
		this.num = num;
		this.sub = sub;
		this.content = content;
		this.cnt = cnt;
		this.nalja = nalja;
	}

	@Override
	public String toString() {
		return "BookingVo [num=" + num + ", sub=" + sub + ", content=" + content + ", cnt=" + cnt + ", nalja=" + nalja
				+ "]";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public Timestamp getNalja() {
		return nalja;
	}

	public void setNalja(Timestamp nalja) {
		this.nalja = nalja;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cnt;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + num;
		result = prime * result + ((sub == null) ? 0 : sub.hashCode());
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
		BookingVo other = (BookingVo) obj;
		if (cnt != other.cnt)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (num != other.num)
			return false;
		if (sub == null) {
			if (other.sub != null)
				return false;
		} else if (!sub.equals(other.sub))
			return false;
		return true;
	}
	
	
}
