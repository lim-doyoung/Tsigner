package com.bit.tsigner.model.entity;

public class PlannerVo {
	private String loc_dtl_name,sigungu_code,area_code;
	
	public PlannerVo() {
	}
	
	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}


	public String getLoc_dtl_name() {
		return loc_dtl_name;
	}

	public void setLoc_dtl_name(String loc_dtl_name) {
		this.loc_dtl_name = loc_dtl_name;
	}

	@Override
	public String toString() {
		return "PlannerVo [loc_dtl_name=" + loc_dtl_name + ", sigungu_code=" + sigungu_code + ", area_code=" + area_code
				+ "]";
	}

	public String getSigungu_code() {
		return sigungu_code;
	}

	public void setSigungu_code(String sigungu_code) {
		this.sigungu_code = sigungu_code;
	}
	
}
