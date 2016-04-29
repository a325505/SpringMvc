package demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/*
 * ���ݿ�����
 */
public class BaseDao {
	private static String driver = "oracle.jdbc.driver.OracleDriver";
	private static String url = "jdbc:oracle:thin:@localhost:1521:HFACCP";
	private static String username ="system";
	private static String password ="system";
	
	/**
	 * �������ݿ����ӹ���
	 * */
	public static Connection con = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	public   Connection getConnection(){
		try {
			//�������ݿ���������
			Class.forName(driver);
			//�������
			con=DriverManager.getConnection(url,username,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;

	}
	public void shutdown(Connection con,PreparedStatement ps,ResultSet rs){
		try {
			if(rs != null )
				rs.close();
			if(ps != null)
				ps.close();
			if(con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
