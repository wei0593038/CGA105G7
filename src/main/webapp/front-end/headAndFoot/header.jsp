<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css"
    integrity="sha384-b6lVK+yci+bfDmaY1u0zE8YYJt0TZxLEAFyYSLHId4xoVvsrQu3INevFKo+Xir8e" crossorigin="anonymous">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/front-end/css/jquery.datetimepicker.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/front-end/css/header.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/front-end/css/userTripAll.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/front-end/css/tripPlan.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/front-end/LeafletMarkers/css/leaflet.extra-markers.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
    integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
<!-- below is tripPlan  -->

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
    integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin="" />
</head>

<body style="overflow: auto">
  <!-- nav start -->
  <nav class="navbar navbar-expand-lg navbar-light bg-cblue sticky-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="./header.html">
        <img src="<%=request.getContextPath() %>/front-end/images/Logo.jpg" id="logo">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item hover-down">
            <a class="nav-link fs-5 fw-bold" href="#">論壇</a>
            <ul class="bg-cblue hover-list">
              <li><a class="hover-item fs-5 fw-bold" href="#">論壇首頁</a></li>
              <li><a class="hover-item fs-5 fw-bold" href="#">文章</a></li>
            </ul>
          </li>
          <li class="nav-item hover-down">
            <a class="nav-link fs-5 fw-bold" href="#">訂房</a>
            <ul class="bg-cblue hover-list">
              <li><a class="hover-item fs-5 fw-bold" href="#">訂房首頁</a></li>
              <li><a class="hover-item fs-5 fw-bold" href="#">我的訂單</a></li>
              <li><a class="hover-item fs-5 fw-bold" href="#">購物車</a></li>
            </ul>
          </li>
          <li class="nav-item hover-down">
            <a class="nav-link fs-5 fw-bold" href="#">揪團</a>
            <ul class="bg-cblue hover-list">
              <li><a class="hover-item fs-5 fw-bold" href="#">揪團首頁</a></li>
              <li><a class="hover-item fs-5 fw-bold" href="#">建立揪團</a></li>
            </ul>
          </li>
        </ul>
        <ul class="navbar-nav mb-2 mb-lg-0">
          <li class="nav-item bg-dblue rounded mx-3 input-group">
            <form action="tripLoc.do" method="post" class="d-flex" id="search-loc">
            </form>
          </li>

          <li class="nav-item user-msg">
            <i class="bi bi-bell-fill fa-2x msg-icon"></i>
            <ul class="bg-cblue msg-list">
              <li class="msg-item">
                <h5>title</h5>
                <p class="text-truncate">
                  訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容訊息內容
                </p>
              </li>
              <hr class="m-1">

              <li class="msg-item">
                <h5>title</h5>
                <p class="text-truncate">訊息內容</p>
              </li>
              <hr class="m-1">

              <li class="msg-item">
                <form action="">
                  <h5>XXX邀請你，共同規畫行程</h5>
                  <button class="btn btn-primary rounded p-1">確認</button>
                  <button class="btn btn-danger rounded p-1">拒絕</button>
                </form>
              </li>
              <hr class="m-1">

              <li class="msg-item">
                <h5>title</h5>
                <p class="text-truncate">訊息內容</p>
              </li>
              <hr class="m-1">
            </ul>
          </li>

          <li class="nav-item mx-3 user-info">
            <img src="<%=request.getContextPath() %>/front-end/images/dog.jpeg" alt="會員照片" class="user-pic">
            <ul class="bg-cblue info-list">
              <li><a href="#" class="d-block info-item">會員基本資料</a></li>
              <li><a href="#" class="d-block info-item">我的行程</a></li>
              <li><a href="#" class="d-block info-item">我的收藏</a></li>
              <li><a href="#" class="d-block info-item">我的訂單</a></li>
              <li><a href="#" class="d-block info-item">登出</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- nav end -->