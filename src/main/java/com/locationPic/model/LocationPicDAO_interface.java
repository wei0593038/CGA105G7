package com.locationPic.model;

import java.sql.Connection;
import java.util.List;

public interface LocationPicDAO_interface {
	public void insert(LocationPicVO locationPicVO);
	public void insertHasPic(LocationPicVO locationPicVO, Connection con);
	public void delete(Integer locPicId);
	public List<LocationPicVO> findByForeignKey(Integer locId);
}
