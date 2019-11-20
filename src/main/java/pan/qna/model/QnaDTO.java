package pan.qna.model;

import java.util.Date;

public class QnaDTO {

	private int cidx;
	private String writer;
	private String id;
	private String title;
	private String content;
	private Date writedate;
	private int status;
	
	public QnaDTO() {
		super();
	}

	public QnaDTO(int cidx, String writer, String id, String title, String content, Date writedate, int status) {
		super();
		this.cidx = cidx;
		this.writer = writer;
		this.id = id;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.status = status;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
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

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

}
	