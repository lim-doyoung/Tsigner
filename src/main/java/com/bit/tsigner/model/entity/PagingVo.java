package com.bit.tsigner.model.entity;

public class PagingVo {

	private int page;	//���� ������ ��ȣ
	private int perPageNum; //���������� ������ �Խñ��� ����

	public PagingVo() {
		this.page = 1;
		this.perPageNum = 10;
	}

	//Ư�� �������� �Խñ� ���� ��ȣ, �Խñ� ���� �� ��ȣ
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

}
