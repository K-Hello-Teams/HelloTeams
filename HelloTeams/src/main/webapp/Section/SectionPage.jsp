<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Dashboard - SB Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<!-- CSS -->
<style>
#buttonim:hover {
	background-color: darkgray;
}

#buttonim:active {
	background-color: darkslategray;
}

.test5 {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-contenty {
	background-color: #fefefe;
	margin: 20% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
	text-align: center;
	position: relative;
	transform: translate(-100%);
	transition: transform 0.3s ease-out;
}

.test5	.show {
	display: block;
}

.test5.show .modal-contenty {
	transform: translateY(0);
}


</style>

<body class="sb-nav-fixed">
	<jsp:include page="../toolbar/toolbar_dark.jsp"/>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">프로젝트 섹션</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active"></li>
					</ol>
					<button id="buttonim" onclick="openModal()"
						style="border: 1px solid gray; margin-bottom: 5px; border-radius: 8px;">+
						작업 추가</button>
					<div id="test5" class="test5">
						<div class="modal-contenty">
							<span class="closey" onclick="closeModal()">&times;</span>
							<p>팝업 테스트</p>
						</div>
					</div>
					<div class="card mb-5">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 캘린더
						</div>
						<div class="card-body"></div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>



	<!-- JavaScript -->
	<script>
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/datatables-simple-demo.js"></script>
</body>
</html>
