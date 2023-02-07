package com.tripChat.controller;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/tripChat.do")
public class WSTripChat {
	private static final Set<Session> connectedSessions = Collections.synchronizedSet(new HashSet<>());
	@OnOpen
	public void onOpen(Session session) {
		connectedSessions.add(session);
		System.out.println("連接成功");
	}
	
	@OnClose
	public void onClose() {
		System.out.println("已關閉");
	}
	
	@OnMessage
	public void onMsg(String msg, Session userSession) {
		for (Session session : connectedSessions) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(msg);
		}
		System.out.println("接收訊息" + msg);
	}
	
	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("系統異常");
	}
}
