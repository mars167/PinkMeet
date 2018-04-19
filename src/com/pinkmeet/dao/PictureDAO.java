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
	
	
	
}
