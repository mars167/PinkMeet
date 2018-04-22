package com.pinkmeet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.pinkmeet.bean.User;
import com.pinkmeet.util.DBUtil;

public class PictureDAO {

	public void insert(int uid,String filename) {
		Connection conn = DBUtil.getConnection();
		String sql="INSERT INTO photoes"
				+ "(uid,filename)"
				+ " VALUES (?,?)";
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setString(2, filename);
			pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void update(int uid,String filename) {
		Connection conn = DBUtil.getConnection();
		String sql= "UPDATE photoes" +
				" SET filename = ?" +
				" WHERE uid = ?";
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,filename);
			pstmt.setInt(2,uid);
			pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean hasImg(int id){
		Connection conn = DBUtil.getConnection();
		String sql="SELECT * FROM photoes WHERE uid = ?";
		PreparedStatement pstmt = null;
		String filename= null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				return true;
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		return false;
	}

	
	public String getImg(int id) {
		Connection conn = DBUtil.getConnection();
		String sql="SELECT * FROM photoes WHERE uid = ?";
		PreparedStatement pstmt = null;
		String filename= null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()){
				filename = rs.getString("filename");
			}
			filename = null;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return filename;
	}
	
	
	
}
