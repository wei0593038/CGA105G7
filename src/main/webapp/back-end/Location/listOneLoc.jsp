<%@page import="com.location.model.LocationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%LocationVO locVO = (LocationVO)request.getAttribute("locVO"); %>
	
	
    
    <div class="modal fade" id="update">
        <div class="modal-dialog">

          <form action="" class="modal-content" method="post">
            <div class="modal-header">
              <h5 class="modal-title fw-bold" id="updateLoc">編輯景點</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

              <div class="container">
                <div class="row m-2">
                  <div class="col text-end p-0">
                    <label for="Uloc_name">景點名稱 : </label>
                  </div>
                  <div class="col">
                    <input type="text" name="loc_name" id="Uloc_name" maxlength="15" placeholder="必填" value="${locVO.locName}">
                  </div>
                  <div class="col text-start p-0">
                    <span id="Uloc-error"></span>
                  </div>
                </div>

                <div class="row m-2">
                  <div class="col text-end p-0">
                    <label for="Ulongitude">經度 : </label>
                  </div>
                  <div class="col">
                    <input type="text" name="longitude" id="Ulongitude" maxlength="30" placeholder="必填" value="${locVO.longitude}">
                  </div>
                  <div class="col text-start p-0">
                    <span id="Ulong-error"></span>
                  </div>
                </div>

                <div class="row m-2">
                  <div class="col text-end p-0">
                    <label for="Ulatitude">緯度 : </label>
                  </div>
                  <div class="col">
                    <input type="text" name="latitude" id="Ulatitude" maxlength="30" placeholder="必填" value="${locVO.latitude}">
                  </div>
                  <div class="col text-start p-0">
                    <span id="Ulati-error"></span>
                  </div>
                </div>

                <div class="row m-2">
                  <div class="col text-end p-0">
                    <label for="Uaddress">地址 : </label>
                  </div>
                  <div class="col">
                    <input type="text" name="address" id="Uaddress" maxlength="30" placeholder="必填" value="${locVO.locAddress}">
                  </div>
                  <div class="col text-start p-0">
                    <span id="Uaddress-error"></span>
                  </div>
                </div>

                <div class="row m-2">
                  <div class="col text-end p-0">
                    <label for="Uphone">連絡電話 : </label>
                  </div>
                  <div class="col">
                    <input type="text" name="phone" id="Uphone" maxlength="15" value="${locVO.locPhone}">
                  </div>
                  <div class="col text-start p-0">
                    <span id="Uphone-error"></span>
                  </div>
                </div>

                <div class="row m-2">
                  <div class="col text-center p-0">
                    <div>景點狀態 : </div>
                  </div>
                  <div class="col-3 text-start">
                    <input type="radio" name="state" id="puton" value="上架" checked>
                    <label for="puton">上架</label>
                  </div>
                  <div class="col text-start">
                    <input type="radio" name="state" id="putoff" value="下架">
                    <label for="putoff">下架</label>
                  </div>
                </div>
              </div>

            </div>
            <input type="hidden" name="action" value="update">
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
              <button type="submit" class="btn btn-primary" id="updateSend" disabled>送出</button>
            </div>
          </form>

        </div>
      </div>
 		<script>
      $(document).ready(function(){
    	  $('#update').modal('show');
    	});
      </script>
      