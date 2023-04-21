package DAO;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.BoardDTO;
import common.JDBConnPool;

public class BoardDAO extends JDBConnPool {

	// 페이지별 게시물 읽어오기
	public List<BoardDTO> getListPage(Map<String, Object> map) {
		List<BoardDTO> bl = new Vector<>();
		String sql = "select * from (" + "select rownum pnum, s.* from(" + "select b.* from testboard b";
		if (map.get("searchStr") != null) {
			sql += " where " + map.get("searchType") + " like '%" + map.get("searchStr") + "%'";
		}
		sql += " order by b_id desc" + ") s" + ")" + " where pnum between ? and ?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setB_id(rs.getInt("b_id"));
				dto.setWriter_id(rs.getString("write_id"));
				dto.setTitle(rs.getString("title"));
				dto.setNoticeFlag(rs.getString("noticeFlag"));
				dto.setContent(rs.getString("Content"));
				dto.setBoardDate(rs.getDate("BoardDate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
//				dto.setDowncount(rs.getInt("downcount"));
//				dto.setVisitcount(rs.getInt("visitcount"));
//				dto.setPostdate(rs.getDate("postdate"));

				bl.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물을 읽는 중 에러");
		}
		return bl;
	}

	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> b = new Vector<BoardDTO>();
		String query = " " + "SELECT * FROM ( " + "   SELECT Tb.*, ROWNum rNum FROM( " + " SELECT * FROM TESTBOARD ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
			query += "  ORDER BY id DESC " + "      )Tb " + " ) " + " WHERE rb_id BETWEEN ? AND ? AND  noticeFlag = "
					+ map.get("noticeFlag");
		}
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setB_id(rs.getInt(1));
				dto.setWriter_id(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setNoticeFlag(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setBoardDate(rs.getDate(6));
				dto.setOfile(rs.getString(7));
				dto.setNfile(rs.getString(8));
//				dto.setVisit_count(8);
				b.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return b;
	}

	// 글 추가
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String sql = "INSERT INTO TESTBOARD(B_ID, WRITE_ID, TITLE, NOTICEFLAG, CONTENT, BOARDDATE, OFILE, NFILE)"
				+ "VALUES(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getB_id());
			psmt.setString(2, dto.getWriter_id());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getNoticeFlag());
			psmt.setString(5, dto.getContent());
			psmt.setDate(6, dto.getBoardDate());
			psmt.setString(7, dto.getOfile());
			psmt.setString(8, dto.getNfile());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	public void updateVisitCount(String b_id) {
		String sql = "update testboard set visitcount=visitcount+1" + "where b_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, b_id);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("조회수 증가 에러");
			e.printStackTrace();
		}
	}

	public BoardDTO getView(String b_id) {
		BoardDTO dto = new BoardDTO();
		String query = "select * from testboard where b_id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, b_id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setB_id(rs.getInt("b_id"));
				dto.setWriter_id(rs.getString("write_id"));
				dto.setTitle(rs.getString("title"));
				dto.setNoticeFlag(rs.getString("noticeFlag"));
				dto.setContent(rs.getString("Content"));
				dto.setBoardDate(rs.getDate("BoardDate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
//				dto.setDowncount(rs.getInt("downcount"));
//				dto.setVisit_count(rs.getInt("visit_count"));

			}
		} catch (Exception e) {
			System.out.println("상세보기 중 예외");
		}
		return dto;
	}

	// testboard table 검색 조건까지 고려하여 결과 전체 개수 세기
	public int countAll(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM testboard";
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

	public int updatePost(BoardDTO dto) {
		int result = 0;
		try {
			String sql = "update testboard set write_id=?, title=?, noticeFlag=?, content=?, BoardDate=?, ofile=?, nfile=? where b_id=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, dto.getB_id());
			psmt.setString(2, dto.getWriter_id());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getNoticeFlag());
			psmt.setString(5, dto.getContent());
			psmt.setDate(6, dto.getBoardDate());
			psmt.setString(7, dto.getOfile());
			psmt.setString(8, dto.getNfile());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 에러");
			e.printStackTrace();
		}
		return result;
	}

	public void updateDowncount(String b_id) {
		String sql = "update testboard set downcount=downcount+1 where b_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, b_id);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("다운로드수 증가 에러");
			e.printStackTrace();
		}
	}

	public int getDowncount(String b_id) {
		int dcount = 0;
		String sql = "select downcount from testboard where b_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, b_id);
			rs = psmt.executeQuery();
			rs.next();
			dcount = rs.getInt(1);

		} catch (Exception e) {
			System.out.println("다운로드 수 읽기 중 에러");
			e.printStackTrace();
		}
		return dcount;
	}
}
