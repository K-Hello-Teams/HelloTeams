<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>자료 게시판</title>
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
a {
	text-decoration: none;
}
</style>
</head>
<body class="sb-nav-fixed">
	<h2>자유 게시판</h2>
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="../index.jsp">Hello Teams</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="검색"
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">홈</div>
						<a class="nav-link" href="index.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div>메인페이지
						</a>
						<div class="sb-sidenav-menu-heading">업무</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 업무 관련
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.jsp">프로젝트 섹션</a> <a
									class="nav-link" href="layout-sidenav-light.jsp">내 작업</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 커뮤니티
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> 게시판
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="Notice.jsp">공지 게시판</a> <a
											class="nav-link" href="List.jsp">게시물 목록</a> <a
											class="nav-link" href="Write.jsp">게시물 작성</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> 쪽지
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.jsp">받은 쪽지함</a> <a
											class="nav-link" href="404.jsp">보낸 쪽지함</a> <a
											class="nav-link" href="500.jsp">쪽지 보관함</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">미정메뉴</div>
						<a class="nav-link" href="charts.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 마이 페이지
						</a> <a class="nav-link" href="tables.jsp">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 관리자 페이지
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Hello Teams
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">자유게시판</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">자유게시판 글 목록</li>
						<li class="breadcrumb-item"><a href="../index.jsp">메인페이지로
								돌아가기</a></li>
					</ol>
				</div>
			</main>
			<!-- 검색 -->
			<form method="get">
				<table border="1" width="90%">
					<tr>
						<td align="center"><select name="searchType">
								<option value="title"
									<c:if test="${map.searchType=='title'}">selected</c:if>>제목
								</option>
								<option value="content"
									<c:if test="${map.searchType=='content'}">selected</c:if>>내용
								</option>
								<option value="writer_id"
									<c:if test="${map.searchType=='writer_id'}">selected</c:if>>작성자
								</option>
						</select> <input type="search" name="searchStr" value="${map.searchStr}" />
							<input type="submit" value="검색" /></td>
					</tr>
				</table>
				<!-- 목록 -->
				<table border="1" width="90%">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>첨부파일</th>
					</tr>
					<c:choose>
						<c:when test="${empty boardList}">
							<tr>
								<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${boardList}" var="list" varStatus="stat">
								<tr align="center">
									<td>${map.totalCount-((map.pageNum-1)*map.pageSize)-stat.b_id}</td>
									<td align="center"><a
										href="../board/view.do?idx=${list.b_id}">${list.title}</a></td>
									<td>${list.writer_id}</td>
									<td>${list.visit_count}</td>
									<td>${list.BoardDate}</td>
									<td><c:if test="${not empty list.ofile}">
											<a href="../board/download.do?ofile=${list.ofile}
					&nfile=${list.nfile}&idx=${list.b_id}">[${list.ofile}]</a>
										</c:if></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</form>
			<!-- 하단 메뉴(페이징 글쓰기) -->
			<table border="1" width="90%">
				<tr align="center">
					<td>${map.pagingStr}</td>
					<td width="100">
						<button type="button" onclick="location.href='../board/write.do';">
							글쓰기</button>
					</td>
				</tr>
			</table>
			</form>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<!-- 						<div> -->
						<!-- 							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms -->
						<!-- 								&amp; Conditions</a> -->
						<!-- 						</div> -->
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>





