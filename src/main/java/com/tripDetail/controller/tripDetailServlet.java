package com.tripDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.location.model.LocationVO;
import com.locationPic.model.LocationPicVO;
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
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("addTripLoc".equals(action)) {//來自getOne_LocInfo.jsp ajax的請求
			//1.接收請求參數
			Integer tripId = Integer.valueOf(req.getParameter("TRIP_ID"));
			Integer locId = Integer.valueOf(req.getParameter("LOC_ID"));
			
			Timestamp arrivalTime = Timestamp.valueOf(req.getParameter("arrivalTime")+":00");
			Timestamp leaveTime = Timestamp.valueOf(req.getParameter("leaveTime")+":00");
			
			//2.開始新增
			TripDetailService tripDetailSvc = new TripDetailService();
			TripDetailVO tripDetailVO = tripDetailSvc.addTripDetail(tripId, locId, arrivalTime, leaveTime);
			req.setAttribute("tripDetailVO", tripDetailVO);
			
			//3.完成新增準備轉交
			String url = "/front-end/TripPlan/tripPlan.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}
		
		if ("getTrip_TripDetail".equals(action)) {//來自tripPlan.jsp ajax的請求
			//1.接收請求參數
			Integer tripId = Integer.valueOf(req.getParameter("TRIP_ID"));
			Date date = Date.valueOf(req.getParameter("DATE"));
			
			//2.開始搜尋
			TripDetailService tripDetailSvc = new TripDetailService();
			List<Object> activeList = tripDetailSvc.getTrip_TripDetail(tripId, date);
			List<Object> returnList = new ArrayList<Object>();
			
			LinkedHashMap<String, Object> map = new LinkedHashMap<>();
			List<Object> objList = new ArrayList<Object>();
			for(Object list : activeList) {
				
				if(list instanceof TripDetailVO) {
					TripDetailVO tripDetailVO = (TripDetailVO)list;
					SimpleDateFormat format = new SimpleDateFormat("HH:mm");
					objList.add(tripDetailVO.getTripDatailId());
					objList.add(tripDetailVO.getTripId());
					objList.add(tripDetailVO.getLocId());
					objList.add(format.format(tripDetailVO.getArrivalTime()));
					objList.add(format.format(tripDetailVO.getLeaveTime()));
				}else if (list instanceof LocationVO) {
					LocationVO locVO = (LocationVO)list;
					objList.add(locVO.getUserId());
					objList.add(locVO.getLocName());
					objList.add(locVO.getLongitude());
					objList.add(locVO.getLatitude());
					objList.add(locVO.getLocAddress());
					objList.add(locVO.getLocPhone());
					objList.add(locVO.getLocStatus());
				}else {
					LocationPicVO locPicVO = (LocationPicVO)list;
					objList.add(locPicVO.getLocPicId());
					objList.add(locPicVO.getLocPic());

					map.put("TripD", objList);
					returnList.add(map);
					map = new LinkedHashMap<>();
					objList = new ArrayList<Object>();
				}
			}
			
			//3.完成搜尋，轉送給JS
			Gson gson = new Gson();
			String jsonStr = "";
			jsonStr = gson.toJson(returnList);
			System.out.println(jsonStr);
			PrintWriter out = res.getWriter();
			out.print(jsonStr);
			out.close();
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
