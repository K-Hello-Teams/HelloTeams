package DAO;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import DTO.BoardDTO;
import common.JDBConnPool;
import m2board.MBoardDTO;

public class BoardDAO extends JDBConnPool {

	public int selectCount(Map<String, Object> map) {
		int totalcount = 0;
		String query = "SELECT COUNT(*) FROM Board11";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";

		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();

		} catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalcount;
	}

	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> b = new Vector<BoardDTO>();
		String query = " " + "SELECT * FROM ( " + "   SELECT Tb.*, ROWNUM rNum FROM( " + " SELECT * FROM Board ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
			query += "  ORDER BY id DESC " + "      )Tb " + " ) " + " WHERE rNum BETWEEN ? AND ? ";
		}
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setSendId(rs.getString(1));
				dto.setWriter_id(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setNfile(rs.getString(6));
				dto.setBoardDate(rs.getDate(7));
				dto.setVisit_count(8);
				dto.setNo_Num(rs.getInt(9));

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
		String sql = "INSERT INTO FILEBOARD(IDX, NAME, TITLE, CONTENT, OFILE, NFILE, PASS)"
				+ "VALUES(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getWriter_id());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getNfile());
			psmt.setInt(6, dto.getNo_Num());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	public void updateVisitCount(String no_Num) {
		String sql = "update fileboard set visitcount=visitcount+1" + "where idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, no_Num);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("조회수 증가 에러");
			e.printStackTrace();
		}
	}

	public BoardDTO getView(String no_Num) {
		BoardDTO dto = new BoardDTO();
		String query = "select * from fileboard where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, no_Num);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setNo_Num(rs.getInt("no_Num"));
				dto.setWriter_id(rs.getString("writer_id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("Content"));
				dto.setOfile(rs.getString("ofile"));
				dto.setNfile(rs.getString("nfile"));
//				dto.setDowncount(rs.getInt("downcount"));
				dto.setVisit_count(rs.getInt("visit_count"));
				dto.setBoardDate(rs.getDate("BoardDate"));
			}
		} catch (Exception e) {
			System.out.println("상세보기 중 예외");
		}
		return dto;
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
}
