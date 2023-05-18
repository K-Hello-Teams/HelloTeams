<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../toolbar/toolbar_dark.jsp"%>
<meta charset="UTF-8">
<title>게시물 수정하기</title>
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div class="container">
		<h2>게시물 수정하기</h2>
		<form action="../board/edit.do" method="post" name="writeForm"
			enctype="multipart/form-data">
			<input type="hidden" name="b_id" value="${dto.b_id}" /> <input
				type="hidden" name="preOfile" value="${dto.ofile}" /> <input
				type="hidden" name="preNfile" value="${dto.nfile}" />
			<table border="1" width="90%">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer_id" style="width: 150px;"
						value="${dto.writer_id}" /></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" style="width: 100%;"
						value="${dto.title}" /></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content"
							style="width: 100%; height: 200px;">${dto.content}</textarea></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="ofile" /></td>
				</tr>

			</table>
			<div align="center" style='padding-top: 50px;'>
				<button type="button" class="btn btn-info"
					onclick="location.href='../board/list.do';">목록 바로가기</button>
				<button type="reset" class="btn btn-danger">초기화</button>
				<button type="submit" class="btn btn-dark">작성완료</button>

			</div>
		</form>
	</div>
	<style>
th, td {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
}
</style>
</body>
</html>

