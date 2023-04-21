package DTO;

import java.sql.Date;

public class BoardDTO {

	private int b_id;
	private int visit_count;
	private String writer_id;
	private String title;
	private String content;
	private String Ofile;
	private String Nfile;
	private String noticeFlag;
	private Date BoardDate;

	public String getNoticeFlag() {
		return noticeFlag;
	}

	public void setNoticeFlag(String noticeFlag) {
		this.noticeFlag = noticeFlag;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public int getVisit_count() {
		return visit_count;
	}

	public void setVisit_count(int visit_count) {
		this.visit_count = visit_count;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getOfile() {
		return Ofile;
	}

	public void setOfile(String ofile) {
		Ofile = ofile;
	}

	public String getNfile() {
		return Nfile;
	}

	public void setNfile(String nfile) {
		Nfile = nfile;
	}

	public Date getBoardDate() {
		return BoardDate;
	}

	public void setBoardDate(Date BoardDate) {
		this.BoardDate = BoardDate;
	}

}
