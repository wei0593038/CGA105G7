<%@page import="com.location.model.LocationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="modal fade" id="add" tabindex="-1" aria-labelledby="addLoc"
	aria-hidden="true">
	<div class="modal-dialog">

		<form action="loc.do" class="modal-content" method="post" enctype="multipart/form-data">
			<div class="modal-header">
				<h5 class="modal-title fw-bold" id="addLoc">新增景點</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<div class="container">
					<div class="row m-2">
						<div class="col text-end p-0">
							<label for="Aloc_name">景點名稱 : </label>
						</div>
						<div class="col">
							<input type="text" name="loc_name" id="Aloc_name" maxlength="15"
								placeholder="必填" value="" required>
						</div>
						<div class="col text-start p-0">
							<span id="loc-errorMsg"></span>
						</div>
					</div>

					<div class="row m-2">
						<div class="col text-end p-0">
							<label for="Alongitude">經度 : </label>
						</div>
						<div class="col">
							<input type="text" name="longitude" id="Alongitude"
								maxlength="30" placeholder="必填" value="" required>
						</div>
						<div class="col text-start p-0">
							<span id="long-errorMsg"></span>
						</div>
					</div>

					<div class="row m-2">
						<div class="col text-end p-0">
							<label for="Alatitude">緯度 : </label>
						</div>
						<div class="col">
							<input type="text" name="latitude" id="Alatitude" maxlength="30"
								placeholder="必填" value="" required>
						</div>
						<div class="col text-start p-0">
							<span id="alati-errorMsg"></span>
						</div>
					</div>

					<div class="row m-2">
						<div class="col text-end p-0">
							<label for="Aaddress">地址 : </label>
						</div>
						<div class="col">
							<input type="text" name="address" id="Aaddress" maxlength="30"
								placeholder="必填" value="" required>
						</div>
						<div class="col text-start p-0">
							<span id="address-errorMsg"></span>
						</div>
					</div>

					<div class="row m-2">
						<div class="col text-end p-0">
							<label for="Aphone">連絡電話 : </label>
						</div>
						<div class="col">
							<input type="text" name="phone" id="Aphone" maxlength="15">
						</div>
						<div class="col text-start p-0">
							<span id="phone-errorMsg"></span>
						</div>
					</div>

					<div class="input-group p-4 pt-1">
						<label class="input-group-text" for="Apicture">景點圖片 : </label> <input
							type="file" class="form-control" name="picture" id="Apicture"
							accept=".jpg,.png,.jpeg" multiple>
					</div>

				</div>

			</div>
			<input type="hidden" name="action" value="insert">
			<input type="hidden" name="locStatus" value="0">			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">取消</button>
				<button type="submit" class="btn btn-primary" id="send" disabled>送出</button>
			</div>
		</form>

	</div>
</div>