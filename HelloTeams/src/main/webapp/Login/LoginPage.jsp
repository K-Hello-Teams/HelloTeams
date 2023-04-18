<%@page import="DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
h1{
	text-align: center;
}

table {
	border: 1px solid #444444;
	width:auto;
    margin-left:auto; 
    margin-right:auto;
    margin-bottom:auto;
    margin-top:auto;
}
</style>
</head>
<body>
	<h1>Login</h1>
	<form action="../Login/login.do" method="get">
		<table>
			<tr>
				<td>
					<input placeholder="ID" type="text" name="user_id"/>
				</td>
			</tr>
			<tr>
				<td>
					<input placeholder="PW" type="password" name="user_pw"/>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">Sign-In</button>
					<button type="button" onclick="location.href='../Login/createMem.do';">Sign-Up</button>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="window.open('../Login/FindId.jsp', 'FindId', 'width=400,height=400,top=100,left=100')">아이디를 잊어버리셨나요?</button>
				</td>
			</tr>
			<tr>
				<td>
					<button type="button">비밀번호를 잊어버리셨나요?</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>























