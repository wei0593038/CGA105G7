package com.tripDetail.model;

import java.util.List;

public interface TripDetailDAO_interface {
	public void insert(TripDetailVO tripDetailVO);
	public void update(TripDetailVO tripDetailVO);
	public void delete(Integer tripDetailId);
	public TripDetailVO findByPrimaryKey(Integer tripDetailId);
	public List<TripDetailVO> getAll();
	public List<TripDetailVO> getAll_ForTRIP(Integer tripId);
}
