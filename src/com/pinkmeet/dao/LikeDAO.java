package com.pinkmeet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.pinkmeet.util.DBUtil;

public class LikeDAO {
	
	
	public void insert(int uid,int cuid) {
        //没有被这个用户点过赞
		Connection conn = DBUtil.getConnection();
		//已经点过喜欢的 time+=1
		//被点过喜欢的
		
		String sql="INSERT INTO likes"
				+ "(like_id,belike_id,count_time)"
				+ " VALUES (?,?,?)";
		PreparedStatement pstmt = null;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, cuid);
			pstmt.setInt(3, 0);
			pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

    public void update(int uid,int cuid){
        Connection conn = DBUtil.getConnection();
        String sql = "UPDATE likes " +
                     "SET count_time = count_time + 1 WHERE like_id = ? AND belike_id = ?";
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,uid);
            pstmt.setInt(2,cuid);
            pstmt.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

	public static boolean isLike(int uid,int cuid) {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM likes WHERE like_id = ? AND belike_id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,uid);
            pstmt.setInt(2,cuid);
            rs = pstmt.executeQuery();
            if (rs.next()) return true;
        }catch (SQLException e){
            e.printStackTrace();
        }
		return false;
	}
	
	public static boolean isLiked(int uid,int cuid) {

		return isLike(cuid,uid);
	}
	
	
}
