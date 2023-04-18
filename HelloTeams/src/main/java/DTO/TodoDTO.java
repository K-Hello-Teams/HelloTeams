package DTO;

import java.sql.Date;

public class TodoDTO {
	private String todoName;
	private int project_Id; // 프로젝트 고유 번호
	private int section_Id; // 프로젝트 별 섹션 고유 번호
	private int todo_num; // 섹션별 고유
	private String todo_Id; // 작성자 ID
	private Date todo_Start_Date;
	private Date todo_End_Date;
	private String todo_Status; //체크하면 상태가 완료됨
	private int todo_Rank;
	
	public String getTodoName() {
		return todoName;
	}
	public void setTodoName(String todoName) {
		this.todoName = todoName;
	}
	public int getProject_Id() {
		return project_Id;
	}
	public void setProject_Id(int project_Id) {
		this.project_Id = project_Id;
	}
	public int getSection_Id() {
		return section_Id;
	}
	public void setSection_Id(int section_Id) {
		this.section_Id = section_Id;
	}
	public int getTodo_Num() {
		return todo_num;
	}
	public void setTodo_Num(int todo_num) {
		this.todo_num = todo_num;
	}
	public String getTodo_Id() {
		return todo_Id;
	}
	public void setTodo_Id(String todo_Id) {
		this.todo_Id = todo_Id;
	}
	public Date getTodo_Start_Date() {
		return todo_Start_Date;
	}
	public void setTodo_Start_Date(Date todo_Start_Date) {
		this.todo_Start_Date = todo_Start_Date;
	}
	public Date getTodo_End_Date() {
		return todo_End_Date;
	}
	public void setTodo_End_Date(Date todo_End_Date) {
		this.todo_End_Date = todo_End_Date;
	}
	public String getTodo_Status() {
		return todo_Status;
	}
	public void setTodo_Status(String todo_Status) {
		this.todo_Status = todo_Status;
	}
	public int getTodo_Rank() {
		return todo_Rank;
	}
	public void setTodo_Rank(int todo_Rank) {
		this.todo_Rank = todo_Rank;
	}
	
}
