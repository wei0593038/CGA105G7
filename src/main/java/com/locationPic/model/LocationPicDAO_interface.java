package com.locationPic.model;

import java.sql.Connection;

public interface LocationPicDAO_interface {
	public void insert(LocationPicVO locationPicVO);
	public void insertHasPic(LocationPicVO locationPicVO, Connection con);
	public void delete(Integer locPicId);
	public LocationPicVO findByForeignKey(Integer locId);
}
