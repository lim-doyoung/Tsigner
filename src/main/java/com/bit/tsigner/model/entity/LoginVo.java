package com.bit.tsigner.model.entity;

import java.sql.Date;

public class LoginVo {
	private String user_id, password, user_name, user_nick_name, user_email, user_tel,user_birth;
	private int user_resi_num;
	private String user_mem_lev, sns_type, sns_id;
	private Date sns_conn_date, create_date, modi_date;
	
	public LoginVo() {
		// TODO Auto-generated constructor stub
	}

	public LoginVo(String user_id, String password, String user_name, String user_nick_name, String user_email,
			String user_tel, String user_birth, int user_resi_num, String user_mem_lev, String sns_type, String sns_id,
			Date sns_conn_date, Date create_date, Date modi_date) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.user_name = user_name;
		this.user_nick_name = user_nick_name;
		this.user_email = user_email;
		this.user_tel = user_tel;
		this.user_birth = user_birth;
		this.user_resi_num = user_resi_num;
		this.user_mem_lev = user_mem_lev;
		this.sns_type = sns_type;
		this.sns_id = sns_id;
		this.sns_conn_date = sns_conn_date;
		this.create_date = create_date;
		this.modi_date = modi_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nick_name() {
		return user_nick_name;
	}

	public void setUser_nick_name(String user_nick_name) {
		this.user_nick_name = user_nick_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public int getUser_resi_num() {
		return user_resi_num;
	}

	public void setUser_resi_num(int user_resi_num) {
		this.user_resi_num = user_resi_num;
	}

	public String getUser_mem_lev() {
		return user_mem_lev;
	}

	public void setUser_mem_lev(String user_mem_lev) {
		this.user_mem_lev = user_mem_lev;
	}

	public String getSns_type() {
		return sns_type;
	}

	public void setSns_type(String sns_type) {
		this.sns_type = sns_type;
	}

	public String getSns_id() {
		return sns_id;
	}

	public void setSns_id(String sns_id) {
		this.sns_id = sns_id;
	}

	public Date getSns_conn_date() {
		return sns_conn_date;
	}

	public void setSns_conn_date(Date sns_conn_date) {
		this.sns_conn_date = sns_conn_date;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getModi_date() {
		return modi_date;
	}

	public void setModi_date(Date modi_date) {
		this.modi_date = modi_date;
	}

	@Override
	public String toString() {
		return "LoginVo [user_id=" + user_id + ", password=" + password + ", user_name=" + user_name
				+ ", user_nick_name=" + user_nick_name + ", user_email=" + user_email + ", user_tel=" + user_tel
				+ ", user_birth=" + user_birth + ", user_resi_num=" + user_resi_num + ", user_mem_lev=" + user_mem_lev
				+ ", sns_type=" + sns_type + ", sns_id=" + sns_id + ", sns_conn_date=" + sns_conn_date
				+ ", create_date=" + create_date + ", modi_date=" + modi_date + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((create_date == null) ? 0 : create_date.hashCode());
		result = prime * result + ((modi_date == null) ? 0 : modi_date.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((sns_conn_date == null) ? 0 : sns_conn_date.hashCode());
		result = prime * result + ((sns_id == null) ? 0 : sns_id.hashCode());
		result = prime * result + ((sns_type == null) ? 0 : sns_type.hashCode());
		result = prime * result + ((user_birth == null) ? 0 : user_birth.hashCode());
		result = prime * result + ((user_email == null) ? 0 : user_email.hashCode());
		result = prime * result + ((user_id == null) ? 0 : user_id.hashCode());
		result = prime * result + ((user_mem_lev == null) ? 0 : user_mem_lev.hashCode());
		result = prime * result + ((user_name == null) ? 0 : user_name.hashCode());
		result = prime * result + ((user_nick_name == null) ? 0 : user_nick_name.hashCode());
		result = prime * result + user_resi_num;
		result = prime * result + ((user_tel == null) ? 0 : user_tel.hashCode());
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
		LoginVo other = (LoginVo) obj;
		if (create_date == null) {
			if (other.create_date != null)
				return false;
		} else if (!create_date.equals(other.create_date))
			return false;
		if (modi_date == null) {
			if (other.modi_date != null)
				return false;
		} else if (!modi_date.equals(other.modi_date))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (sns_conn_date == null) {
			if (other.sns_conn_date != null)
				return false;
		} else if (!sns_conn_date.equals(other.sns_conn_date))
			return false;
		if (sns_id == null) {
			if (other.sns_id != null)
				return false;
		} else if (!sns_id.equals(other.sns_id))
			return false;
		if (sns_type == null) {
			if (other.sns_type != null)
				return false;
		} else if (!sns_type.equals(other.sns_type))
			return false;
		if (user_birth == null) {
			if (other.user_birth != null)
				return false;
		} else if (!user_birth.equals(other.user_birth))
			return false;
		if (user_email == null) {
			if (other.user_email != null)
				return false;
		} else if (!user_email.equals(other.user_email))
			return false;
		if (user_id == null) {
			if (other.user_id != null)
				return false;
		} else if (!user_id.equals(other.user_id))
			return false;
		if (user_mem_lev == null) {
			if (other.user_mem_lev != null)
				return false;
		} else if (!user_mem_lev.equals(other.user_mem_lev))
			return false;
		if (user_name == null) {
			if (other.user_name != null)
				return false;
		} else if (!user_name.equals(other.user_name))
			return false;
		if (user_nick_name == null) {
			if (other.user_nick_name != null)
				return false;
		} else if (!user_nick_name.equals(other.user_nick_name))
			return false;
		if (user_resi_num != other.user_resi_num)
			return false;
		if (user_tel == null) {
			if (other.user_tel != null)
				return false;
		} else if (!user_tel.equals(other.user_tel))
			return false;
		return true;
	}
	
}
