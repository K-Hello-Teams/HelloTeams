<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Find Password</title>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
      		$(function () {
        		$('#sendMailBtn').click(function () {
          			$.ajax({
            			url: "EmailProcess.jsp",
            			type: "post",                 
            			data: {                       
            				email:$('#email').val()
            			}
          			});
        		});
      		});
    </script>
	<script>
			function showInput() {
  			var input = document.getElementById("myInput");
  			var label = document.getElementById("myLabel");
  			var sendMailBtn = document.getElementById("sendMailBtn");
  			var checkMailBtn = document.getElementById("checkMailBtn");
			
  			input.style.display = "inline";
  			label.style.display = "block";
  			checkMailBtn.style.display="inline";
  			sendMailBtn.style.display="none";
			}
	</script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Search Password</h3></div>
                                    <div class="card-body">
                                        <form action="EmailProcess.jsp" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="email" name="email" type="email" placeholder="Input Email" required="required"/>
                                                <label for="inputEmail">Email</label>
                                                <button class="btn btn-primary" type="button" id="sendMailBtn" onclick="showInput()">인증 메일 보내기</button>                                               
                                            </div>
                                            <div>
                                            	<input type="text" id="myInput" style="display:none;" name="checkEmail">
                                            	<button class="btn btn-primary" id="checkMailBtn" type="button" style="display:none">인증 확인</button>
                                            </div>
                                            <label id="myLabel" style="display:none;">메일을 보냈습니다.</label>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="LoginPage.jsp">Return to login</a>
                                                <button class="btn btn-primary" type="button">Search ID</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="../Login/createMem.do">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>



























