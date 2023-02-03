<%@page import="com.location.model.LocationService"%>
<%@page import="com.locationPic.model.LocationPicService"%>
<%@page import="com.location.model.LocationVO"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Base64"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//先接userId UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");
	
//先去userId去找出 該user的自訂景點
	Integer userID = (Integer)session.getAttribute("userId");
	LocationService locSvc = new LocationService();
	List<LocationVO> loclist = locSvc.getForUserId(userID);
	pageContext.setAttribute("loclist", loclist);
%>
   
     <div class="col-3 locInfo-title collapse" id="loc-info">
        <div class="row">
          <ul class="nav nav-pills p-0" id="pills-tab" role="tablist">
            <li class="nav-item col-5" role="presentation">
              <button class="btn trip-btn w-100 active" id="locInfo-tab">
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
         <c:if test="${locVO != null}">
            <div class="tab-pane fade show active" id="locInfo" role="tabpanel" aria-labelledby="locInfo-tab">

              <div id="loc-pic" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                <c:forEach var="locPic" items="${locPicList}" varStatus="num">
                  <button type="button" data-bs-target="#loc-pic" id="picControl-${num.index}" data-bs-slide-to="${num.index}"></button>
                </c:forEach>
                </div>
                <div class="carousel-inner">
                
               <c:if test="${locPicList.size() != 0 }">
                <c:forEach var="locPic" items="${locPicList}" varStatus="num">
                  <div class="carousel-item" id="infoPic-${num.index}" style="height: 250px;">
                    <img src="data:image/png;base64,${Base64.getEncoder().encodeToString(locPic.locPic)}" class="d-block w-100 h-100">
                  </div>
                </c:forEach>
               </c:if>
                <c:if test="${locPicList.size() == 0 }">
                  <div class="carousel-item" id="infoPic-0" style="height: 250px;">
                  	<p class="text-center bg-secondary h-100 m-0 fs-3 text-white" style="line-height: 250px">查無圖片</p>
                  </div>
                </c:if>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#loc-pic" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#loc-pic" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
              </div>

              <div class="row my-3">
                <p class="col-12 fs-5 text-center text-truncate">${locVO.locName}</p>
                <p class="col-12 m-0 px-5 text-start">Address:</p>
                <p class="col-12 m-0 fs-5 text-center text-truncate">${locVO.locAddress}</p>
                <p class="col-12 m-0 px-5 text-start">Phone:</p>
                <p class="col-12 m-0 fs-5 text-center text-truncate">${locVO.locPhone.length() == null? "---":locVO.locPhone}</p>
              </div>

              <div class="row justify-content-center">
                <button class="col-8 btn trip-btn fw-bold border-dark" data-bs-toggle="modal"
                  data-bs-target="#exampleModal">加入行程</button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title fw-bold" id="exampleModalLabel">加入行程</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <form action="tripDetail.do" method="post">
                        <div class="modal-body">
                          <div class="text-center m-2">
                            <label for="">預計到達時間 : </label>
                            <input type="text" name="arrivalTime" id="arrivalTime">
                          </div>
                          <div class="text-center m-2">
                            <label for="">預計離開時間 : </label>
                            <input type="text" name="leaveTime" id="leaveTime">
                          </div>
                          <div class="text-center m-2">
                            <label for="">預計停留時間 : </label>
                            <input type="text" disabled>
                          </div>

                        </div>
                        <input type="hidden" name="action" value="addTripLoc">
                        <input type="hidden" name="TRIP_ID" value="${tripVO.tripId}">
                        <input type="hidden" name="LOC_ID" value="${locVO.locId}">
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                          <button type="submit" class="btn btn-primary">確定</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          <script>
      		$(document).ready(function(){
      			$('#loc-info').addClass('show');
      			$('#picControl-0').addClass('active');
      			$('#infoPic-0').addClass('active');
      		});
      	  </script>
      	</c:if>
            <!-- loc info end -->

            <!-- custom location start -->
            <div class="tab-pane fade container  overflow-auto" style="height: calc(100vh - 66px - 65px);" id="cusLoc"
              role="tabpanel" aria-labelledby="cusLoc-tab">
              <form action="tripLoc.do" method="post" class="row" enctype="multipart/form-data">
                <h3 class="fw-bold p-0 mt-3">建立新景點</h3>
                <p class="text-danger">* 星號為必填欄位</p>
                <input type="text" class="col-12 newLoc-input" name="loc_name" placeholder="*請輸入地點名稱">
                <input type="text" class="col-12 newLoc-input" name="address" id="address" placeholder="*請輸入地址">
                <input type="text" class="col-12 newLoc-input" name="phone" placeholder="請輸入電話">
                <input type="hidden" name="userId" value="<%=userID%>">
                <input type="hidden" name="longitude" id="longitude" value="">
                <input type="hidden" name="latitude" id="latitude" value="">
                <input type="hidden" name="locStatus" value="2">
                <input type="hidden" name="action" value="insert">
                <input type="hidden" name="forwardWhere" value="front-end">
                <button class="btn trip-btn mt-3 border-dark" type="button" onclick="codeAddress(this)">建立</button>
              </form>
              <!-- custom location end -->

             <h4 class="fw-bold mt-3 p-0">我的自訂地點</h4>
              <div class="row">
                <!--customLocation btn start -->
                <c:forEach var="locVO" items="${loclist}">
                <a href="tripLoc.do?LOC_ID=${locVO.locId}&TRIP_ID=${tripVO.tripId}&DATE=${tripVO.startDate}&action=getOneLoc" class="custom-loc trip-btn col-10 d-flex align-items-center bg-cblue my-2 p-0">
                  <div class="col-3 text-center">
                    <i class="bi bi-geo-alt-fill fa-2x"></i>
                  </div>
                  <div class="col-7 px-2">
                    <p class="text-start text-truncate m-1">${locVO.locName}</p>
                    <p class="text-start text-truncate m-1">${locVO.locAddress}</p>
                  </div>
                </a>
                <form action="tripLoc.do" method="post" class="col-2 p-0 my-2 text-center">
                  <button type="button" class="h-100 w-100 delete-cusLoc" title="刪除我的地點" onclick=" deleteCusLoc(this)"><i class="bi bi-trash3-fill fa-2x"></i></button>
                  <input type="hidden" name="action" value="deleteUserLoc">
                  <input type="hidden" name="LOC_ID" value="${locVO.locId}">
                </form>
                </c:forEach>
                <!--customLocation btn end -->
              </div>
            </div>
          </div>
        </div>
      </div>
      
    