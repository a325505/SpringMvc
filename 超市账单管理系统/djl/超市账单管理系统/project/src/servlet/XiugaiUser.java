package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.UserOperate;
import entity.User;
public class XiugaiUser extends HttpServlet {
	private static final long serialVersionUID = -243162966105827441L;
	public XiugaiUser() {
		super();
	}
	public void destroy() {
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html");
		response.setCharacterEncoding("GBK");
		PrintWriter out = response.getWriter();
		int userId = Integer.parseInt(request.getParameter("userId"));
		String userName = request.getParameter("username");
		String userGender = request.getParameter("userGender");
		int userAge = Integer.parseInt(request.getParameter("userAge"));
		int userTel = Integer.parseInt(request.getParameter("userTel"));
		String userAddress = request.getParameter("userAddress");
		String userRole = request.getParameter("userRole");
		
		User u = new User();
		u.setUserId(userId);
		u.setUserName(userName);
		u.setUserGender(userGender);
		u.setUserAge(userAge);
		u.setUserTel(userTel);
		u.setUserAddress(userAddress);
		u.setUserRole(userRole);
		UserOperate uo = new UserOperate();
		if(uo.xiugaiUser(u)){
			out.println("<script>alert('修改成功');location.href='userAdmin.jsp';</script>");
		}else {
			out.println("<script>alert('修改失败');location.href='userUpdate.jsp';</script>");
		}
		
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
