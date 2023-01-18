package com.locationPic.model;

public class LocationPicService {
	private LocationPicDAO_interface dao ;
	
	public LocationPicService() {
		dao = new LocationPicJDBCDAO();
	}
	
	public LocationPicVO addLocPic(Integer LocId, byte[] LocPic) {
		
		LocationPicVO locPicVO = new LocationPicVO();
		locPicVO.setLocId(LocId);
		locPicVO.setLocPic(LocPic);
		dao.insert(locPicVO);
		
		return locPicVO;
	}
	
	public void deleteLocPic(Integer locPicId) {
		dao.delete(locPicId);
	}
	
	public LocationPicVO getLocPic(Integer locId) {
		LocationPicVO locPicVO = new LocationPicVO();
		locPicVO.setLocId(locId);
		return dao.findByForeignKey(locId);
	}
}

