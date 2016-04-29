package servlet;
/**
 * 删除对应id用户的操作
 * */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.UserOperate;

import entity.User;

public class UserDelete extends HttpServlet {
	private static final long serialVersionUID = 1224867738771567322L;
	public UserDelete() {
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
		User u = new User();
		u.setUserId(userId);
		UserOperate uo = new UserOperate();
		if(uo.deleteUser(u)){
			out.println("<script>alert('删除成功');location.href='userAdmin.jsp';</script>");
		}else {
			out.println("<script>alert('删除失败');location.href='userUpdate.jsp';</script>");
		}
		
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
