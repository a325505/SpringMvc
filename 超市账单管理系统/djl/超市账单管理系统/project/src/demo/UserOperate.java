package demo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.User;

/*
 * �û�����
 */
public class UserOperate extends BaseDao{
	/*
	 * �û���ѯ
	 */
	public List<User> select(int page, int papeuser){
		List<User> user = new ArrayList<User>();
		con = getConnection();
		/**
		 * ��ҳ��ѯ����
		 * */
		String sql = "select * from (select rownum as r,t.* from (select * from users  order by user_id) t "
			+ "where rownum<= "
			+ page * papeuser
			+ ")where r>"
			+ (page - 1) * papeuser;
		try {
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			User us = null;
			while(rs.next()){
				us = new User();
				us.setUserId( rs.getInt("user_id"));
				us.setUserName( rs.getString("user_name"));			
				us.setUserGender( rs.getString("user_gender"));
				us.setUserAge( rs.getInt("user_age"));
				us.setUserTel( rs.getInt("user_tel"));
				us.setUserAddress( rs.getString("user_addr"));
				us.setUserRole( rs.getString("user_role"));
				us.setUserPassword( rs.getString("user_password"));
				user.add(us);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		return user;
	}
	/**
	 * ������������
	 * */
	public int getCount(){
		
		int count = 0;
		con = getConnection();
		String sql="select count(user_id) from users ";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			shutdown(con,ps,rs);
		}
		return count;
	}
	/**
	 * ����û�����
	 * */
	public boolean insertuser(User user){
		boolean isInsertuser = false;
		
		con = getConnection();
		String sql = "insert into users values(user_seq.nextVal,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserGender());
			ps.setInt(3, user.getUserAge());
			ps.setInt(4, user.getUserTel());
			ps.setString(5, user.getUserAddress());
			ps.setString(6, user.getUserRole());
			ps.setString(7, user.getUserPassword());
			int rows = ps.executeUpdate();
			isInsertuser = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isInsertuser;
	}
	/**
	 * ��ѯ�û���Ϣ
	 * */
	public User finduser(User u) {
		con = getConnection();
		String sql = "select * from users where user_id=" + u.getUserId();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			u=new User();
			while(rs.next()){
				u.setUserId( rs.getInt("user_id"));
				u.setUserName( rs.getString("user_name"));			
				u.setUserGender( rs.getString("user_gender"));
				u.setUserAge( rs.getInt("user_age"));
				u.setUserTel( rs.getInt("user_tel"));
				u.setUserAddress( rs.getString("user_addr"));
				u.setUserRole( rs.getString("user_role"));
				u.setUserPassword( rs.getString("user_password"));
				System.out.println(u.getUserAge());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		return u;
	}
	/**
	 * ɾ������id���û�
	 * */
	public boolean deleteUser(User u) {
		boolean isdeleteUser = false;
		
		con=getConnection();
		String sql = "delete from users where user_id=?";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, u.getUserId());
			int rows = ps.executeUpdate();
			isdeleteUser = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isdeleteUser;
	}
	/**
	 * �޸Ķ�Ӧid���û�
	 * */
	public boolean xiugaiUser(User u) {
boolean isInsertuser = false;
		
		con = getConnection();
		String sql = "update users set user_name=?,user_gender=?,user_age=?,user_tel=?,user_addr=?,user_role=? where user_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getUserName());
			ps.setString(2, u.getUserGender());
			ps.setInt(3, u.getUserAge());
			ps.setInt(4, u.getUserTel());
			ps.setString(5, u.getUserAddress());
			ps.setString(6, u.getUserRole());
			ps.setInt(7, u.getUserId());
			int rows = ps.executeUpdate();
			isInsertuser = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isInsertuser;
	}
	/**
	 * �޸Ķ�Ӧid���û�����
	 * */
	public boolean xiugaipassword(User u) {
boolean isInsertuser = false;
		
		con = getConnection();
		String sql = "update users set user_password=? where user_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getUserPassword());
			ps.setInt(2, u.getUserId());
			int rows = ps.executeUpdate();
			isInsertuser = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isInsertuser;
	}
}
