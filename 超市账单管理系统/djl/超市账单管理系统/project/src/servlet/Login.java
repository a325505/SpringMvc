package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import demo.BaseDao;
import entity.User;
/*
 * �û���¼
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 4720373864569160503L;
	public Connection con = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	BaseDao bd=new BaseDao();

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response){
		
		try {
			//������ת��Ϊ����
			request.setCharacterEncoding("gbk");
			//�������Ϊ����
			response.setContentType("text/html;charset=gbk");
			//��ȡ�û�������û���������
			String user=request.getParameter("userName");
			String pass=request.getParameter("passWord");		
			//�������ݿ�
			con=bd.getConnection();
			String sql="select user_id, user_name,user_password,user_role from users where user_name=? and user_password=?";
			HttpSession session = request.getSession();
			ps = con.prepareStatement(sql);
			ps.setString(1, user);
			ps.setString(2, pass);
			rs = ps.executeQuery();
			User u =null;

			if (user == null || user == "") {
				request.setAttribute("flag", "�û�������Ϊ��");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			} else if (pass == null || pass == "") {
				request.setAttribute("flag", "���벻��Ϊ��");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			}else if(rs.next()){
				u = new User();
				u.setUserId(rs.getInt("user_id"));
				u.setUserName(rs.getString("user_name"));
				u.setUserPassword(rs.getString("user_password"));
				u.setUserRole(rs.getString("user_role"));
				session.setAttribute("userName", user);
				session.setAttribute("userRole", u.getUserRole());
				response.sendRedirect("admin_index.jsp");
			}else{
				request.setAttribute("flag", "�û�����������������µ�½��");
				request.getRequestDispatcher("login.jsp").forward(request,response);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}finally {
			bd.shutdown(con, ps, rs);
		}
	}
}
