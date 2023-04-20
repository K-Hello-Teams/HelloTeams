package m2board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnPool;

public class MBoardDAO extends JDBConnPool {
	public MBoardDAO() {
		super();
	}

	// fileboard table 검색 조건까지 고려하여 결과 전체 개수 세기
	public int countAll(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM FILEBOARD";
		if (map.get("searchStr") != null) {
			sql += " where " + map.get("searchType") + " like '%" + map.get("searchStr") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);

		} catch (Exception e) {
			System.out.println("게시물 카운트 중 에러");
			e.printStackTrace();
		}
		return totalCount;
	}

	// 페이지별 게시물 읽어오기
	public List<MBoardDTO> getListPage(Map<String, Object> map) {
		List<MBoardDTO> bl = new Vector<>();
		String sql = "select * from (" + "select rownum pnum, s.* from(" + "select b.* from fileboard b";
		if (map.get("searchStr") != null) {
			sql += " where " + map.get("searchType") + " like '%" + map.get("searchStr") + "%'";
		}
		sql += " order by idx desc" + ") s" + ")" + " where pnum between ? and ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				MBoardDTO dto = new MBoardDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("Content"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setPass(rs.getString("pass"));
				bl.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물을 읽는 중 에러");
		}
		return bl;
	}

	public int insertWrite(MBoardDTO dto) {
		int result = 0;
		String sql = "INSERT INTO FILEBOARD(IDX, NAME, TITLE, CONTENT, OFILE, NFILE, PASS)"
				+ "VALUES(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	public void updateVisitCount(String idx) {
		String sql = "update fileboard set visitcount=visitcount+1" + "where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("조회수 증가 에러");
			e.printStackTrace();
		}
	}

	public MBoardDTO getView(String idx) {
		MBoardDTO dto = new MBoardDTO();
		String query = "select * from fileboard where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("Content"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setPass(rs.getString("pass"));
			}
		} catch (Exception e) {
			System.out.println("상세보기 중 예외");
		}
		return dto;
	}

	public void updateDowncount(String idx) {
		String sql = "update fileboard set downcount=downcount+1 where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("다운로드수 증가 에러");
			e.printStackTrace();
		}
	}

	public int getDowncount(String idx) {
		int dcount = 0;
		String sql = "select downcount from fileboard where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			rs.next();
			dcount = rs.getInt(1);

		} catch (Exception e) {
			System.out.println("다운로드 수 읽기 중 에러");
			e.printStackTrace();
		}
		return dcount;
	}

	public boolean confirmPassword(String pass, String idx) {
		boolean isRight = false;
		try {
			String sql = "select count(*) from fileboard where pass=? and idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			rs.next();

			if (rs.getInt(1) == 1) {
				isRight = true;
			}

		} catch (Exception e) {
			isRight = false;
			System.out.println("암호 검증 중 에러");
			e.printStackTrace();
		}

		return isRight;
	}

	public int deletePost(String idx) {
		int result = 0;
		try {
			String sql = "delete from fileboard where idx=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 에러");
		}
		return result;
	}
	
	public int updatePost(MBoardDTO dto) {
		int result = 0;
		try {
			String sql = "update fileboard set title=?, name=?, content=?, ofile=?, nfile=? where idx=? and pass=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());			
			psmt.setString(5, dto.getNfile());			
			psmt.setString(6, dto.getIdx());			
			psmt.setString(7, dto.getPass());			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 에러");
			e.printStackTrace();
		}
		return result;
	}
}