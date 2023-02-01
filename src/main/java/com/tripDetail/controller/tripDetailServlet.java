package com.tripDetail.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tripDetail.model.TripDetailService;
import com.tripDetail.model.TripDetailVO;

@WebServlet("/front-end/TripPlan/tripDetail.do")
public class tripDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("addTripLoc".equals(action)) {//來自getOne_LocInfo.jsp的請求
			//1.接收請求參數
			Integer tripId = Integer.valueOf(req.getParameter("TRIP_ID"));
			System.out.println(tripId);
			Integer locId = Integer.valueOf(req.getParameter("LOC_ID"));
			System.out.println(locId);
			Timestamp arrivalTime = Timestamp.valueOf(req.getParameter("arrivalTime"));
			System.out.println(arrivalTime);
			Timestamp leaveTime = Timestamp.valueOf(req.getParameter("leaveTime"));
			System.out.println(leaveTime);
			
			//2.開始新增
			TripDetailService tripDetailSvc = new TripDetailService();
			TripDetailVO tripDetailVO = tripDetailSvc.addTripDetail(tripId, locId, arrivalTime, leaveTime);
			req.setAttribute("tripDetailVO", tripDetailVO);
			
			//3.完成新增準備轉交
			String url = "/front-end/TripPlan/tripPlan.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}
		
		if ("getTrip_TripDetail".equals(action)) {//來自tripPlan.jsp的請求
			//1.接收請求參數
			Integer tripId = Integer.valueOf(req.getParameter("TRIP_ID"));
			Date date = Date.valueOf(req.getParameter("DATE"));
			
			//2.開始搜尋
			TripDetailService tripDetailSvc = new TripDetailService();
			List<TripDetailVO> activeList = tripDetailSvc.getTrip_TripDetail(tripId, date);
			req.setAttribute("activeList", activeList);
			
			//3.完成新增準備轉交
			String url = "/front-end/TripPlan/tripPlan.jsp";
			req.getRequestDispatcher(url).forward(req, res);
			
		}
		
		if ("delete_Date".equals(action)) {//來自tripPlan.jsp的請求
			//1.接收請求參數
			Integer tripId = Integer.valueOf(req.getParameter("TRIP_ID"));
			Date date = Date.valueOf(req.getParameter("DATE"));
			
			//2.開始刪除
			TripDetailService tripDetailSvc = new TripDetailService();
			tripDetailSvc.deleteByDate(tripId, date);
			
			//3.刪除完成後開始轉交
			String url = "/front-end/TripPlan/tripPlan.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}
		
		if ("deleteTripLoc".equals(action)) {//來自tripPlan.jsp的請求
			//1.接收請求參數
			Integer tripDetailId = Integer.valueOf(req.getParameter("TRIP_DETAIL_ID"));
			
			//2.開始刪除
			TripDetailService tripDetailSvc = new TripDetailService();
			tripDetailSvc.deleteTripDetail(tripDetailId);
			
			//3.刪除完成後開始轉交
			String url = "/front-end/TripPlan/tripPlan.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}
	}

}
