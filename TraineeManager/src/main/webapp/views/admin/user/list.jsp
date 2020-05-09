<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách thực tập sinh</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
<script src="template/paging/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style type="text/css">
.pagination {
	text-align: center;
}
</style>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs ace-save-state" id="breadcrumbs">
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a
						href="admin-home">Trang chủ</a></li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>Chọn</th>
									<th>ID</th>
									<th>Tên</th>
									<th>Ngày sinh</th>
									<th>Số Điện Thoại</th>
									<th>Email</th>
									<th>Địa chỉ</th>
									<th>Ngày tạo</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${user.listResult}">
									<tr>
										<td><input type="checkbox" id="checkbox_${item.id}"
											value="${item.id}"></td>
										<td>${item.id}</td>
										<td>${item.userName}</td>
										<td>${item.DOB}</td>
										<td>${item.phoneNumber}</td>
										<td>${item.email}</td>
										<td>${item.address}</td>
										<td><c:if test="${not empty item.createdDate}">
    										${item.createdDate}
</c:if></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
						<nav aria-label="Page navigation">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.main-content -->
	<script type="text/javascript">
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 6,
				visiblePages : 5,
				startPage : 1,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
	</script>
</body>
</html>