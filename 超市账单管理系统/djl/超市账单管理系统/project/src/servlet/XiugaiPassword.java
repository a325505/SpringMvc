package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.UserOperate;

import entity.User;

public class XiugaiPassword extends HttpServlet {
	private static final long serialVersionUID = -9061115065708044419L;
	public XiugaiPassword() {
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
		response.setCharacterEncoding("GBK");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int userId=Integer.parseInt(request.getParameter("userId"));
		String password = request.getParameter("userPassword");
		String password1 = request.getParameter("userPassword1");
		
		User u = new User();
		u.setUserId(userId);
		u.setUserPassword(password);
		UserOperate uo = new UserOperate();
		if(uo.xiugaipassword(u)){
			out.println("<script>alert('修改成功');location.href='userAdmin.jsp';</script>");
		}else {
			out.println("<script>alert('修改失败');history.go(-1);</script>");
		}
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
