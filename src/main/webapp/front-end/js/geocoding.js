let geocoder;

function initMap(){
	geocoder =  new google.maps.Geocoder();
}

function codeAddress(e){
	let address = $('#address').val();
	console.log(address);
	geocoder.geocode({
		'address':address
	},function(results,status){
		if(status == google.maps.GeocoderStatus.OK){
			alert("lat=" + results[0].geometry.location.lat() + ",lng=" + results[0].geometry.location.lng());
			$('#longitude').val(results[0].geometry.location.lng());
			$('#latitude').val(results[0].geometry.location.lat());
			e.closest('form').submit();
		}else {
            alert("地址錯誤，請輸入有效地址!" + status);
        }
	});
}