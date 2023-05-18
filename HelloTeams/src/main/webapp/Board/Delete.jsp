<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="DAO.BoardDAO"%>
<%@ page import="DTO.BoardDTO"%>
<%@ page import="utils.AlertFunc"%>

<%
String b_id = request.getParameter("b_id");
String noticeFlag = request.getParameter("noticeFlag");
System.out.println(noticeFlag);

BoardDAO dao = new BoardDAO();
int res = dao.deletePost(b_id);

dao.close();

if (res == 1) {
	if (noticeFlag.equals("1")) {
		AlertFunc.alertLocation("공지게시물 삭제 완료", "notice.do", out);
	} else {
		AlertFunc.alertLocation("게시물 삭제 완료", "list.do", out);
	}
} else {
	AlertFunc.alertBack("삭제 실패", out);
}
%>
