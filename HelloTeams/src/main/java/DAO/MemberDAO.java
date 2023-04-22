package DAO;

import java.util.*;
import common.JDBConnPool;
import DTO.MemberDTO;

public class MemberDAO extends JDBConnPool {
	public MemberDAO() {
		super();
	}
	
	public MemberDTO getMember(String uid, String upw){
		MemberDTO dto = new MemberDTO();
		String query="SELECT * FROM MEM WHERE MEM_ID=? AND MEM_PW=?";
			
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upw);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("MEM_ID"));
				dto.setPw(rs.getString("MEM_PW"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int createMember(MemberDTO dto) {
		int result = 0;
		String sql = "INSERT INTO MEM(MEM_NAME, MEM_ID, MEM_PW, MEM_EMAIL) VALUES(?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPw());
			psmt.setString(4, dto.getEmail());
			result = psmt.executeUpdate();
		} catch(Exception e){
			System.out.println("회원가입 오류");
		}
		
		return result;
	}
	
	public MemberDTO FindId(String name, String email) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT mem_id FROM mem WHERE mem_name LIKE ? AND mem_email LIKE ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("MEM_ID"));
				System.out.println(dto.getId());
			}
			
		} catch(Exception e) {
			System.out.println("아이디 찾기 오류");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public MemberDTO FindPass(String name, String id, String email) {
		MemberDTO dto = new MemberDTO();
		String sql = "select mem_pw from mem where mem_name like ? and mem_id like ? and mem_email like ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, id);
			psmt.setString(3, email);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setPw(rs.getString("MEM_PW"));
			}
			
		} catch(Exception e) {
			System.out.println("비번 찾기 오류");
			e.printStackTrace();
		}
		
		return dto;
	}
}































