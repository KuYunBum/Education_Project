package com.pinosoft.Education.Vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int page=0;//현재 페이지
	private int perPageNum=10;//페이지당 데이터 개수
	private String sabun;
	private String name;
	private String join_gbn_code;
	private String put_yn;
	private String pos_gbn_code;
	private String join_day;
	private String retire_day;
	private String job_type;
	
	private int totalCount;
	private int totalStartPage=1;
	private int totalEndPage;
	private int startPage;//pageMake에서 시작 페이지 번호
	private int endPage;//pageMaker에서 마지막 페이지 번호
	private boolean prev;//이전 페이지 번호 목록 이동
	private boolean next;//다음 페이지 목록 이동
	private int displayPageNum = 10; //pageMaker에서 사용자에게 제공하는 한 화면에서 보여줄 페이지 개수
	
	
	public int getTotalStartPage() {
		return totalStartPage;
	}
	public void setTotalStartPage(int totalStartPage) {
		this.totalStartPage = totalStartPage;
	}
	public int getTotalEndPage() {
		return totalEndPage;
	}
	public void setTotalEndPage(int totalEndPage) {
		this.totalEndPage = totalEndPage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			page=1;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0||perPageNum>100) {
			perPageNum=10;
		}
		this.perPageNum = perPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//전체 개수를 설정한다음 페이징에 필요한 데이터 값을 생성
		//할 수 있다.
		calcData();
	}
	private void calcData() {
		totalStartPage=1;
		totalEndPage=(int)Math.ceil(totalCount/(double)perPageNum);
//		private int endPage;//pageMaker에서 마지막 페이지 번호
	    endPage = (int) (//ceil 올림 floor 내림 round 반올림
	    		Math.ceil(page /(double) displayPageNum)
	    		* displayPageNum);
//	    private int startPage;//pageMake에서 시작 페이지 번호
	    startPage=endPage-displayPageNum+1;
	    if(totalEndPage < endPage) {
	    	endPage=totalEndPage;
	    }
	    
	    if(startPage<1) {
	    	startPage=1;
	    }
	    if(startPage==1) {
	    	prev=false;
	    }else {
	    	prev=true;
	    }
	    if(endPage==totalEndPage) {
	    	next=false;
	    }else {
	    	next=true;
	    }

//		private boolean prev;//이전 페이지 번호 목록 이동
//		private boolean next;//다음 페이지 목록 이동
		
	}
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJoin_gbn_code() {
		return join_gbn_code;
	}
	public void setJoin_gbn_code(String join_gbn_code) {
		this.join_gbn_code = join_gbn_code;
	}
	public String getPut_yn() {
		return put_yn;
	}
	public void setPut_yn(String put_yn) {
		this.put_yn = put_yn;
	}
	public String getPos_gbn_code() {
		return pos_gbn_code;
	}
	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}
	public String getJoin_day() {
		return join_day;
	}
	public void setJoin_day(String join_day) {
		this.join_day = join_day;
	}
	public String getRetire_day() {
		return retire_day;
	}
	public void setRetire_day(String retire_day) {
		this.retire_day = retire_day;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	@Override
	public String toString() {
		return "PageMaker [page=" + page + ", perPageNum=" + perPageNum + ", sabun=" + sabun + ", name=" + name + ", join_gbn_code=" 
				+ join_gbn_code + ", put_yn="+ put_yn + ", pos_gbn_code=" + pos_gbn_code + ", join_day=" + join_day + ", retire_day="
				+ retire_day+ ", job_type=" + job_type + ", totalCount=" + totalCount + ", totalStartPage=" + totalStartPage
				+ ", totalEndPage=" + totalEndPage + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + "]";
	}
	public String makeSearch() {
		UriComponents u=UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.queryParam("sabun", sabun)
				.queryParam("name", name)
				.queryParam("join_gbn_code", join_gbn_code)
				.queryParam("put_yn", put_yn)
				.queryParam("pos_gbn_code", pos_gbn_code)
				.queryParam("join_day", join_day)
				.queryParam("retire_day", retire_day)
				.queryParam("job_type", job_type)
				.build();
		return u.toUriString();		
	}
	
	public String makeSearch(int page) {
		UriComponents u=UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.queryParam("sabun", sabun)
				.queryParam("name", name)
				.queryParam("join_gbn_code", join_gbn_code)
				.queryParam("put_yn", put_yn)
				.queryParam("pos_gbn_code", pos_gbn_code)
				.queryParam("join_day", join_day)
				.queryParam("retire_day", retire_day)
				.queryParam("job_type", job_type)
				.build();
		return u.toUriString();		
	}
	public String makePage(int page) {
		UriComponents u=UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.build();
		return u.toUriString();		
	}

}
