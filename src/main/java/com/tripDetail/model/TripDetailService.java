package com.tripDetail.model;

import java.sql.Timestamp;
import java.util.List;

public class TripDetailService {
	private TripDetailDAO_interface dao;
	
	public TripDetailService() {
		dao = new TripDetailJDBCDAO();
	}
	
	public TripDetailVO addTripDetail(Integer tripId, Integer LocId, Timestamp arrivalTime, Timestamp leaveTime) {
		
		TripDetailVO tripDetailVO = new TripDetailVO();
		tripDetailVO.setTripId(tripId);
		tripDetailVO.setLocId(LocId);
		tripDetailVO.setArrivalTime(arrivalTime);
		tripDetailVO.setLeaveTime(leaveTime);
		dao.insert(tripDetailVO);
		return tripDetailVO;
	}
	
	public TripDetailVO updateTripDetail(Integer tripId, Integer LocId, Timestamp arrivalTime, Timestamp leaveTime) {
		TripDetailVO tripDetailVO = new TripDetailVO();
		tripDetailVO.setTripId(tripId);
		tripDetailVO.setLocId(LocId);
		tripDetailVO.setArrivalTime(arrivalTime);
		tripDetailVO.setLeaveTime(leaveTime);
		dao.update(tripDetailVO);
		return tripDetailVO;
	}
	
	public void deleteTripDetail(Integer tripDetailId) {
		dao.delete(tripDetailId);
	}
	
	public TripDetailVO getOneTripDetail(Integer tripDetailId) {
		return dao.findByPrimaryKey(tripDetailId);
	}
	
	public List<TripDetailVO> getAll(){
		return dao.getAll();
	}
}
