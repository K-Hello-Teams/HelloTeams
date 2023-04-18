package DAO;

import java.util.ArrayList;
import java.util.List;

import DTO.TodoDTO;
import common.JDBConnPool;

public class TodoDAO extends JDBConnPool {
	//일반 할일보기 #화면 : 프로젝트 섹션
 	public List<TodoDTO> viewTodo(int pro_id, int section_id){
		List<TodoDTO> li = new ArrayList();
		String sql = "select * from todo where pro_id=? and section_id=?";
		try {
			TodoDTO dto = new TodoDTO();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, pro_id);
			psmt.setInt(2, section_id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setProject_Id(rs.getInt("pro_id"));
				dto.setSection_Id(rs.getInt("section_id"));
				dto.setTodoName(rs.getString("todo_name"));
				dto.setTodo_Num(rs.getInt("host_id"));
				dto.setTodo_Id(rs.getString("todo_id"));
				dto.setTodo_Start_Date(rs.getDate("start_date"));
				dto.setTodo_End_Date(rs.getDate("end_date"));
				dto.setTodo_Status(rs.getString("todo_status"));
				dto.setTodo_Rank(rs.getInt("todo_rank"));
				
				li.add(dto);
			};
			
		}catch(Exception e) {
			System.out.println("할일 불러오던 중 에러");
			e.printStackTrace();
		}
		
		return li;
	}
	//내 할일 #화면 : 내 할일
 	public List<TodoDTO> viewTodo(int pro_id, String todo_id){
		List<TodoDTO> li = new ArrayList();
		String sql = "select * from todo where pro_id=? and todo_id=?";
		try {
			TodoDTO dto = new TodoDTO();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, pro_id);
			psmt.setString(2, todo_id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setProject_Id(rs.getInt("pro_id"));
				dto.setSection_Id(rs.getInt("section_id"));
				dto.setTodoName(rs.getString("todo_name"));
				dto.setTodo_Num(rs.getInt("host_id"));
				dto.setTodo_Id(rs.getString("todo_id"));
				dto.setTodo_Start_Date(rs.getDate("start_date"));
				dto.setTodo_End_Date(rs.getDate("end_date"));
				dto.setTodo_Status(rs.getString("todo_status"));
				dto.setTodo_Rank(rs.getInt("todo_rank"));
				
				li.add(dto);
			};
			
		}catch(Exception e) {
			System.out.println("내 할일 불러오던 중 에러");
			e.printStackTrace();
		}
		
		return li;
	}
 	
	//내 할일 #화면 : 메인페이지
 	public List<TodoDTO> viewTodo(int pro_id, String todo_id, String status){
		List<TodoDTO> li = new ArrayList();
		String sql = "select * from todo where pro_id=? and todo_id=? and status=?";
		try {
			TodoDTO dto = new TodoDTO();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, pro_id);
			psmt.setString(2, todo_id);
			psmt.setString(3, status);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setProject_Id(rs.getInt("pro_id"));
				dto.setSection_Id(rs.getInt("section_id"));
				dto.setTodoName(rs.getString("todo_name"));
				dto.setTodo_Num(rs.getInt("host_id"));
				dto.setTodo_Id(rs.getString("todo_id"));
				dto.setTodo_Start_Date(rs.getDate("start_date"));
				dto.setTodo_End_Date(rs.getDate("end_date"));
				dto.setTodo_Status(rs.getString("todo_status"));
				dto.setTodo_Rank(rs.getInt("todo_rank"));
				
				li.add(dto);
			};
			
		}catch(Exception e) {
			System.out.println("메인화면에서 할일 불러오던 중 에러");
			e.printStackTrace();
		}
		
		return li;
	}
 	//할일 상태 확인
 	
 	//할일 추가
 	public int addTodo(TodoDTO dto) {
		int result = 0;
		String sql = "Insert into todo(pro_id,section_id,todo_name,todo_num,todo_id,start_date,end_date,todo_status,todo_rank)"
				+ "values(?,?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,dto.getProject_Id());
			psmt.setInt(2, dto.getSection_Id());
			psmt.setString(3, dto.getTodoName());
			psmt.setInt(4, dto.getTodo_Num());
			psmt.setString(5, dto.getTodo_Id());
			psmt.setDate(6, dto.getTodo_Start_Date());
			psmt.setDate(7, dto.getTodo_End_Date());
			psmt.setString(8, dto.getTodo_Status());
			psmt.setInt(9, dto.getTodo_Rank());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("할일 추가 중 에러");
			e.printStackTrace();
		}
		
		return result;
	}
 	//할일 삭제
 	public int deleteSection(int project_id,int section_id) {
		int result= 0;
		String sql = "delete from section where pro_id=? and section_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,project_id);
			psmt.setInt(2,section_id);
			result = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("세션 삭제 중 에러");
			e.printStackTrace();
		}
		return result;
	}
}
