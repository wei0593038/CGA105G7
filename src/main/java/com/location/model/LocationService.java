package com.location.model;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Part;
public class LocationService {
	private LocationDAO_interface dao;
	
	public LocationService() {
		dao = new LocationJDBCDAO();
	}
	
	public LocationVO addLoc(Integer userId, String locName, String longitude, String latitude, String locAddresss,
			String locPhone,Collection<Part> pic) {
		
		LocationVO locVO = new LocationVO();
		locVO.setUserId(userId);
		locVO.setLocName(locName);
		locVO.setLongitude(longitude);
		locVO.setLatitude(latitude);
		locVO.setLocAddress(locAddresss);
		locVO.setLocPhone(locPhone);
		dao.insertHasPic(locVO, pic);
		
		return locVO;
	}
	
	public List<LocationVO> getAll(){
		return dao.getAll();
	}
	
	public LocationVO getOneLoc(Integer locId) {
		return dao.findByPrimaryKey(locId);
	}
	
	public LocationVO updateLoc(Integer LocId, Integer userId, String locName, String longitude, String latitude, String address, String phone, Integer locStatus) {
		
		LocationVO locVO = new LocationVO();
		locVO.setLocId(LocId);
		locVO.setUserId(userId);
		locVO.setLocName(locName);
		locVO.setLongitude(longitude);
		locVO.setLatitude(latitude);
		locVO.setLocAddress(address);
		locVO.setLocPhone(phone);
		locVO.setLocStatus(locStatus);
		dao.update(locVO);
		return locVO;
	}
	
	public List<LocationVO> getForAddress(String Address){
		return dao.getForAddress(Address);
	}
}
