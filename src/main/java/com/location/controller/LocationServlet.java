package com.location.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.location.model.LocationService;
import com.location.model.LocationVO;

//@WebServlet("/back-end/Location/") 等同到web.xml註冊
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class LocationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) {
			Integer userId = Integer.valueOf(req.getParameter("userId"));
			String locName = req.getParameter("loc_name").trim();
			String longitude = req.getParameter("longitude").trim();
			String latitude = req.getParameter("latitude").trim();
			String address = req.getParameter("address").trim();
			String phone = req.getParameter("phone").trim();
 
			LocationVO locVO = new LocationVO();
			locVO.setUserId(userId);
			locVO.setLocName(locName);
			locVO.setLongitude(longitude);
			locVO.setLatitude(latitude);
			locVO.setLocAddress(address);
			locVO.setLocPhone(phone);
			// 解析圖片
			Collection<Part> pic = req.getParts();

//					開始新增資料					
			LocationService locSer = new LocationService();
			locVO = locSer.addLoc(userId, locName, longitude, latitude, address, phone, pic);

//					完成新增準備轉交
			String url = "/back-end/Location/locManage.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) {
			// 1.接收請求參數
			Integer locId = Integer.valueOf(req.getParameter("LOC_ID"));

			// 開始查詢資料
			LocationService locSrv = new LocationService();
			LocationVO locVO = locSrv.getOneLoc(locId);
			req.setAttribute("locVO", locVO);//資料庫取出的locVO物件，存入req
			
			Boolean openModal = true;
			req.setAttribute("openModal", openModal);

			// 查詢完成準備轉交
			String url = "/back-end/Location/locManage.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}

		if ("update".equals(action)) { // 來自listOneLoc.jsp的請求
			
			/*************************** 1.接收請求參數 **********************/
			Integer locId = Integer.valueOf(req.getParameter("locId"));
			Integer userId = Integer.valueOf(req.getParameter("userId"));
			String locName = req.getParameter("loc_name").trim();
			String longitude = req.getParameter("longitude").trim();
			String latitude = req.getParameter("latitude").trim();
			String address = req.getParameter("address").trim();
			String phone = req.getParameter("phone").trim();
			Integer locStatus = Integer.valueOf(req.getParameter("state"));

			LocationVO locVO = new LocationVO();
			locVO.setLocId(locId);
			locVO.setUserId(userId);
			locVO.setLocName(locName);
			locVO.setLongitude(longitude);
			locVO.setLatitude(latitude);
			locVO.setLocAddress(address);
			locVO.setLocPhone(phone);
			locVO.setLocStatus(locStatus);
			//開始改資料
			LocationService locSvc = new LocationService();
			locVO = locSvc.updateLoc(locId, userId, locName, longitude, latitude, address, phone, locStatus);
			//修改完成，準備轉交
			req.setAttribute("locVO", locVO);
			String url = "/back-end/Location/locManage.jsp";
			req.getRequestDispatcher(url).forward(req, res);
			
		}
		
		if("search".equals(action)) {
			String searchWord = "%"+req.getParameter("word")+"%";
			LocationService locSvc = new LocationService();
			List<LocationVO> list = locSvc.getForLocation(searchWord);
			
//			req.setAttribute("list", list);
			req.getSession().setAttribute("list", list);  
			String url = "/back-end/Location/search.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		}

	}
}
