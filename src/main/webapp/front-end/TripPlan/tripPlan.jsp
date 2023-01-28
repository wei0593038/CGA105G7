<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String tripId = request.getParameter("TRIP_ID");
%>

  <%@ include file="../headAndFoot/header.jsp" %>
    <title>7 Tour | 行程規劃 | TripPlan</title>
  <!-- content start -->

  <div class="container-fluid">
    <div class="row">

      <!-- right start -->
      <div class="col-3 overflow-auto scroll-style" style="height: calc(100vh - 66px);">
        <div class="row align-items-center p-0" style="background-color: rgba(38, 112, 180, 0.2); height: 10%;">
          <div class="col-2">
            <button class="btn"><i class="bi bi-arrow-left"></i></button>
          </div>
          <div class="col-5">
            <p class="m-0 text-truncate">活動名稱動名稱動名稱</p>
          </div>
          <div class="col-5 p-0">
            <button class="btn trip-btn offset-md-3" id="custom-Loc">自訂景點</button>
            <!-- href="#loc-info" data-bs-toggle="collapse"-->
          </div>
        </div>



        <div class="row">
          <div class="col">
            <img src="./images/Logo.jpg" alt="..." class="w-100 h-100">
            <div class="trip-time fw-bold input-group align-items-center">
              <input class="form-control trip-in" type="text">
              <span><i class="bi bi-arrow-right-circle-fill fa-2x cblue"></i></span>
              <input class="form-control trip-in" type="text">
            </div>
          </div>
        </div>

        <div class="row">
          <button class="col date-btn"><i class="bi bi-arrow-left"></i></button>
          <button class="col date-btn">12/05</button>
          <button class="col date-btn">12/06</button>
          <button class="col date-btn">12/07</button>
          <button class="col date-btn"><i class="bi bi-arrow-right"></i></button>
        </div>

        <div class="row ">
          <p class="col-6 px-2 py-2 m-0">第一天:12/05</p>
          <p class="col-6 px-2 py-2 m-0">出發時間 : 10:00</p>
        </div>

        <div class="row">
          <a href="#loc-info" class="col-12 d-flex align-items-center bg-cblue my-2 custom-loc"
            data-bs-toggle="collapse">
            <div class="col-3">
              <img src="./images/dog.jpeg" alt="..." class="w-100">
            </div>
            <div class="col-8 px-2">
              <p class="m-1">停留時間</p>
              <p class="m-1 text-truncate">地點名稱</p>
            </div>
          </a>

        </div>

      </div>
      <!-- right end -->


      <!-- loc info start -->
      <div class="col-3 locInfo-title collapse" id="loc-info">
        <div class="row">
          <ul class="nav nav-pills p-0" id="pills-tab" role="tablist">
            <li class="nav-item w-50" role="presentation">
              <button class="btn trip-btn w-100 active" id="locInfo-tab" data-bs-toggle="pill" data-bs-target="#locInfo"
                type="button" role="tab" aria-controls="locInfo" aria-selected="true">
                <i class="bi bi-geo-alt-fill fa-2x"></i>
                <p class="m-0 d-inline">地點</p>
              </button>
            </li>
            <li class="nav-item w-50" role="presentation">
              <button class="btn trip-btn w-100" id="cusLoc-tab" data-bs-toggle="pill" data-bs-target="#cusLoc"
                type="button" role="tab" aria-controls="cusLoc" aria-selected="false">
                <i class="bi bi-pencil-fill fa-2x"></i>
                <p class="m-0 d-inline">自訂地點</p>
              </button>
            </li>
          </ul>

          <div class="tab-content h-100 p-0" id="pills-tabContent">
            <div class="tab-pane fade show active" id="locInfo" role="tabpanel" aria-labelledby="locInfo-tab">

              <div id="loc-pic" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#loc-pic" data-bs-slide-to="0" class="active"
                    aria-current="true"></button>
                  <button type="button" data-bs-target="#loc-pic" data-bs-slide-to="1"></button>
                  <button type="button" data-bs-target="#loc-pic" data-bs-slide-to="2"></button>
                  <button type="button" data-bs-target="#loc-pic" data-bs-slide-to="3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active" style="height: 250px;">
                    <img src="./images/dog.jpeg" class="d-block w-100 h-100" alt="...">
                  </div>
                  <div class="carousel-item" style="height: 250px;">
                    <img src="./images/bgremove_Logo.jpg" class="d-block w-100 h-100" alt="...">
                  </div>
                  <div class="carousel-item" style="height: 250px;">
                    <img src="./images/Logo.jpg" class="d-block w-100 h-100" alt="...">
                  </div>
                  <div class="carousel-item" style="height: 250px;">
                    <img src="./images/website.jpg" class="d-block w-100 h-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#loc-pic" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#loc-pic" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
              </div>

              <div class="row my-3">
                <p class="col-12 fs-5 text-center text-truncate">緯育TibaMe附設中壢職訓中心</p>
                <p class="col-12 fs-5 text-center text-truncate">地點地址 : XXXXX地點地址 : XXXXX地點地址 : XXXXX地點地址 : XXXXX地點地址 :
                </p>
                <p class="col-12 fs-5 text-center text-truncate">電話 : XXXXX電話: XXXXX地電話 : XXXXX地電話 : XXXXX電話 : XXXXX</p>
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
                      <form action="" method="post">
                        <div class="modal-body">
                          <div class="text-center m-2">
                            <label for="">預計到達時間 : </label>
                            <input type="text">
                          </div>
                          <div class="text-center m-2">
                            <label for="">預計離開時間 : </label>
                            <input type="text">
                          </div>
                          <div class="text-center m-2">
                            <label for="">預計停留時間 : </label>
                            <input type="text" disabled>
                          </div>

                        </div>
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
            <!-- loc info end -->

            <!-- custom location start -->
            <div class="tab-pane fade container  overflow-auto" style="height: calc(100vh - 66px - 65px);" id="cusLoc"
              role="tabpanel" aria-labelledby="cusLoc-tab">
              <form action="#" method="post" class="row">
                <h3 class="fw-bold p-0 mt-3">建立新景點</h3>
                <p class="text-danger">* 星號為必填欄位</p>
                <input type="text" class="col-12 newLoc-input" placeholder="*請輸入地點名稱">
                <input type="text" class="col-12 newLoc-input" placeholder="*請輸入地址">
                <input type="text" class="col-12 newLoc-input" placeholder="請輸入電話">
                <button class="btn trip-btn mt-3 border-dark">建立</button>
              </form>
              <!-- custom location end -->

              <div class="row">
                <h4 class="fw-bold mt-3 p-0">我的自訂地點</h4>
                <!--customLocation btn start -->
                <button class="custom-loc btn trip-btn col-12 d-flex align-items-center bg-cblue my-2">
                  <div class="col-3">
                    <img src="./images/dog.jpeg" alt="..." class="w-100">
                  </div>
                  <div class="col-8 px-2">
                    <p class="text-start text-truncate m-1">地點名稱</p>
                    <p class="text-start text-truncate m-1">地點地址</p>
                  </div>
                </button>
                <!--customLocation btn end -->
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- content end -->

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
                    <textarea name="" id="note-input" placeholder="旅程中，有些東西必定要帶的。可以寫在這邊，來提醒旅遊成員喔~"></textarea>
                    <button class="btn trip-btn col-12 border-dark">儲存</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- trip notes end -->
        </div>
      </div>
      <!-- mbr group msg start -->
      <div class="col-3 p-2 pt-0" id="mbr-chat">
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
  <a href="#" id="open-join">公開揪團</a>
  <button id="invite" class="btn">邀請好友</button>

  <div id="map"></div>


  <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
    integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM=" crossorigin=""></script>
  <script src="<%=request.getContextPath() %>/front-end/js/tripPlan.js"></script>
  <script src="<%=request.getContextPath() %>/front-end/js/map.js"></script>
  
  
<%@ include file="../headAndFoot/footer.jsp" %>
