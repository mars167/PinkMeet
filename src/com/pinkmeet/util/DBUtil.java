package com.pinkmeet.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	// 数据库 URL
    static final String DB_URL = "jdbc:mysql://localhost:3360/PinkMeet?characterEncoding=UTF-8";
    // 数据库的用户名与密码，需要根据自己的设置
    static final String USER = "mars";
    static final String PASS = "572286594abc";
    
    private static Connection conn = null;
    
    static
    {
      try
      {
        // 1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        // 2.获得数据库的连接
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
      }
      catch (ClassNotFoundException e)
      {
        e.printStackTrace();
      }
      catch (SQLException e)
      {
        e.printStackTrace();
      }
    }
    
    public static Connection getConnection() {
    	return conn;
    }
    
    public static void closeJDBC(ResultSet rs,Statement stmt, Connection conn) {
    	// 
    	if(rs!= null) {
    		try {
    			rs.close();
    		}catch(SQLException e){
    			e.printStackTrace();
    		}
    	}
    	if(stmt != null) {
    		try{
    			stmt.close();
    		}catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    	if(conn != null) {
    		try {
    			conn.close();
    		}catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    	
    }
    
    
    
    
}
