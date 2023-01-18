<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%@ include file="./header.jsp"%>
	<title>7Tour | 景點管理</title>
	<!-- ---------------------main body區 start--------------------->
	<div class="workplace mt-2">
    <div class="container">
      <div class="row">
        <div class="col p-0">
          <div class="fw-bold text-start fs-3">
            <a href="locManage.jsp"> 景點資訊管理</a>
          </div>
        </div>

        <div class="col p-0  text-end">
          <button type="button" class="btn btn-primary py-1 px-2 mx-3" data-bs-toggle="modal"
            data-bs-target="#add">新增景點</button>
          <form action="loc.do" method="post" class="d-inline">
            <label for="searchLoc">關鍵字搜尋 : </label>
            <input type="text" placeholder="請輸入" id="searchLoc" name="word">
            <button class="btn btn-primary py-1 px-2" type="submit">
              <i class="bi bi-search"></i>
            </button>
            <input type="hidden" name="action" value="search">
          </form>
        </div>
      </div>

			<div class="row">

				<%@ include file="./getAllLoc.jsp"%>

			</div>

			<!-- 			新增 content start -->
			<%@ include file="./addLoc.jsp"%>
			<!-- 新增 content end -->


			<!-- 編輯圖片 content start -->
			<div class="modal fade" id="updatePic" tabindex="-1"
				aria-labelledby="pic" aria-hidden="true">
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

							<form class="mt-2" method="post" action="">
								<input type="checkbox" id="pic1"> <label for="pic1"
									class="align-baseline m-1">圖片1</label> <input type="checkbox"
									id="pic2"> <label for="pic2" class="align-baseline m-1">圖片2</label>

								<input type="checkbox" id="pic3"> <label for="pic3"
									class="align-baseline m-1">圖片3</label>

								<button type="submit" class="btn btn-danger py-1 px-2">刪除圖片
								</button>
							</form>

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
			<!-- 新增 content end -->

		</div>
	</div>
	<!-- ---------------------main body區 end--------------------->
	
	<%@ include file="./footer.jsp"%>
