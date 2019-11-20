package pan.bbs.model;

import java.sql.*;

public class BbsDTO {

	private int cidx;
	private String category;
	private String writer;
	private String id;
	private String title;
	private String content;
	private String mainimg;
	private String subimg1;
	private String subimg2;
	private String subimg3;
	private Date writedate;
	
	public BbsDTO() {
		super();
	}

	public BbsDTO(int cidx, String category, String writer, String id, String title, String content, String mainimg,
			String subimg1, String subimg2, String subimg3, Date writedate) {
		super();
		this.cidx = cidx;
		this.category = category;
		this.writer = writer;
		this.id = id;
		this.title = title;
		this.content = content;
		this.mainimg = mainimg;
		this.subimg1 = subimg1;
		this.subimg2 = subimg2;
		this.subimg3 = subimg3;
		this.writedate = writedate;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getMainimg() {
		return mainimg;
	}

	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}

	public String getSubimg1() {
		return subimg1;
	}

	public void setSubimg1(String subimg1) {
		this.subimg1 = subimg1;
	}

	public String getSubimg2() {
		return subimg2;
	}

	public void setSubimg2(String subimg2) {
		this.subimg2 = subimg2;
	}

	public String getSubimg3() {
		return subimg3;
	}

	public void setSubimg3(String subimg3) {
		this.subimg3 = subimg3;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

		
	
}
