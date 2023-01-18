<%@page import="com.location.model.LocationVO"%>
<%@page import="com.location.model.LocationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%
LocationService locSvc = new LocationService();
List<LocationVO> list = locSvc.getAll();
pageContext.setAttribute("list", list);
%>

<table class="table">
	<thead>
		<tr>
			<th scope="col">景點名稱</th>
			<th scope="col">地址</th>
			<th scope="col">聯絡電話</th>
			<th scope="col">景點狀態</th>
			<th scope="col">圖片</th>
			<th scope="col">編輯</th>

		</tr>
	</thead>
	<tbody>

		<c:forEach var="locVO" items="${list}">
			<tr class="align-middle">
				<td>${locVO.getLocName()}</td>
				<td>${locVO.getLocAddress()}</td>
				<td>${locVO.getLocPhone() == null? "查無資料" : locVO.getLocPhone()}</td>
				<td>${locVO.getLocStatus() == 0? "上架" : "未上架"}</td>
				<td>
					<form method="post" action="">
						<input type="hidden" name="action" value="getOne_For_Update">
						<input type="hidden" name="LOC_ID" value="${locVO.getLocId()}">


						<button class="btn btn-primary py-1 px-2" data-bs-toggle="modal"
							data-bs-target="#updatePic">預覽編輯圖片</button>
					</form>
				</td>
				<td>
					<form method="post" action="loc.do">
						<input type="hidden" name="action" value="getOne_For_Update">
						<input type="hidden" name="LOC_ID" value="${locVO.getLocId()}">
						<button class="btn btn-primary py-1 px-2" data-bs-toggle="modal"
							data-bs-target="#update">編輯</button>
					</form>
				</td>
			</tr>
		</c:forEach>

	</tbody>
</table>

