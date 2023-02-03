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
//		L.marker(data[count].latitude,data[count].longitude).addTo(map);
		console.log(data);
//	setMarker(data[count].latitude,data[count].longitude);
	}
	
},"json");	
});

/********* 放置地圖 *********/
var map = L.map('map',{
	center:[24.94811213569772, 121.23244738824268],
	zoom:16
});

L.tileLayer('https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
  attribution: '© OpenStreetMap', // 商用時必須要有版權出處
  zoomControl: true,
}).addTo(map);






