<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Hello Teams</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="../index.jsp">Hello Teams</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<h2 id="clock" style="color: white;">hh:mm:ss ampm</h2>
		<button type="menu"
			style="background-color: transparent; color: white; border: 0; outline: 0; margin: auto; font: bolder; font-size: x-large;"
			onclick="#">Project Name</button>

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
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">홈</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon" href="index.jsp">
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
								<a class="nav-link" href="SectionPage.html">프로젝트 섹션</a> <a
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
									aria-controls="pagesCollapseAuth">게시판
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="HelloTeams/board/notice.do">공지 게시판</a> <a
											class="nav-link" href="HelloTeams/board/list.do">자유 게시판</a> <a
											class="nav-link" href="HelloTeams/board/write.do">게시물 작성</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError">쪽지
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
						<div class="sb-sidenav-menu-heading">설정</div>
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
					<h1 class="mt-4">Main Page</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-tasks me-1"></i> 나의 할일
								</div>
								<div class="card-body" style="overflow-y: scroll;">
									<c:choose>
										<c:when test="${sectionList.size()==0}">
											<li>프로젝트 섹션이 나누어지지 않았습니다.</li>
										</c:when>
										<c:otherwise>
											<c:forEach items="${sectionList}" var="list" varStatus="stat">
												<li>
													<button class="btn_show_hide" type="button"
														name="${list.section_id}" value="${list.section_id}">${list.section_name}</button>

													<button>
														<i class="fas fa-ellipsis-h"></i>
													</button>
													<button class="btn_keep_sect">보관</button>
													<button class="btn_del_sect" value="${list.section_id}">삭제</button>
												</li>
												<ul style="display: none">
													<c:forEach items="${todoList}" var="tlist" varStatus="stat">
														<c:choose>
															<c:when test="${list.section_id eq tlist.section_Id}">
																<li><input type="checkbox" class="td_check">
																	<span class="td_todo_content">${tlist.todo_Content}</span>
																	<span class="td_todo_part">${tlist.part_Name}</span> <span
																	class="td_todo_date">${tlist.todo_Start_Date}</span> <span
																	class="td_todo_date">${tlist.todo_End_Date}</span> <span
																	class="td_todo_status">${tlist.todo_Status}</span> <span
																	style="display: none">${tlist.todo_info}</span> <span
																	style="display: none">${tlist.todo_Id}</span> <span
																	style="display: none">${tlist.part_Id}</span> <span
																	style="display: none">${list.section_id}</span> <span
																	style="display: none">${list.section_name}</span> <span>
																		<button class="pop_edit_del" type="button">
																			<i class="fas fa-ellipsis-h"></i>
																		</button>
																</span> <span><button class="edit_todo_btn"
																			value="${tlist.part_Name},${tlist.todo_Content}">수정</button></span>
																	<span><button class="btn_del_todo"
																			value="${tlist.todo_Id}">삭제</button></span></li>
															</c:when>
														</c:choose>
													</c:forEach>
												</ul>
											</c:forEach>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<div class="card-header">
									<i class="fas fa-chart-bar me-1"></i> 공지사항
								</div>

								<div class="card-body" style="overflow-y: scroll;">

									<table width="90%" align="center">
										<tr>
											<th class="tableHeader">번호</th>
											<th class="tableHeader">제목</th>
											<th class="tableHeader">작성자</th>
											<th class="tableHeader">내용</th>
											<th class="tableHeader">작성일</th>
											<th class="tableHeader">조회수</th>
											<th class="tableHeader">첨부파일</th>
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
														<td>${list.pnum }</td>
														<td align="center"><a
															href="../board/view.do?b_id=${list.b_id}">${list.title}</a></td>
														<td>${list.writer_id}</td>
														<td>${list.content}</td>
														<td>${list.boardDate}</td>
														<td>${list.visitcount}</td>
														<td><c:if test="${not empty list.ofile}">
																<a
																	href="../board/download.do?ofile=${list.ofile}&nfile=${list.nfile}&b_id=${list.b_id}">[${list.ofile}]</a>
															</c:if></td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-5">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 캘린더
							<div id="calendar"></div>
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
	<style>
.tableHeader {
	background-color: lightgray;
	text-align: center;
	"
}
</style>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	<script src="Board/clock.js"></script>
	<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
</body>
</html>
