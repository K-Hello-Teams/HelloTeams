<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>회원가입</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
  	<h1>Sign-Up</h1>
  		
  	<form action="../Login/createMem.do" method="post">
  		<table>
  			<tr>
  				<td>이름</td>
  			</tr>
  			<tr>
				<td>
					<input placeholder="Name" type="text" name="user_name"/>
				</td>
			</tr>
			<tr>
  				<td>아이디</td>
  			</tr>
  			<tr>
				<td>
					<input placeholder="ID" type="text" name="user_id"/>
				</td>
			</tr>
			<tr>
  				<td>비밀번호</td>
  			</tr>
  			<tr>
				<td>
					<input placeholder="Password" type="password" name="user_pw"/>
				</td>
			</tr>
			<tr>
  				<td>이메일</td>
  			</tr>
  			<tr>
				<td>
					<input placeholder="Email" type="text" name="user_email"/>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">Sign-Up</button>
					<button type="button" onclick="location.href='LoginPage.jsp';">Back</button>
				</td>
			</tr>
  		</table>
  	</form>
  </body>
</html>






































