$(document).ready(()=>{
	getTripDetailAjax(startDate);
	console.log(startDate);
});


function addTripLoc(){
	$.post(`${path}/front-end/TripPlan/tripDetail.do`,
	{ action : 'addTripLoc',
	  TRIP_ID : tripId,
	  LOC_ID : $('#addTripDetailLocId').val(),
	  arrivalTime : $('#arrivalTime').val(),
	  leaveTime : $('#leaveTime').val()
	},
	function(data){
		console.log("datetime " + data.arrivalTime);
		$('#addtripLocModal').modal('hide');
		updateMap();
		getTripDetailAjax(data.arrivalTime);
	},"json");
}

function getOneLocAjax(locId){
	$.get(`${path}/front-end/TripPlan/tripLoc.do`,
	{  action:'getOneLoc',
	   LOC_ID:locId
	},
	function(data){
		console.log(data);
		console.log(data[1]);
	let bsSlide = '';
	let images = '';//.length() == null? "---":data[0].locPhone
			if(data[1] !== undefined){		
              for(let count = 1, num = 0; count < data.length; count++,num++){
				  bsSlide += `<button type="button" data-bs-target="#loc-pic" id="picControl-${num}" data-bs-slide-to="${num}"></button>`;
				  images += `<div class="carousel-item" id="infoPic-${num}" style="height: 250px;">
				  <img src="data:image/png;base64,${data[count].LocPic}" class="d-block w-100 h-100">
				 </div> `;					  
			  }
			  }else{
				  images +=`<div class="carousel-item" id="infoPic-0" style="height: 250px;">
                  				<p class="text-center bg-secondary h-100 m-0 fs-3 text-white" style="line-height: 250px">查無圖片</p>
                  			</div>`;
			  }
	let htmlStr = `<div id="loc-pic" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  ${bsSlide}
                </div>
                <div class="carousel-inner">
                    ${images}
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#loc-pic" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#loc-pic" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                </button>
              </div>

              <div class="row my-3">
                <p class="col-12 fs-5 text-center text-truncate">${data[0].locName}</p>
                <p class="col-12 m-0 px-5 text-start">Address:</p>
                <p class="col-12 m-0 fs-5 text-center text-truncate">${data[0].locAddress}</p>
                <p class="col-12 m-0 px-5 text-start">Phone:</p>
                <p class="col-12 m-0 fs-5 text-center text-truncate">${data[0].locPhone}</p>
              </div>

              <div class="row justify-content-center">
                <button class="col-8 btn trip-btn fw-bold border-dark" data-bs-toggle="modal"
                  data-bs-target="#addtripLocModal">加入行程</button>
                <div class="modal fade" id="addtripLocModal" tabindex="-1" aria-labelledby="addtripLocModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title fw-bold" id="addtripLocModalLabel">加入行程</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
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
                        <input type="hidden" name="LOC_ID" id="addTripDetailLocId" value="${data[0].locId}">
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                          <button type="button" class="btn btn-primary" onclick="addTripLoc()">確定</button>
                        </div>
                    </div>
                  </div>
                </div>
              </div>`
			  $('#loc-info').css('display','block');
			  $('#locInfo-tab').addClass('active');
			  $('#cusLoc-tab').removeClass('active');
			  $('#locInfo').html(htmlStr);
			  $('#locInfo').addClass('active');
			  $('#locInfo').addClass('show');
			  $('#infoPic-0').addClass('active');
			  $('#picControl-0').addClass('active');
	},"json");	
}


function getTripDetailAjax(date){
	$.get(`${path}/front-end/TripPlan/tripDetail.do`,
	{  
	   action : 'getTrip_TripDetail',
	   TRIP_ID : tripId,
	   DATE : date
	},
	function(data){
		console.log(data);
		let tripLocPic = ``;
		let htmlStr="";
		for(let count = 0; count < data.length; count++){
			if(data[count].locPic != ""){
				tripLocPic = `<img src="data:image/png;base64,${data[count].locPic}" class="w-100 h-100" >`;
			}else{
				tripLocPic =`<p class="text-center m-auto text-white bg-secondary h-100"><i class="bi bi-card-image fa-3x "></i></p>`; 
			}
			htmlStr+=
            `<div class="col-12 d-flex mt-2" style="height:90px">
            <a class="col-10 d-flex align-items-center bg-cblue custom-loc" onclick="getOneLocAjax(${data[count].LocId})">
              <div class="col-4 p-2 h-100" >
                ${tripLocPic}
              </div>
              <div class="col-8 px-2 text-start">
                <p class="m-1">${data[count].ArrivalTime} - ${data[count].LeaveTime}</p>
                <p class="m-1 text-truncate">${data[count].LocName}</p>
              </div>
            </a>
            <button class="col-2 delete-tripLoc" onclick="deletOneLoc(this,${data[count].TripDId})" title="刪除地點"><i class="bi bi-trash3-fill fa-2x"></i></button>
          </div>`;
		}
		$('#tripLocArea').html(htmlStr);
	},"json");
}


function updateMap(){
	$.get(`${path}/front-end/TripPlan/tripLoc.do`,
	{  action: 'ajaxGetLocInfo',
	   startDate:startDate,
	   endDate:endDate,
	   tripId : tripId
	},
	function(data){
	for(let count = 0; count < data.length; count++){
		var tripMarker = L.ExtraMarkers.icon({
			icon:'fa-number',
			markerColor:'cyan',
			shape:'circle',
			prefix:'fa',
			number:count+1
		});
		let lat =data[count].latitude;
		let lng = data[count].longitude;
	L.marker([lat,lng],{icon : tripMarker}).addTo(map).bindPopup(data[count].locName);
	}
	/********* marker的連線 *********/
	if(data.length >= 2){
		for(let first = 0,sec=1; sec < data.length; first ++, sec++){
			let firstLat = data[first].latitude;
			let firstLng = data[first].longitude;
			let secLat = data[sec].latitude;
			let secLng = data[sec].longitude;
			L.polyline([
				[firstLat, firstLng],
				[secLat, secLng],
				],{color:'lightBlue',weight:10,opacity:0.8}).addTo(map)
		}
	}
},"json");
}

function deleteTripLoc(tripDetailId){
	$.post(`${path}/front-end/TripPlan/tripDetail.do`,
	{
		action : 'deleteTripLoc',
		TRIP_DETAIL_ID :tripDetailId
	},function(data){
		updateMap();
		getTripDetailAjax(startDate);
	});
}








