package com.tripMember.model;

import java.sql.Connection;

public interface TripMemberDAO_interface {
	public void insert(TripMemberVO tripMemberVO);
	public void jointInsert(TripMemberVO tripMemberVO, Connection con);
	public void update(TripMemberVO tripMemberVO);
	public void delete(Integer tripMbrId);
	public TripMemberVO findByTripId(Integer tripId);
}
