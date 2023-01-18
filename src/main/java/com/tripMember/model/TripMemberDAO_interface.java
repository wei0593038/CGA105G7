package com.tripMember.model;

public interface TripMemberDAO_interface {
	public void insert(TripMemberVO tripMemberVO);
	public void update(TripMemberVO tripMemberVO);
	public void delete(Integer tripMbrId);
	public TripMemberVO findByTripId(Integer tripId);
}
