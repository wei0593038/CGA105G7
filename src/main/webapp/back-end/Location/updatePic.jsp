<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.locationPic.model.LocationPicVO"%>

<% List<LocationPicVO> list = (List<LocationPicVO>)request.getAttribute("locPicVO"); %>




<div class="modal fade" id="updatePic">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title fw-bold" id="pic">編輯圖片</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div id="viewPic" class="carousel slide carousel-dark"
					data-bs-interval="false">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#viewPic"
							data-bs-slide-to="0" class="active" aria-current="true"></button>
						<button type="button" data-bs-target="#viewPic"
							data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#viewPic"
							data-bs-slide-to="2"></button>

					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="../images/JavaTime.png" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="../images/JavaTime.png" class="d-block w-100">
						</div>
						<div class="carousel-item">
							<img src="../images/JavaTime.png" class="d-block w-100">
						</div>
						<form class="mt-2" method="post" action="">
							<button type="submit" id="dimg" class="btn btn-danger py-1 px-2">
								<i class="bi bi-trash3-fill"></i>
							</button>
						</form>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#viewPic" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span> <span
							class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#viewPic" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span> <span
							class="visually-hidden">Next</span>
					</button>
				</div>

			</div>

			<div class="input-group p-3">
				<label class="input-group-text" for="addpic">新增圖片</label> <input
					type="file" class="form-control" id="addpic" multiple>
			</div>
			<input type="hidden" name="action" value="updatePic">
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary">送出</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('#updatePic').modal('show');
	});
</script>