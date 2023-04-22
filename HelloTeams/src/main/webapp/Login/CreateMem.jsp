<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 확인</h2>
	<form action="../Login/createMem.do" method="get" name="myform">
		<table>
			<tr>
				<td>
					<span class="imp">*</span>
					<label for="">비밀번호</label>
				</td>
				<td>
					<input type="password" name="PW1" id="pwd" onchange="checkpwd_1()"> 
					<span id="checkPW" class="checked"></span>
				</td>
			</tr>
			<tr>
				<td>
					<span class="imp">*</span>
					<label for="">비밀번호 확인</label>
				</td>
				<td>
					<input type="password" name="PW2" id="checkpwd" onchange="checkpwd_1()"> 
					<span id="check" class="checked"></span>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script>
		var pwdd = document.getElementById("pwd");
		var checkpwdd = document.getElementById("checkpwd");
		var PWcheck = document.getElementById("checkPW");
		var okpw = document.getElementById("check");

		function combine(str) {
			var reg1 = /[a-z0-9]/;
			var reg2 = /[a-z]/;
			var reg3 = /[0-9]/;
			return (reg1.test(str) && reg2.test(str) && reg3.test(str));
		}

		function checkpwd_1() {
			var SC = [ "!", "@", "#", "$", "%", "*" ];
			var check_SC = 0;

			for (var i = 0; i < SC.length; i++) {
				if (pwdd.value.indexOf(SC[i]) != -1) {
					check_SC = 1;
				}
			}
			if (pwdd.value) {
				if (pwdd.value.length <= 8 || check_SC == 0 || !combine(pwdd.value)) {
					PWcheck.innerHTML = "<span style='color:red'>영문, 숫자, 특수문자(필수) 조합 8자 이상</span>";
					pwdd.focus();
				} else {
					PWcheck.innerHTML = "<span style='color:orange'>안전한 비밀번호입니다.</span>";
				}
			} else {
				PWcheck.innerHTML = "";
			}
			if (pwdd.value && checkpwdd.value) {
				if (pwdd.value === checkpwdd.value) {
					okpw.innerHTML = "<span style='color:blue'>비밀번호가 일치합니다.</span>";
				} else {
					okpw.innerHTML = "<span style='color:red'>비밀번호가 일치하지 않습니다.</span>";
				}
			} else {
				okpw.innerHTML = "";
			}
		}

	    function sendweb() {
	    	if (!pwdd.value || !okpw.innerHTML) {
	    		alert("비밀번호가 잘못되었습니다.");
	            pwdd.focus();
	          }
	        }
	</script>
</body>
</html>