<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ include file="../headAndFoot/header.jsp" %>
  <title>7 Tour | 公開揪團 </title>
<%
	String tripName = request.getParameter("TRIP_NAME");
	String startDate =request.getParameter("STARTDATE");
	String endDate = request.getParameter("ENDDATE");
%>
  <!-- content start -->
  <section class="intro">
    <div class="bg-image-vertical" style="margin-bottom: -50px; background-color: #EFD3E4;
            background-image: url(../images/shareGroup.jpg); background-size: cover;">
      <div class="mask d-flex align-items-center h-100">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-12 col-lg-10 w-50">
              <div class="card" style="border-radius: 1rem; background-color: rgba(255,255,255,0.4 );">
                <div class="card-body p-4">
                  <h1 class="mb-4 text-center">公開揪團</h1>
                  <form>

                    <div class="form-outline mb-4">
                      <label class="form-label" for="groupTopic">活動名稱 : </label>
                      <input type="text" id="groupTopic" class="form-control" value="<%=tripName%>" required />
                    </div>

                    <div class="d-flex justify-content-around">
                      <div class="form-outline mb-4">
                        <label class="form-label" for="regStart">報名開始時間 : </label>
                        <input type="text" id="regStart" class="form-control" required />
                      </div>
                      <div class="form-outline mb-4">
                        <label class="form-label" for="regEnd">報名截止日期 : </label>
                        <input type="text" id="regEnd" class="form-control" required />
                      </div>
                    </div>

                    <div class="d-flex justify-content-around">
                      <div class="form-outline mb-4">
                        <label class="form-label" for="tripStart">行程開始時間 : </label>
                        <input type="text" id="tripStart" class="form-control" value="<%=startDate%>" required />
                      </div>

                      <div class="form-outline mb-4">
                        <label class="form-label" for="tripEnd">行程結束日期 : </label>
                        <input type="text" id="tripEnd" class="form-control" value="<%=endDate%>" required />
                      </div>
                    </div>

                    <div class="form-outline mb-4">
                      <label class="form-label" for="numPeo">活動人數 : </label>
                      <input type="number" min="0" id="numPeo" class="form-control" value="0" required />
                    </div>


                    <div class="form-outline mb-4">
                      <label class="form-label" for="actContent">活動內容</label>
                      <textarea class="form-control" style="height: 200px; resize: none;" id="actContent" required></textarea>
                    </div>

                    <!-- Submit button -->
                    <div class="text-end">
                      <a href="#" class="btn btn-secondary">取消</a>
                      <button type="submit" class="btn btn-primary">送出</button>
                    </div>
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- content end -->

    <!-- footer start -->

    <footer class="text-center text-lg-start text-dark bg-cblue mt-5">
      <div class="container p-4 pb-0">
        <div class="row">
          <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="mb-2 font-weight-bold">TibaMe CGA105 JAVA班 第七組</h6>
            <p class="mb-2">組員 : </p>
            <p>
              XXXXXXX
            </p>
          </div>
  
          <hr class="w-100 clearfix d-md-none" />
  
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">聯絡資訊</h6>
            <p><i class="fas fa-envelope mr-3"></i>組長的email</p>
            <p><i class="fas fa-phone mr-3"></i>組長的電話</p>
          </div>
        </div>
  
        <hr class="my-3">
  
        <section class="p-3 pt-0">
          <div class="row d-flex align-items-center">
            <div class="col-md-7 col-lg-8 text-center text-md-start">
              <div class="p-3">© 2020 Copyright</div>
            </div>
  
            <div class="col-md-5 col-lg-4 ml-lg-0 text-center text-md-end">
              <!-- Facebook -->
              <a class="btn btn-outline-light btn-floating m-1" role="button">
                <i class="fab fa-facebook-f"></i></a>
  
              <!-- Google -->
              <a class="btn btn-outline-light btn-floating m-1" role="button">
                <i class="fab fa-google"></i></a>
  
              <!-- Instagram -->
              <a class="btn btn-outline-light btn-floating m-1" role="button">
                <i class="fab fa-instagram"></i></a>
            </div>
          </div>
        </section>
      </div>
    </footer>
    <!-- footer end -->
  <%@ include file="../headAndFoot/footer.jsp" %>




