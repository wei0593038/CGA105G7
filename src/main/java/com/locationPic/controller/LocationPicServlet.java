package com.locationPic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.locationPic.model.LocationPicService;
import com.locationPic.model.LocationPicVO;

@WebServlet("/back-end/Location/locPic.do")
public class LocationPicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("get_For_Update".equals(action)) {//來自getAllLoc.jsp
			System.out.println("進來了");
			//1. 接收請求參數
			Integer locId = Integer.valueOf(req.getParameter("LOC_ID"));
			
			//2.開始查詢資料
			LocationPicService locPicSvc = new LocationPicService();
			List<LocationPicVO> locPicVO = locPicSvc.getLocPic(locId);
			req.setAttribute("locPicVO", locPicVO);//資料庫取出的locPicVO物件，存入req
			
			Boolean openPicModal = true;
			req.setAttribute("openPicModal", openPicModal);
			
			//查詢完成準備轉交
			String url = "/back-end/Location/locManage.jsp";
			req.getRequestDispatcher(url).forward(req, res);
			
		}
	}

}
