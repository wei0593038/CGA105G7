
//Websocket
	var MyPoint = "/tripChat.do";
	var host = window.location.host;
	var wsPath = window.location.pathname;
	var webCtx = wsPath.substring(0, wsPath.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var webSocket;
$(function(){
	connect();
});

function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			console.log("Connect Success!");
		};

		webSocket.onmessage = function(msg) {
		var jsonObj = JSON.parse(msg.data);
		let htmlStr = "";
		if(jsonObj.UserId === userId){
		htmlStr = `
		<div class="m-2 text-end d-flex flex-row-reverse">
            <span class="trip-msg">${jsonObj.Msg}</span>
            <p class="fs-6 mb-0 mt-auto">${jsonObj.SendTime[3]}:${jsonObj.SendTime[4]}</p> 
         </div>`;			
		}else{
		htmlStr = `
		<div class="m-2 text-end d-flex">
			<div>${userId}</div>
            <span class="trip-msg">${jsonObj.Msg}</span>
            <p class="fs-6 mb-0 mt-auto">${jsonObj.SendTime[3]}:${jsonObj.SendTime[4]}</p> 
         </div>`;
		}
          
   	$('#msg-content').append(htmlStr);
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}

//送出訊息
function sendMsg(userId){
	console.log("you is send message ? " + userId);
	let msg = $('#msg-input');
	console.log("YOUR MSG" + msg.val());
	let currentTime = new Date();
	let year = currentTime.getFullYear();
	let mon = currentTime.getMonth()+1;
	let date = currentTime.getDate();
	let hour = currentTime.getHours();
	let min = currentTime.getMinutes();
	let sec = currentTime.getSeconds();
	let jsonObj = {
		UserId : userId,
		Msg : msg.val(),
		SendTime :[year, mon, date, hour, min, sec]
	};
	
	console.log(jsonObj);
	webSocket.send(JSON.stringify(jsonObj));
	msg.val("");
	msg.focus();
}
          
