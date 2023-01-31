<%@page import="com.location.model.LocationVO"%>
<%@page import="com.location.model.LocationService"%>
<%@page import="com.locationPic.model.LocationPicService"%>
<%@page import="com.locationPic.model.LocationPicVO"%>
<%@page import="java.util.List"%>
<%@page import="com.tripDetail.model.TripDetailService"%>
<%@page import="com.tripDetail.model.TripDetailVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Base64"%>
<%@page import="com.trip.model.TripService"%>
<%@page import="com.trip.model.TripVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//先接userId UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");
	Integer userId = 1;//這邊先將userId寫死
	
// 	String tripId = request.getParameter("TRIP_ID");
	Integer tripId = 2;
	TripService tripSvc = new TripService();
	TripVO tripVO = tripSvc.getOneTrip(tripId);
	pageContext.setAttribute("tripVO", tripVO);
	
// tripDetail take info
	TripDetailService tripDetailSvc = new TripDetailService();
	List<TripDetailVO> list = tripDetailSvc.getTrip_TripDetail(tripId);
	pageContext.setAttribute("list", list);
	
// get location info
	LocationVO locVO = (LocationVO)request.getAttribute("locVO");
//get location Pic
	if(locVO != null){
		LocationPicService locPicSvc = new LocationPicService();
		List<LocationPicVO> locPicList = locPicSvc.getLocPic(locVO.getLocId());
		pageContext.setAttribute("locPicList", locPicList);		
		}
%>

  <%@ include file="../headAndFoot/header.jsp" %>
    <title>7 Tour | 行程規劃 | TripPlan</title>
    

  <div class="container-fluid">
    <div class="row">

      <!-- right start -->
      <div class="col-3 overflow-auto scroll-style" style="height: calc(100vh - 66px);">
        <div class="row align-items-center p-0" style="background-color: rgba(38, 112, 180, 0.2); height: 10%;">
          <div class="col-2">
            <button class="btn"><i class="bi bi-arrow-left"></i></button>
          </div>
          <div class="col-5">
            <p class="m-0 text-truncate">${tripVO.tripName}</p>
          </div>
          <div class="col-5 p-0">
            <button class="btn trip-btn offset-md-3" id="custom-Loc">自訂景點</button>
            <!-- href="#loc-info" data-bs-toggle="collapse"-->
          </div>
        </div>



        <div class="row">
          <div class="col p-0" style="height: 150px">
          <c:if test="${tripVO.coverPic != null}">
            <img src="data:image/png;base64,${Base64.getEncoder().encodeToString(tripVO.coverPic)}" class="w-100 h-100">
          </c:if>
          <c:if test="${tripVO.coverPic == null}">
          	<img style="background-color: gray" title="尚無圖片" class="w-100 h-100">
          </c:if>
            <div class="trip-time fw-bold input-group align-items-center">
              <input class="form-control trip-in" type="text">
              <span><i class="bi bi-arrow-right-circle-fill fa-2x cblue"></i></span>
              <input class="form-control trip-in" type="text">
            </div>
          </div>
        </div>

        <div class="row overflow-hidden flex-nowrap" id="scroll-content">
          <button id="dateLeft"><i class="bi bi-arrow-left"></i></button>
          
          <%int count = 0;
            for (Date date = tripVO.getStartDate(); !date.equals(tripVO.getEndDate());){
              Calendar cal = Calendar.getInstance();
              cal.setTime(date);
              if(count != 0){
              cal.add(Calendar.DATE,1);            	  
              }
              date = new Date(cal.getTime().getTime());
              count++;
           %>
           <form class="p-0 position-relative" style="width: 75px;">
           	<button class="date-btn"><%=new SimpleDateFormat("MM/dd").format(date)%></button>
            <button class="p-0 delete-tripDate" title="刪除當天行程"><i class="bi bi-trash3-fill"></i></button>
           </form>
          <%}%>
          
          <button id="dateRight"><i class="bi bi-arrow-right"></i></button>
        </div>

        <div class="row ">
          <p class="col-6 px-3 py-2 m-0">第一天:${SimpleDateFormat("MM/dd").format(tripVO.startDate)}</p>
        </div>

	<c:forEach var="tripDetail" items="${list}">
        <div class="row my-2">
          <a href="tripLoc.do?LOC_ID=${tripDetail.locId}&action=getOneLoc" class="col-10 d-flex align-items-center bg-cblue custom-loc">
            <div class="col-3">
              <img src="data:image/png;base64,${Base64.getEncoder().encodeToString(LocationPicService().getLocPic(tripDetail.locId).get(0).getLocPic())}" class="w-100">
            </div>
            <div class="col-8 px-2 text-start">
              <p class="m-1">${SimpleDateFormat("HH:mm").format(tripDetail.arrivalTime)} - ${SimpleDateFormat("HH:mm").format(tripDetail.leaveTime)}</p>
              <p class="m-1 text-truncate">${LocationService().getOneLoc(tripDetail.locId).getLocName()}</p>
            </div>
          </a>
            <button class="col-2 delete-tripLoc" title="刪除地點"><i class="bi bi-trash3-fill"></i></button>
        </div>
	</c:forEach>
      </div>
      <!-- right end -->

      <!-- loc info start -->
      <%@ include file="getOne_LocInfo.jsp" %>
      <!-- loc info start -->

      <div class="col-3 locInfo-title" id="mem-notes">
        <div class="row">
          <ul class="nav nav-pills p-0" role="tablist">
            <li class="nav-item w-50" role="presentation">
              <button class="btn trip-btn w-100 active" id="mbr-btn" data-bs-toggle="pill" data-bs-target="#mbr"
                type="button" role="tab" aria-controls="mbr" aria-selected="true">
                <i class="bi bi-people-fill fa-2x"></i>
                <p class="m-0 d-inline">成員(5)</p>
              </button>
            </li>
            <li class="nav-item w-50" role="presentation">
              <button class="btn trip-btn w-100" id="note-btn" data-bs-toggle="pill" data-bs-target="#notes"
                type="button" role="tab" aria-controls="notes" aria-selected="false">
                <i class="bi bi-stickies-fill fa-2x"></i>
                <p class="m-0 d-inline">筆記</p>
              </button>
            </li>
          </ul>

          <!-- trip member start -->
          <div class="tab-content h-100 overflow-auto">
            <div class="tab-pane fade show active p-3 overflow-auto" id="mbr" role="tabpanel" aria-labelledby="mbr-tab"
              style="height: calc(100vh - 66px - 65px);">
              <div class="row">
                <h3 class="col-12 text-center text-truncate">
                  活動名稱活動名稱活動名稱活動名稱活動名稱
                </h3>
              </div>
              <div class="row">
                <form action="" method="post">
                  <input class="col-8 newLoc-input" type="text" placeholder="請輸入好友帳號">
                  <button class="btn trip-btn py-0 px-1" type="submit"><i
                      class="bi bi-person-plus-fill fa-2x"></i></button>
                </form>
              </div>
              <div class="row">
                <h5 class="col-12 fw-bold">群組成員</h5>
                <div class="col-12 my-2">
                  <img src="./images/dog.jpeg" alt="" class="mbr-pic">
                  <h5 class="d-inline align-middle">成員名稱</h5>
                </div>
              </div>

              <div class="row">
                <h5 class="col-12 fw-bold mt-2 mb-0">邀請中(人數)</h5>
                <div class="col-12 my-2">
                  <img src="./images/dog.jpeg" alt="" class="mbr-pic">
                  <h5 class="d-inline align-middle">成員名稱</h5>
                </div>
              </div>
            </div>
            <!-- trip member end -->

            <!-- trip notes start -->
            <div class="tab-pane fade" id="notes" role="tabpanel" aria-labelledby="notes-tab">
              <div class="row">
                <div class="col m-2">
                  <form action="" method="post">
                    <textarea name="" id="note-input" placeholder="旅程中，有些物品必定要帶的。可以寫在這邊，來提醒旅遊成員喔~">${tripVO.note}</textarea>
                    <button class="btn trip-btn col-12 border-dark">儲存</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- trip notes end -->
        </div>
      </div>
      
<!--  search rusult end  -->
      <div class="col-3 overflow-auto" id="search-content">
        <div class="d-flex p-2">
          <h3>搜尋結果 : </h3>
          <button class="ms-auto btn trip-btn" id="close-search"><i class="bi bi-x-lg"></i></button>
        </div>
          <a href="#loc-info" class="d-flex align-items-center bg-cblue my-2 custom-loc p-2"
            data-bs-toggle="collapse">
            <div class="col-3">
              <img src="./images/dog.jpeg" class="w-100">
            </div>
            <div class="col-8 px-2">
              <p class="m-1 text-truncate">地點名稱</p>
              <p class="m-1 text-truncate">地點地址</p>
            </div>
          </a>
      </div>
<!--  search rusult end  -->
      
      <!-- mbr group msg start -->
      <div class="col-3 p-2 pt-0 overflow-hidden" id="mbr-chat">
        <div class="row" style="background-color: rgba(38, 112, 180, 0.6);">
          <h5 class="col-6 text-truncate text-start fw-bold m-0 align-middle py-2">活動名稱(人數)</h5>
          <button class="col-2 btn trip-btn" id="notes-btn"><i class="bi bi-stickies-fill"></i></button>
          <button class="col-2 btn trip-btn" id="mbrs-btn"><i class="bi bi-gear-fill"></i></button>
          <button class="col-2 btn trip-btn" id="close-msg"><i class="bi bi-dash"></i></button>
        </div>
        <hr class="m-0">

        <div class="row" id="msg-content">
          <div class="col-12 m-2">
            <img src="./images/dog.jpeg" class="user-pic d-inline align-top" alt="使用者">
            <p class="trip-msg">
              xxXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
            <p class="d-inline align-bottom" style="font-size: 10px;">下午12:00</p>
          </div>
          <div class="col-12 m-2">
            <img src="./images/dog.jpeg" class="user-pic d-inline align-top" alt="使用者">
            <p class="trip-msg">
              XXXXXXXXXXXXXXXXX</p>
            <p class="d-inline align-bottom" style="font-size: 10px;">下午12:00</p>
          </div>
          <div class="col-12 m-2 text-end">
            <p class="d-inline align-bottom" style="font-size: 10px;">下午12:00</p>
            <p class="trip-msg">
              xxXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
          </div>
        </div>

        <div class="row" style="background-color: aliceblue;">
          <form action="" method="post">
            <input type="text" id="msg-input">
            <button type="submit" class="btn trip-btn"><i class="bi bi-send-fill"></i></button>
          </form>
        </div>
      </div>
      <!-- mbr group msg end -->

    </div>
  </div>
  <!-- mbr group msg icon -->
  <button class="btn" id="mbrMsg-icon"><i class="bi bi-chat-dots-fill fa-4x"></i></button>
  <!-- mbr group msg icon end -->
  <a href="<%=request.getContextPath()%>/front-end/shareGroup/shareGroup.jsp?TRIP_NAME=${tripVO.tripName}&STARTDATE=${tripVO.startDate}&ENDDATE=${tripVO.endDate}" id="open-join" target="_blank">公開揪團</a>
  <button id="invite" class="btn">邀請好友</button>

  <div id="map"></div>


  <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
    integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
  <script src="<%=request.getContextPath() %>/front-end/js/tripPlan.js"></script>
  <script src="<%=request.getContextPath() %>/front-end/js/map.js"></script>
  
  
<%@ include file="../headAndFoot/footer.jsp" %>
