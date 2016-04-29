package demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.User;

public class UserDaoJdbcImpl implements UserDao {
	BaseDao bd = new BaseDao();
	public boolean findUser(User user) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet res=null;
		boolean valid=false;
		User users=new User();
		try {
			/*���ô������ݿ����ӵķ����������*/
			con=bd.getConnection();
			String sql="select * from adminer";
			//ʹ��PreparedStatementԤ�������
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, users.getUserName());
			res=pstmt.executeQuery();
			if(res.next()&&res.getString("upwd").equals(users.getUserPassword())){
				valid=true;
				return valid;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				res.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return valid;
	}
}
