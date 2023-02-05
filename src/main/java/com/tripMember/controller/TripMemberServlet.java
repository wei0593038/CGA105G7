package com.tripMember.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tripMember.model.TripMemberService;
import com.tripMember.model.TripMemberVO;

@WebServlet("/front-end/TripPlan/tripMbr.do")
public class TripMemberServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) {//來自tripPlan.jsp的請求
			//1.接收請求參數
			Integer tripId = Integer.valueOf(req.getParameter("TRIP_ID"));
			String userAccount = req.getParameter("USER_ACCOUNT");
			Boolean isMbr =false;//insert一律都是false
			
			Integer userId = Integer.valueOf(userAccount);
			
			//2.開始新增資料
			TripMemberService tripMbrSvc = new TripMemberService();
			TripMemberVO tripMbrVO = tripMbrSvc.addTripMbr(tripId, userId, isMbr);
			
			//3.新增完成，轉交頁面
			Gson gson = new Gson();
			String jsonStr = gson.toJson(tripMbrVO);
			PrintWriter out = res.getWriter();
			out.print(jsonStr);
			out.close();
			
		}
	}
	
}
