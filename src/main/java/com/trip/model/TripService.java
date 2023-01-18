package com.trip.model;

import java.sql.Date;
import java.util.List;

public class TripService {
	private TripDAO_interface dao;
	
	public TripService() {
		dao = new TripJDBCDAO();
	}
	
	public TripVO addTrip(String tripName, Date startDate, Date endDate, byte[] coverPic, String notes) {
		
		TripVO tripVO = new TripVO();
		tripVO.setTripName(tripName);
		tripVO.setStartDate(startDate);
		tripVO.setEndDate(endDate);
		tripVO.setCoverPic(coverPic);
		tripVO.setNotes(notes);
		dao.insert(tripVO);
		return tripVO;
		
	}
	
	public TripVO updateTrip(String tripName, Date startDate, Date endDate, byte[] coverPic, String notes) {
		TripVO tripVO = new TripVO();
		tripVO.setTripName(tripName);
		tripVO.setStartDate(startDate);
		tripVO.setEndDate(endDate);
		tripVO.setCoverPic(coverPic);
		tripVO.setNotes(notes);
		dao.update(tripVO);
		return tripVO;
	}
	
	public void deleteTrip(Integer tripId) {
		dao.delete(tripId);
	}
	
	public List<TripVO> getAll(){
		return dao.getAll();
	}
	
	public TripVO getOneTrip(Integer tripId) {
		return dao.findByPrimaryKey(tripId);
	}
}
