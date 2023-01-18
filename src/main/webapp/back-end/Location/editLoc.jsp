<%@page import="com.location.model.LocationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
  LocationVO editlocVO = (LocationVO) request.getAttribute("locVO");
%>

<%@ include file="./header.jsp"%>
<title>7 Tour | 編輯景點</title>
 <div class="workplace mt-2">
<div class="container">
	<div class="row">
		<div class="col p-0">
			<div class="fw-bold text-start fs-3">
				<a href="locManage.jsp"> 景點資訊管理</a>
			</div>
		</div>

		<div class="col p-0  text-end">
			<button type="button" class="btn btn-primary py-1 px-2 mx-3"
				data-bs-toggle="modal" data-bs-target="#add">新增景點</button>
			<form action="#" class="d-inline">
				<label for="searchLoc">關鍵字搜尋 : </label> <input type="text"
					placeholder="請輸入" id="searchLoc">
				<button class="btn btn-primary py-1 px-2" type="submit">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
	</div>


	<div class="container w-50 p-4">
		<div class="row">
			<div class="col">
				<h3 class="fw-bold">編輯景點</h3>
			</div>
		</div>


		<form action="loc.do" method="post">
			<div class="row m-3">
				<div class="col text-end p-0">
					<label for="Uloc_name">景點名稱 : </label>
				</div>
				<div class="col">
					<input type="text" name="loc_name" id="Uloc_name" maxlength="15"
						placeholder="必填" value="<%= editlocVO.getLocName() %>" required>
				</div>
				<div class="col text-start p-0">
					<span id="Uloc-error"></span>
				</div>
			</div>


			<div class="row m-3">
				<div class="col text-end p-0">
					<label for="Ulongitude">經度 : </label>
				</div>
				<div class="col">
					<input type="text" name="longitude" id="Ulongitude" maxlength="30"
						placeholder="必填" value="<%= editlocVO.getLongitude() %>" required>
				</div>
				<div class="col text-start p-0">
					<span id="Ulong-error"></span>
				</div>
			</div>

			<div class="row m-3">
				<div class="col text-end p-0">
					<label for="Ulatitude">緯度 : </label>
				</div>
				<div class="col">
					<input type="text" name="latitude" id="Ulatitude" maxlength="30"
						placeholder="必填" value="<%= editlocVO.getLatitude() %>" required>
				</div>
				<div class="col text-start p-0">
					<span id="Ulati-error"></span>
				</div>
			</div>

			<div class="row m-3">
				<div class="col text-end p-0">
					<label for="Uaddress">地址 : </label>
				</div>
				<div class="col">
					<input type="text" name="address" id="Uaddress" maxlength="30"
						placeholder="必填" value="<%= editlocVO.getLocAddress() %>" required>
				</div>
				<div class="col text-start p-0">
					<span id="Uaddress-error"></span>
				</div>
			</div>

			<div class="row m-3">
				<div class="col text-end p-0">
					<label for="Uphone">連絡電話 : </label>
				</div>
				<div class="col">
					<input type="text" name="phone" id="Uphone" maxlength="15" value="<%= editlocVO.getLocPhone() %>">
				</div>
				<div class="col text-start p-0">
					<span id="Uphone-error"></span>
				</div>
			</div>

			<div class="row m-3">
				<div class="col text-end p-0 me-2">
					<div>景點狀態 :</div>
				</div>
				<div class="col-3 text-start p-0">
					<input type="radio" name="state" id="puton" value="0" <%= editlocVO.getLocStatus() == 0? "checked" : "" %>> <label
						for="puton">上架</label>				
				</div>
				<div class="col text-start p-0">
					<input type="radio" name="state" id="putoff" value="1" <%= editlocVO.getLocStatus() == 1? "checked" : "" %>> <label
						for="putoff">下架</label>				
				</div>
			</div>


			<input type="hidden" name="action" value="update">

			<div class="row">
				<div class="col">
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="locId" value="<%=editlocVO.getLocId()%>">
				<input type="hidden" name="userId" value="<%=editlocVO.getUserId()%>">
					<button type="submit" class="btn btn-primary px-5" id="updateSend" disabled>送出修改</button>
				</div>
			</div>


		</form>
	</div>
</div>
</div>

<%@ include file="./footer.jsp"%>
