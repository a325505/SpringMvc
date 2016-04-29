package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.UserOperate;

import entity.User;
/**
 * 用户详细信息页面
 * */
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 3241257360696599678L;
	public UserUpdate() {
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
		
		String uid = request.getParameter("Uid");
		int Uid = Integer.parseInt(uid);
		
		User u = new User();
		u.setUserId(Uid);
		UserOperate uo = new UserOperate();
		u = uo.finduser(u);
		request.setAttribute("u",u);
		request.getRequestDispatcher("userUpdate.jsp").forward(request, response);
	}
	public void init() throws ServletException {
	}

}
