package pan.member.model;

import java.sql.*;

public class MemberDTO {

	private int idx;
	private String id;
	private String pwd;
	private String name;
	private int phone;
	private String quiz;
	private String answer;
	private int grade;
	
	
	public MemberDTO() {
		super();
	}


	public MemberDTO(int idx, String id, String pwd, String name, int phone, String quiz, String answer, int grade) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.quiz = quiz;
		this.answer = answer;
		this.grade = grade;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPwd() {
		return pwd;
	}


	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getPhone() {
		return phone;
	}


	public void setPhone(int phone) {
		this.phone = phone;
	}


	public String getQuiz() {
		return quiz;
	}


	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	
	
}
