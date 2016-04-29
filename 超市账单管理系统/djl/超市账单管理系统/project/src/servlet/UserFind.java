package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BaseDao;

import entity.User;

public class UserFind extends HttpServlet {
	private static final long serialVersionUID = 6794412192548574101L;
	public Connection con = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	BaseDao bd=new BaseDao();
	public UserFind() {
		super();
	}
	public void destroy() {
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		con= bd.getConnection();
		String sql=null;
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		String userName=request.getParameter("userName");
		if(userName==""||userName==null){
			sql = "select * from users";
		}else{
			sql = "select * from users where  user_name like '%"+userName+"%'";
		}
		User user = null;
		List<User> u=new ArrayList<User>();
		try {
			ps = con.prepareStatement(sql);		
			rs = ps.executeQuery();
			while( rs.next()){
				user = new User();
				user.setUserId( rs.getInt("user_id"));
				user.setUserName( rs.getString("user_name"));			
				user.setUserGender( rs.getString("user_gender"));
				user.setUserAge( rs.getInt("user_age"));
				user.setUserTel( rs.getInt("user_tel"));
				user.setUserAddress( rs.getString("user_addr"));
				user.setUserRole( rs.getString("user_role"));
				user.setUserPassword( rs.getString("user_password"));
				u.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			bd.shutdown(con,ps,rs);
			request.getSession().setAttribute("Users", u);
			request.getSession().setAttribute("userName", userName);
			request.getRequestDispatcher("user_find.jsp").forward(request, response);	
		}

	}
	public void init() throws ServletException {

	}
}