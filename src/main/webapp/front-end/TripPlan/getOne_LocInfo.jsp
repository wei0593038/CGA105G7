<%@page import="com.location.model.LocationService"%>
<%@page import="com.locationPic.model.LocationPicService"%>
<%@page import="com.location.model.LocationVO"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//先接userId UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");
	Integer userID = (Integer)session.getAttribute("userId");
%>
   
     <div class="col-3 locInfo-title" id="loc-info">
        <div class="row">
          <ul class="nav nav-pills p-0" id="pills-tab" role="tablist">
            <li class="nav-item col-5" role="presentation">
              <button class="btn trip-btn w-100 active" id="locInfo-tab" data-bs-toggle="pill" data-bs-target="#locInfo"
                type="button" role="tab" aria-controls="cusLoc" aria-selected="false">
                <i class="bi bi-geo-alt-fill fa-2x"></i>
                <p class="m-0 d-inline">地點</p>
              </button>
            </li>
            <li class="nav-item col-5" role="presentation">
              <button class="btn trip-btn w-100" id="cusLoc-tab" data-bs-toggle="pill" data-bs-target="#cusLoc"
                type="button" role="tab" aria-controls="cusLoc" aria-selected="false">
                <i class="bi bi-pencil-fill fa-2x"></i>
                <p class="m-0 d-inline">自訂地點</p>
              </button>
            </li>
             <li class="nav-item col-2" role="presentation">
              <button class="btn trip-btn w-100 h-100" onclick="closeLocInfo()">
                <i class="bi bi-x-lg"></i>
              </button>
            </li>
          </ul>

          <div class="tab-content h-100 p-0" id="pills-tabContent">
          
          <!-- loc info start -->
            <div class="tab-pane fade" id="locInfo" role="tabpanel" aria-labelledby="locInfo-tab">
            
            </div>
            <!-- loc info end -->

            <!-- custom location start -->
            <div class="tab-pane fade container  overflow-auto" style="height: calc(100vh - 66px - 65px);" id="cusLoc"
              role="tabpanel" aria-labelledby="cusLoc-tab">
              <form action="tripLoc.do" method="post" class="row" enctype="multipart/form-data">
                <h3 class="fw-bold p-0 mt-3">建立新景點</h3>
                <p class="text-danger">* 星號為必填欄位</p>
                <input type="text" class="col-12 newLoc-input" name="loc_name" id="cusLocName" placeholder="*請輸入地點名稱">
                <input type="text" class="col-12 newLoc-input" name="address" id="cusLocAddress" placeholder="*請輸入地址">
                <input type="number" class="col-12 newLoc-input" name="phone" id="cusLocPhone" placeholder="請輸入電話">
                <input type="hidden" name="userId" id="cusLocUserId" value="<%=userID%>">
                <input type="hidden" name="longitude" id="longitude" value="">
                <input type="hidden" name="latitude" id="latitude" value="">
                <input type="hidden" name="locStatus" value="2">
                <input type="hidden" name="action" value="insert">
                <input type="hidden" name="forwardWhere" value="front-end">
                <button class="btn trip-btn mt-3 border-dark" type="button" onclick="codeAddress(this)">建立</button>
              </form>
              <!-- custom location end -->

             <h4 class="fw-bold mt-3 p-0">我的自訂地點</h4>
              <div class="row" id="couLocContainer">
              </div>
            </div>
          </div>
        </div>
      </div>
      
    