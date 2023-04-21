<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 게시판</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
 <link href="../css/styles.css" rel="stylesheet" />
</head>
<body>
	<h2>게시판 상세보기</h2>
	<table border="2" width="90%">
		<colgroup>
			<col width="15%"/><col width="15%"/><col width=15%/>
			<col width="*"/>
		</colgroup>
		<tr>
			<td>글번호</td><td>${dto.b_id}</td>
			<td>작성자</td><td>${dto.write_id}</td>
		</tr>
		<tr>
			<td>작성일</td><td>${dto.BoardDate}</td>
			<td>조회수</td><td>${dto.visit_count}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.title}</td>	
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${dto.content}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${not empty dto.ofile}">
				${dto.ofile}
				<a href="../board/download.do?ofile=${dto.ofile}&nfile=${dto.nfile}&b_id=${dto.b_id}">[다운로드]</a>
				<button type="button" id="downbtn">다운로드</button>
				</c:if>
			</td>
			<td>다운로드수</td>
			<td id="dcount">${dto.downcount}</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
<!-- 				<button type="button" -->
<%-- 				onclick="location.href='../board/pass.do?mode=edit&b_id=${param.b_id }';"> --%>
<!-- 				수정하기</button> -->
				<button type="button"
				onclick="location.href='../board/edit.do?mode=edit&b_id=${param.b_id }';">
				수정하기</button>
				<button type="button"
				onclick="location.href='../board/edit.do?mode=delete&b_id=${param.b_id }';">
				삭제하기</button>
				<button type="button"
				onclick="location.href='../board/list.do';">
				목록 바로가기</button>
			</td>
		</tr>
	</table>
<script src="http://code.jquery.com/jquery-latest.min.js">
	$('#downbtn').on("click", (e)=>{
		e.preventDefault();
		console.log('btn click');
		$.ajax({
			type:'post',
			async:false,
			url:'/HelloTeams/board/download.do',
			dataType:'text',
			data:{b_id:'${dto.b_id}'},
			succes: function(data,textStatus){
				console.log(data);
				$('#dcount').text(data);
			},
			error: function(data,textStatus){
				colsole.log('error',data,textStatus);
			}
		})
	});
</script>

</body>
</html>