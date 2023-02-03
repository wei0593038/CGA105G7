package com.tripDetail.model;

import java.sql.Date;
import java.util.List;

public interface TripDetailDAO_interface {
	public void insert(TripDetailVO tripDetailVO);
	public void update(TripDetailVO tripDetailVO);
	public void delete(Integer tripDetailId);
	public void deleteByDate(Integer tripId, Date date);
	public TripDetailVO findByPrimaryKey(Integer tripDetailId);
	public List<TripDetailVO> getAll();
	public List<Object> getAll_ForTRIP(Integer tripId,Date date);
	public List<TripDetailVO> getAll_ForTripId(Integer tripId);
}
