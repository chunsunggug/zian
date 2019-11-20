package pan.reply.model;

import java.util.Date;

public class ReplyDTO {

	private int ridx;
	private int cidx;
	private int bcdix;
	private String reple;
	private Date writedate;
	private String writer;
	
	public ReplyDTO() {
		super();
	}
	
	public ReplyDTO(int ridx, int cidx, int bcdix, String reple, Date writedate, String writer) {
		super();
		this.ridx = ridx;
		this.cidx = cidx;
		this.bcdix = bcdix;
		this.reple = reple;
		this.writedate = writedate;
		this.writer = writer;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public int getCidx() {
		return cidx;
	}

	public void setCidx(int cidx) {
		this.cidx = cidx;
	}

	public int getBcdix() {
		return bcdix;
	}

	public void setBcdix(int bcdix) {
		this.bcdix = bcdix;
	}

	public String getReple() {
		return reple;
	}

	public void setReple(String reple) {
		this.reple = reple;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}


	
	
}
