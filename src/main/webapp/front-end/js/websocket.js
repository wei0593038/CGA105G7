
//Websocket
	var MyPoint = `/tripChat.do/${tripId}`;
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
		let jsonStr = JSON.parse(msg.data);
			if(jsonStr.length === undefined){
				updateDialog(jsonStr)
			}
		
			for(let count =0; count<jsonStr.length; count++){
				let jsonObj = JSON.parse(jsonStr[count]);
				updateDialog(jsonObj);
			};
		}
		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}

//送出訊息
function sendMsg(){
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
		userId: userId,
		tripId: tripId,
		message: msg.val(),
		sendTime:[year, mon, date, hour, min, sec]
	};
	
	console.log(jsonObj);
	webSocket.send(JSON.stringify(jsonObj));
	msg.val("");
	msg.focus();
}

let date=0;
function updateDialog(json){
	let msgContent = $('#msg-content');
	let htmlStr = "";
	if(date < json.sendTime[2]){
		 date = json.sendTime[2];
		 let dateHtml = `<div class="text-center"><p class="d-inline p-2 bg-cblue" style="border-radius: 30px;">${json.sendTime[1]}/${date}日</p></div>`;
		 msgContent.append(dateHtml);
	}
	if(json.userId === userId){
		htmlStr = `
		<div class="m-2 text-end d-flex flex-row-reverse">
            <span class="trip-msg text-start">${json.message}</span>
            <p class="fs-6 mb-0 mt-auto">${json.sendTime[3]}:${json.sendTime[4]}</p> 
         </div>`;			
		}else{
		htmlStr = `
		<div class="m-2 text-end d-flex">
			<div>${json.userId}</div>
            <span class="trip-msg">${json.message}</span>
            <p class="fs-6 mb-0 mt-auto">${json.sendTime[3]}:${json.sendTime[4]}</p> 
         </div>`;
		}
   	msgContent.append(htmlStr);
   	let scrollHeight = $('#msg-content').prop("scrollHeight");
   	msgContent.scrollTop(scrollHeight,200);
}
          
