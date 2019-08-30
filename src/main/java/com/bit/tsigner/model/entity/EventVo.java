package com.bit.tsigner.model.entity;

import java.sql.Timestamp;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class EventVo {
	int event_seq, event_hits;
	String event_title, event_content, event_writer_id, event_type;
	String event_file_path1, event_file_path2, event_file_path3;
	String event_file_path4, event_file_path5;
	Timestamp regi_date, modi_date;
	MultipartFile[] upload_files;	//getter setter만 만들어줬음
	
	public EventVo() {
		// TODO Auto-generated constructor stub
	}

	public EventVo(int event_seq, int event_hits, String event_title, String event_content, String event_writer_id,
			String event_type, String event_file_path1, String event_file_path2, String event_file_path3,
			String event_file_path4, String event_file_path5, Timestamp regi_date, Timestamp modi_date,
			MultipartFile[] upload_files) {
		super();
		this.event_seq = event_seq;
		this.event_hits = event_hits;
		this.event_title = event_title;
		this.event_content = event_content;
		this.event_writer_id = event_writer_id;
		this.event_type = event_type;
		this.event_file_path1 = event_file_path1;
		this.event_file_path2 = event_file_path2;
		this.event_file_path3 = event_file_path3;
		this.event_file_path4 = event_file_path4;
		this.event_file_path5 = event_file_path5;
		this.regi_date = regi_date;
		this.modi_date = modi_date;
		this.upload_files = upload_files;
	}

	@Override
	public String toString() {
		return "EventVo [event_seq=" + event_seq + ", event_hits=" + event_hits + ", event_title=" + event_title
				+ ", event_content=" + event_content + ", event_writer_id=" + event_writer_id + ", event_type="
				+ event_type + ", event_file_path1=" + event_file_path1 + ", event_file_path2=" + event_file_path2
				+ ", event_file_path3=" + event_file_path3 + ", event_file_path4=" + event_file_path4
				+ ", event_file_path5=" + event_file_path5 + ", regi_date=" + regi_date + ", modi_date=" + modi_date
				+ ", upload_files=" + Arrays.toString(upload_files) + "]";
	}

	public int getEvent_seq() {
		return event_seq;
	}

	public void setEvent_seq(int event_seq) {
		this.event_seq = event_seq;
	}

	public int getEvent_hits() {
		return event_hits;
	}

	public void setEvent_hits(int event_hits) {
		this.event_hits = event_hits;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public String getEvent_writer_id() {
		return event_writer_id;
	}

	public void setEvent_writer_id(String event_writer_id) {
		this.event_writer_id = event_writer_id;
	}

	public String getEvent_type() {
		return event_type;
	}

	public void setEvent_type(String event_type) {
		this.event_type = event_type;
	}

	public String getEvent_file_path1() {
		return event_file_path1;
	}

	public void setEvent_file_path1(String event_file_path1) {
		this.event_file_path1 = event_file_path1;
	}

	public String getEvent_file_path2() {
		return event_file_path2;
	}

	public void setEvent_file_path2(String event_file_path2) {
		this.event_file_path2 = event_file_path2;
	}

	public String getEvent_file_path3() {
		return event_file_path3;
	}

	public void setEvent_file_path3(String event_file_path3) {
		this.event_file_path3 = event_file_path3;
	}

	public String getEvent_file_path4() {
		return event_file_path4;
	}

	public void setEvent_file_path4(String event_file_path4) {
		this.event_file_path4 = event_file_path4;
	}

	public String getEvent_file_path5() {
		return event_file_path5;
	}

	public void setEvent_file_path5(String event_file_path5) {
		this.event_file_path5 = event_file_path5;
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

	public MultipartFile[] getUpload_files() {
		return upload_files;
	}

	public void setUpload_files(MultipartFile[] upload_files) {
		this.upload_files = upload_files;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((event_content == null) ? 0 : event_content.hashCode());
		result = prime * result + ((event_file_path1 == null) ? 0 : event_file_path1.hashCode());
		result = prime * result + ((event_file_path2 == null) ? 0 : event_file_path2.hashCode());
		result = prime * result + ((event_file_path3 == null) ? 0 : event_file_path3.hashCode());
		result = prime * result + ((event_file_path4 == null) ? 0 : event_file_path4.hashCode());
		result = prime * result + ((event_file_path5 == null) ? 0 : event_file_path5.hashCode());
		result = prime * result + event_hits;
		result = prime * result + event_seq;
		result = prime * result + ((event_title == null) ? 0 : event_title.hashCode());
		result = prime * result + ((event_type == null) ? 0 : event_type.hashCode());
		result = prime * result + ((event_writer_id == null) ? 0 : event_writer_id.hashCode());
		result = prime * result + Arrays.hashCode(upload_files);
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
		EventVo other = (EventVo) obj;
		if (event_content == null) {
			if (other.event_content != null)
				return false;
		} else if (!event_content.equals(other.event_content))
			return false;
		if (event_file_path1 == null) {
			if (other.event_file_path1 != null)
				return false;
		} else if (!event_file_path1.equals(other.event_file_path1))
			return false;
		if (event_file_path2 == null) {
			if (other.event_file_path2 != null)
				return false;
		} else if (!event_file_path2.equals(other.event_file_path2))
			return false;
		if (event_file_path3 == null) {
			if (other.event_file_path3 != null)
				return false;
		} else if (!event_file_path3.equals(other.event_file_path3))
			return false;
		if (event_file_path4 == null) {
			if (other.event_file_path4 != null)
				return false;
		} else if (!event_file_path4.equals(other.event_file_path4))
			return false;
		if (event_file_path5 == null) {
			if (other.event_file_path5 != null)
				return false;
		} else if (!event_file_path5.equals(other.event_file_path5))
			return false;
		if (event_hits != other.event_hits)
			return false;
		if (event_seq != other.event_seq)
			return false;
		if (event_title == null) {
			if (other.event_title != null)
				return false;
		} else if (!event_title.equals(other.event_title))
			return false;
		if (event_type == null) {
			if (other.event_type != null)
				return false;
		} else if (!event_type.equals(other.event_type))
			return false;
		if (event_writer_id == null) {
			if (other.event_writer_id != null)
				return false;
		} else if (!event_writer_id.equals(other.event_writer_id))
			return false;
		if (!Arrays.equals(upload_files, other.upload_files))
			return false;
		return true;
	}
	
	
	
	
}

