//取消body scroll
$('body').css('overflow','hidden');
//當網頁載入完畢時
$(document).ready(()=>{
	$('#search-loc').html(`
		<input type="search" name="word" class="form-control p-0 border-0 fs-5">
		<input type="hidden" name="action" value="search">
		<input type="hidden" name="forward" value="front-end">
    	<button type="submit" class="btn btn-primary">
      	<i class="fas fa-search"></i>
    	</button>`);	
    	
//search Location
  $.get('http://localhost:8080/CGA105G7/front-end/TripPlan/tripLoc.do?action=ajaxGetLocInfo&tripId='+tripId,{},function(data){
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
				],{color:'blue',weight:10,opacity:0.5}).addTo(map)
		}
	}
	
},"json");	
});

/********* 取得user定位 *********/
let center = [24.958682752351766, 121.22511946454931];
if(navigator.geolocation){
	navigator.geolocation.getCurrentPosition(function(position){
		let lat = position.coords.latitude;
		let lng = position.coords.longitude;
		center = L.latLng(lat,lng);
		this.map.flyTo(center,13);
		L.marker(center,{icon : userMarker}).addTo(map).bindPopup('您的位置').openPopup();
		console.log(center);
	});
}else{
	alert('很抱歉，您的瀏覽器版本，不支援此網頁');
}





/********* 放置地圖 *********/
var map = L.map('map',{
	center:center,
	zoom:10
});

L.tileLayer('https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
  attribution: '© OpenStreetMap', // 商用時必須要有版權出處
  zoomControl: true,
}).addTo(map);

var userMarker = L.ExtraMarkers.icon({
	icon:'fa-igloo',
	markerColor:'yellow',
	shape:'circle',
	prefix:'fa',
});


 	
 





