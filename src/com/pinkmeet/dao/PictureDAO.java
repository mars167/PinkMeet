package com.pinkmeet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.pinkmeet.bean.User;
import com.pinkmeet.util.DBUtil;

public class PictureDAO {

	public void insert() {
		Connection conn = DBUtil.getConnection();
		String sql="";
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
