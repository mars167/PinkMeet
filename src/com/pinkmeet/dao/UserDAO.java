package com.pinkmeet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.pinkmeet.bean.User;
import com.pinkmeet.util.DBUtil;

public class UserDAO {
	
	public void insert(User user) {
		String sql = "INSERT INTO user "+
					 " (cell_number, username, password, sex, profile,contact) "+
					 "VALUES (?,?,?,?,?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getCell_number());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setInt(4,	user.getSex());
			pstmt.setString(5, user.getProfile());
            pstmt.setString(6,user.getContact());
			pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public boolean login(String cell_number,String password) {
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM user WHERE cell_number = ?";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cell_number);
			rs = pstmt.executeQuery();
			if(rs.next()&&password.equals(rs.getString("password"))) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public void update(String cell_number,String username,String profile,String contact) {
		Connection conn = DBUtil.getConnection();
		String sql = "UPDATE user" + 
				" SET username = ?,profile = ?, contact = ?" +
				" WHERE cell_number = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
		    if(username != null) {
		    	pstmt.setString(1, username);
		    }else {
		    	pstmt.setString(1," ");
		    }
		    if(profile !=null) {
		    	pstmt.setString(2,profile);
		    }else {
		    	pstmt.setString(2," ");
		    }
			pstmt.setString(3, contact);
		    pstmt.setString(4, cell_number);
		    pstmt.execute();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public User getUserById(int id) {
		User user = new User();
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM user WHERE id = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			user.setId(id);
			user.setUsername(rs.getString("username"));
			user.setCell_number(rs.getString("cell_number"));
			user.setSex(rs.getInt("sex"));
			user.setProfile(rs.getString("profile"));
            user.setContact(rs.getString("contact"));

		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	public User getUserByCell_number(String cell_number) {
		User user = new User();
		Connection conn = DBUtil.getConnection();
		String sql = "SELECT * FROM user WHERE cell_number = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cell_number);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			user.setUsername(rs.getString("username"));
			user.setId(Integer.parseInt(rs.getString("id")));
			user.setCell_number(rs.getString("cell_number"));
			user.setSex(rs.getInt("sex"));
			user.setProfile(rs.getString("profile"));
            user.setContact(rs.getString("contact"));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

    public ArrayList<User> getAll(int uid){
        ArrayList<User> users = new ArrayList<User>() ;
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM user WHERE id <> ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, uid);

            rs = pstmt.executeQuery();
            while (rs.next()){
                User user = new User();
                user.setUsername(rs.getString("username"));
                user.setId(Integer.parseInt(rs.getString("id")));
                user.setCell_number(rs.getString("cell_number"));
                user.setSex(rs.getInt("sex"));
                user.setProfile(rs.getString("profile"));
                user.setContact(rs.getString("contact"));
                users.add(user);
            }
        }catch(SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    public String getContact(int uid){
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM user WHERE id = ?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String contact = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,uid);
            rs = pstmt.executeQuery();
            rs.next();
            contact = rs.getString("contact");
        }catch (SQLException e){
            e.printStackTrace();
        }

        return contact;
    }
	
	
}
