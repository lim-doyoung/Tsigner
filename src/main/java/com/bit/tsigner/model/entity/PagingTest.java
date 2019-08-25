package com.bit.tsigner.model.entity;

public class PagingTest {

	private int page;
	private int perPageNum;

	public PagingTest() {
		// TODO Auto-generated constructor stub
		this.page=1;
		this.perPageNum=10;
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
		return (this.page-1)*perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount!=cnt) {
		this.perPageNum = cnt;
		}else {
			this.perPageNum = perPageNum;
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + page;
		result = prime * result + perPageNum;
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
		PagingTest other = (PagingTest) obj;
		if (page != other.page)
			return false;
		if (perPageNum != other.perPageNum)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PagingTest [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

	public PagingTest(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}

}
