$('#addTripLoc').click(()=>{
	$.post(`${path}/front-end/TripPlan/tripDetail.do`,
	{ action : 'addTripLoc',
	  TRIP_ID : tripId,
	  LOC_ID : $('#addTripDetailLocId').val(),
	  arrivalTime : $('#arrivalTime').val(),
	  leaveTime : $('#leaveTime').val()
	},
	function(data){
		console.log('成功');
		console.log(data);
		$('#addtripLocModal').modal('hide');
		updateMap();
	},"json");
});


function getTripDetailAjax(date){
	$.get(`${path}/front-end/TripPlan/tripDetail.do`,
	{  
	   action : 'getTrip_TripDetail',
	   TRIP_ID : tripId,
	   DATE : date
	},
	function(data){
		console.log(data);
		console.log(data[0].TripD[13]);
		let htmlStr="";
		for(let count = 0; count < data.length; count++){
			htmlStr+=`<div class="row my-2">
            <div class="col-3 h-100">
              <img src="" class="w-100 h-100">
            </div>
            <div class="col-7 px-2 text-start">
              <p class="m-1">${data[count].TripD[3]} - ${data[count].TripD[4]}</p>
              <p class="m-1 text-truncate">${data[count].TripD[6]}</p>
            </div>
            <input type="hidden" name="LOC_ID" value="${data[count].TripD[2]}">
            <input type="hidden" name="TRIP_ID" value="${data[count].TripD[1]}">
            <button type="button" class="col-2 h-100 border-0 delete-tripLoc" title="刪除景點" onclick="deletOneLoc(this)">
            	<i class="bi bi-trash3-fill fa-2x m-auto"></i>
            </button>
            <input type="hidden" name="TRIP_DETAIL_ID" value="${data[count].TripD[0]}">
        </div>`;
		}
		$('#rightContent').append(htmlStr);
		
		
	},"json");
}


function updateMap(){
	$.get(`${path}/front-end/TripPlan/tripLoc.do`,
	{  action: 'ajaxGetLocInfo',
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