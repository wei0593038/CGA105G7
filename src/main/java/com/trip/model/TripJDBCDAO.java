package com.trip.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TripJDBCDAO implements TripDAO_interface{
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/test01?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "King297145";
	
	private static final String INSERT_STMT = 
			"INSERT INTO trip (TRIP_NAME,START_DATE,END_DATE,COVER_PIC,NOTES) VALUES (?,?,?,?,?)";
		private static final String GET_ALL_STMT = 
			"SELECT TRIP_ID,TRIP_NAME,START_DATE,END_DATE,COVER_PIC,NOTES FROM trip order by TRIP_ID";
		private static final String GET_ONE_STMT = 
			"SELECT TRIP_ID,TRIP_NAME,START_DATE,END_DATE,COVER_PIC,NOTES FROM trip where TRIP_ID = ?";
		private static final String DELETE = 
			"DELETE FROM trip where TRIP_ID = ?";
		private static final String UPDATE = 
			"UPDATE trip set TRIP_NAME=?, START_DATE=?, END_DATE=?, COVER_PIC=?, NOTES=? where TRIP_ID = ?";
	
	@Override
	public void insert(TripVO tripVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, tripVO.getTripName());
			pstmt.setDate(2, tripVO.getStartDate());
			pstmt.setDate(3, tripVO.getEndDate());
			pstmt.setBytes(4, tripVO.getCoverPic());
			pstmt.setString(5, tripVO.getNotes());
			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
			// Handle any SQL errors
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
			// Clean up JDBC resources
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(TripVO tripVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(UPDATE);
			
			pstmt.setString(1, tripVO.getTripName());
			pstmt.setDate(2, tripVO.getStartDate());
			pstmt.setDate(3, tripVO.getEndDate());
			pstmt.setBytes(4, tripVO.getCoverPic());
			pstmt.setString(5, tripVO.getNotes());
			pstmt.setInt(6, tripVO.getTripId());
			pstmt.executeUpdate();
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
			// Handle any SQL errors
		}catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
			// Clean up JDBC resources
		}finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Integer tripId) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, tripId);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public TripVO findByPrimaryKey(Integer tripId) {
		TripVO tripVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, tripId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				tripVO = new TripVO();
				tripVO.setTripId(rs.getInt("TRIP_ID"));
				tripVO.setTripName(rs.getString("TRIP_NAME"));
				tripVO.setStartDate(rs.getDate("START_DATE"));
				tripVO.setEndDate(rs.getDate("END_DATE"));
				tripVO.setCoverPic(rs.getBytes("COVER_PIC"));
				tripVO.setNotes(rs.getString("NOTES"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return tripVO;
	}

	@Override
	public List<TripVO> getAll() {
		List<TripVO> list = new ArrayList<TripVO>();
		TripVO tripVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 也稱為 Domain objects
				tripVO = new TripVO();
				tripVO.setTripId(rs.getInt("TRIP_ID"));
				tripVO.setTripName(rs.getString("TRIP_NAME"));
				tripVO.setStartDate(rs.getDate("START_DATE"));
				tripVO.setEndDate(rs.getDate("END_DATE"));
				tripVO.setCoverPic(rs.getBytes("COVER_PIC"));
				tripVO.setNotes(rs.getString("NOTES"));

				list.add(tripVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	
	

}
