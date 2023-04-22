package DAO;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnPool;

public class BoardDAO11 extends JDBConnPool {
   
   public int selectCount11(Map<String, Object>map) {
   int totalcount = 0;
   String query="SELECT COUNT(*) FROM Board11";
   if(map.get("searchWord") != null) {
      query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
   
   }
   try {
      stmt = con.createStatement();
      rs = stmt.executeQuery(query);
      rs.next();
      
   }catch(Exception e) {
      System.out.println("게시물 카운트 중 예외 발생");
      e.printStackTrace();
   }
   return totalcount;
}
   public List<BoardDTO11> selectListPage(Map<String, Object>map){
      List<BoardDTO11> b = new Vector<BoardDTO11>();
      String query = " "
            + "SELECT * FROM ( "
            + "   SELECT Tb.*, ROWNUM rNum FROM( "
            + " SELECT * FROM Board ";
         if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
            + " LIKE '%" + map.get("searchWord") + "%' ";
         query += "  ORDER BY id DESC "
            + "      )Tb "
            + " ) "
            + " WHERE rNum BETWEEN ? AND ? ";}
         try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();
            while(rs.next()) {
               BoardDTO11 dto = new BoardDTO11();
               
               dto.setSendId(rs.getString(1));
               dto.setWriter(rs.getString(2));
               dto.setTitle(rs.getString(3));
               dto.setContent(rs.getString(4));
               dto.setOfile(rs.getString(5));
               dto.setNfile(rs.getString(6));
               dto.setBoardDate(rs.getDate(7));
               dto.setSearch(rs.getInt(8));
               dto.setNonum(rs.getInt(9));
               
               b.add(dto);
            }
         }catch(Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
         }
         return b;
      }
   }

   
