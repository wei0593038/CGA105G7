<%@page import="com.tripMember.model.TripMemberVO"%>
<%@page import="com.tripMember.model.TripMemberService"%>
<%@page import="com.mysql.cj.protocol.a.NativeConstants.StringLengthDataType"%>
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
// 先接userId UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");
	Integer userId =  (Integer)session.getAttribute("userId");
	
	Integer tripId = null;
	if(request.getParameter("TRIP_ID") != null){
		tripId =  Integer.valueOf(request.getParameter("TRIP_ID"));		
	}else{
		tripId = (Integer)session.getAttribute("tripId");
	}
	System.out.println("使用者 " + userId + " 來到 " + tripId + " 旅遊行程!!");
	session.setAttribute("tripId", tripId);
	
//搜尋tripMember 該user是不是在trip內的成員
	TripMemberService tripMemSvc = new TripMemberService();
	TripMemberVO tripMbrVO = tripMemSvc.checkUserInTrip(tripId, userId);
	if(tripMbrVO == null){
		request.getRequestDispatcher("https://tw.yahoo.com/?p=us").forward(request, response);
	}
	
// tripId search tripVO
	TripService tripSvc = new TripService();
	TripVO tripVO = tripSvc.getOneTrip(tripId);
	pageContext.setAttribute("tripVO", tripVO);
	
	
// get location info
	LocationVO locVO = (LocationVO)request.getAttribute("locVO");

// get location Pic
	if(locVO != null){
		LocationPicService locPicSvc = new LocationPicService();
		List<LocationPicVO> locPicList = locPicSvc.getLocPic(locVO.getLocId());
		pageContext.setAttribute("locPicList", locPicList);		
		}

// get trip member
	TripMemberService tripMbrSvc = new TripMemberService();
	List<TripMemberVO> tripMbr = tripMbrSvc.getTripMbr(tripVO.getTripId());
	pageContext.setAttribute("tripMbr", tripMbr);
	int inTripCount = 0, invite = 0;//已在旅遊中，邀請中人數
	for(TripMemberVO member : tripMbr){
		if(member.getIsMbr() == true){
			inTripCount++;
		}else{
			invite++;
		}
	}
               
%>

  <%@ include file="../headAndFoot/header.jsp" %>
    <title>7 Tour | 行程規劃 | TripPlan</title>
    

  <div class="container-fluid">
    <div class="row">
      <!-- right start -->
      <div class="col-3 overflow-auto scroll-style" id="rightContent" style="height: calc(100vh - 66px);">
        <div class="row align-items-center p-0" style="background-color: rgba(38, 112, 180, 0.2); height: 10%;">
          <div class="col-2">
            <button class="btn"><i class="bi bi-arrow-left"></i></button>
          </div>
          <div class="col-7 d-flex">
            <input type="text" class="m-0 text-truncate" value="${tripVO.tripName}" id="upDateTripName" style="background-color: rgba(0,0,0,0);border: none;" maxlength="15">
            <c:if test="${tripVO.coverPic != null}">
            <input type="hidden" id="updateTNPic" value="${Base64.getEncoder().encodeToString(tripVO.coverPic)}">
            </c:if>
            <input type="hidden" id="updateTNNote" value="${tripVO.note}">
            <button class="trip-btn btn" title="確定修改" onclick="updateTripName()"><i class="bi bi-pencil-square"></i></button>
          </div>
          <div class="col-3 p-0">
            <button class="btn trip-btn w-100 p-0 py-3" id="custom-Loc">自訂景點</button>
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
            <form action="tripPlan.do" method="post" class="trip-time fw-bold input-group align-items-center" enctype="multipart/form-data">
              	<input class="form-control trip-in" type="text" id="updateStartDate" value="${tripVO.startDate}" name="startDate" onkeypress="$(this).val('')">
              	<span><i class="bi bi-arrow-right-circle-fill fa-2x cblue"></i></span>
              	<input class="form-control trip-in" type="text" id="updateEndDate" value="${tripVO.endDate}" name="endDate" onkeypress="$(this).val('')">
              	<button class="btn btn-primary py-1" type="button" title="送出" onclick="changeTripDate(this)"><i class="bi bi-check-circle-fill"></i></button>
              	<input type="hidden" name="action" value="update">
              	<input type="hidden" name="tripId" value="${tripVO.tripId}">
              	<input type="hidden" name="tripName" value="${tripVO.tripName}">
              	<input type="hidden" name="coverPic" value="${Base64.getEncoder().encodeToString(tripVO.coverPic)}">
              	<input type="hidden" name="note" value="${tripVO.note}">
            </form>
          </div>
        </div>

        <div class="row overflow-hidden flex-nowrap" id="scroll-content">
          <button id="dateLeft"><i class="bi bi-arrow-left"></i></button>
          
          <%int count = 0;
            for (Date totalDate = tripVO.getStartDate(); !totalDate.equals(tripVO.getEndDate());){
              Calendar cal = Calendar.getInstance();
              cal.setTime(totalDate);
              if(count != 0){
              cal.add(Calendar.DATE,1);            	  
              }
              totalDate = new Date(cal.getTime().getTime());
              count++;
           %>
           <div class="p-0 position-relative Date-form" style="width: 75px;">
           <div class="d-block">
           	<button class="date-btn getTrip_TripDetail" type="button" id="tripDate-<%=count%>" onclick="focusDate(this);getTripDetailAjax('<%=totalDate%>')"><%=new SimpleDateFormat("MM/dd").format(totalDate)%></button>
           </div>
           <form action="tripDetail.do" method="post">
            <button type="button" class="p-0 delete-tripDate" title="刪除當天行程" onclick="deleteDateLoc(this)"><i class="bi bi-trash3-fill"></i></button>
            <input type="hidden" name="action" value="delete_Date">
            <input type="hidden" name="TRIP_ID" value="${tripVO.tripId}">
            <input type="hidden" name="DATE" value="<%=totalDate%>">
           </form>
           </div>
          <%}%>
          
          <button id="dateRight"><i class="bi bi-arrow-right"></i></button>
        </div>
		<div class="row my-2" id="tripLocArea">
		</div>
      </div>
      <!-- right end -->

      <!-- loc info start -->
      <%@ include file="getOne_LocInfo.jsp" %>
      <!-- loc info start -->

      <div class="col-3 locInfo-title" id="mem-notes">
        <div class="row">
          <ul class="nav nav-pills p-0" role="tablist">
            <li class="nav-item col-5" role="presentation">
              <button class="btn trip-btn w-100 active" id="mbr-btn" data-bs-toggle="pill" data-bs-target="#mbr"
                type="button" role="tab" aria-controls="mbr" aria-selected="true">
                <i class="bi bi-people-fill fa-2x"></i>
                <p class="m-0 d-inline">成員(<%=inTripCount%>)</p>
              </button>
            </li>
            <li class="nav-item col-5" role="presentation">
              <button class="btn trip-btn w-100" id="note-btn" data-bs-toggle="pill" data-bs-target="#notes"
                type="button" role="tab" aria-controls="notes" aria-selected="false">
                <i class="bi bi-stickies-fill fa-2x"></i>
                <p class="m-0 d-inline">筆記</p>
              </button>
            </li>
            
            <li class="nav-item col-2" role="presentation">
              <button class="btn trip-btn w-100 d-block h-100" id="close-mbr" onclick="$('#mem-notes').css('display', 'none')">
                <i class="bi bi-x-lg"></i>
              </button>
            </li>
            
          </ul>

          <!-- trip member start -->
          <div class="tab-content h-100 overflow-auto p-0">
            <div class="tab-pane fade show active p-3 overflow-auto" id="mbr" role="tabpanel" aria-labelledby="mbr-tab"
              style="height: calc(100vh - 66px - 65px);">
              <div class="row align-items-center">
                  <input class="col-9 newLoc-input" type="text" name="USER_ACCOUNT" id="addUserAccount" placeholder="請輸入好友帳號" required><!-- 先放userID -->
                  <button class="col-2 btn trip-btn py-0 px-1" type="button" onclick="addUserToTrip()">
                  	<i class="bi bi-person-plus-fill fa-2x"></i>
                  </button>
              </div>
              <div class="row">
                <h5 class="col-12 fw-bold">群組成員(<%=inTripCount%>)</h5>
              <c:forEach var="tripMbrVO" items="${tripMbr}">
              	<c:if test="${tripMbrVO.isMbr == true }">
                  <div class="col-12 my-2">
<!--                   	<img src="xx" alt="" class="mbr-pic"> -->
                  	<h5 class="d-inline align-middle">成員名稱</h5>
                  </div>
                </c:if>
              </c:forEach>
              </div>
              <div class="row">
                <h5 class="col-12 fw-bold mt-2 mb-0" id="invitingUser">邀請中(<%=invite%>)</h5>
              <c:forEach var="tripMbrVO" items="${tripMbr}">
              	<c:if test="${tripMbrVO.isMbr == false }">
                  <div class="col-12 my-2">
<!--                   	<img src="xx" alt="" class="mbr-pic"> -->
                  	<h5 class="d-inline align-middle">成員名稱</h5>
                  </div>
                </c:if>
              </c:forEach>
              </div>
            </div>
            <!-- trip member end -->

            <!-- trip notes start -->
            <div class="tab-pane fade" id="notes" role="tabpanel" aria-labelledby="notes-tab">
              <div class="row">
                <div class="col m-2">
                    <textarea name="note" id="note-input" placeholder="旅程中，有些物品必定要帶的。可以寫在這邊，來提醒旅遊成員喔~">${tripVO.note}</textarea>
                    <input type="hidden" name="tripName" id="note-tripName" value="${tripVO.tripName }">
                    <input type="hidden" name="coverPic" id="note-coverPic" value="${Base64.getEncoder().encodeToString(tripVO.coverPic)}">
                    <button type="button" class="btn trip-btn col-12 border-dark" onclick="updateTripNote()">儲存</button>
                </div>
              </div>
            </div>
          </div>
          <!-- trip notes end -->
        </div>
      </div>
      
<!--  search rusult start  -->
	<c:if test="${searchWord != null}">
      <div class="col-3 overflow-auto" id="search-content">
        <div class="d-flex p-2">
          <h3>搜尋結果 : </h3>
          <button class="ms-auto btn trip-btn" id="close-search"><i class="bi bi-x-lg"></i></button>
        </div>
        <c:forEach var="locVO" items="${searchList}">
          <div class="d-flex align-items-center bg-cblue my-2 custom-loc p-2" onclick="getOneLocAjax(${locVO.locId});focusToMap(${locVO.latitude},${locVO.longitude},'${locVO.locName}')">
            <div class="col-3" style="height: 50px">
            <c:if test="${LocationPicService().getLocPic(locVO.locId).size() != 0}">
              <img src="data:image/png;base64,${Base64.getEncoder().encodeToString(LocationPicService().getLocPic(locVO.locId).get(0).getLocPic())}" class="w-100 h-100">
            </c:if>
            <c:if test="${LocationPicService().getLocPic(locVO.locId).size() == 0}">
            	<p class="text-center m-0 h-100 text-white bg-secondary" style="line-height: 50px">查無圖片</p>
            </c:if>
            </div>
            <div class="col-8 px-2">
              <p class="m-1 text-truncate">${locVO.locName}</p>
              <p class="m-1 text-truncate">${locVO.locAddress }</p>
            </div>
          </div>
        </c:forEach>
        <c:if test="${searchList.isEmpty()}">
        	<h5>搜尋項目 : <font color="red">${searchWord}</font></h5>
			<h5>查無資料</h5>
        </c:if> 
      </div>
      <script>$('#search-content').css('display','block')</script>
     </c:if>
<!--  search rusult end  -->
      
      <!-- mbr group msg start -->
      <div class="col-3 p-0 overflow-hidden" id="mbr-chat">
        <div class="d-flex" style="background-color: rgba(38, 112, 180, 0.6);">
          <h5 class="ps-2 col-6 text-truncate text-start fw-bold m-0 align-middle py-2">聊天室(<%=inTripCount%>)</h5>
          <button class="col-2 btn trip-btn" id="notes-btn"><i class="bi bi-stickies-fill"></i></button>
          <button class="col-2 btn trip-btn" id="mbrs-btn"><i class="bi bi-gear-fill"></i></button>
          <button class="col-2 btn trip-btn" id="close-msg"><i class="bi bi-dash"></i></button>
        </div>
        <hr class="m-0">

        <div id="msg-content">
          
          
        </div>

        <div class="p-2 ps-4 border-top border-dark" style="background-color: aliceblue;">
            <input type="text" id="msg-input" onkeydown="if (event.keyCode == 13) sendMsg(<%=userId%>);">
            <button type="button" class="btn trip-btn" onclick="sendMsg(<%=userId%>)"><i class="bi bi-send-fill"></i></button>
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


  <script>
  	const userId = <%=userId%>;
  	const tripId = <%=tripId%>;
  	const startDate = '<%=tripVO.getStartDate()%>';
  	const endDate = '<%=tripVO.getEndDate()%>';
  	const path ='<%=request.getContextPath()%>';
  </script>
  <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js" integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
  <script src="<%=request.getContextPath() %>/front-end/LeafletMarkers/js/leaflet.extra-markers.min.js"></script>
  <script src="<%=request.getContextPath() %>/front-end/js/map.js"></script>
  <script src="<%=request.getContextPath() %>/front-end/js/websocket.js"></script>
  
<%@ include file="../headAndFoot/footer.jsp" %>
