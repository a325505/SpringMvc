package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.UserOperate;

import entity.User;
/**
 * ����û�����
 * */
public class userAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public userAdd() {
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
		//������ת��Ϊ����
		request.setCharacterEncoding("gbk");
		//�������Ϊ����
		response.setContentType("text/html;charset=gbk");	
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		int age = Integer.parseInt(request.getParameter("age"));
		int mobile = Integer.parseInt(request.getParameter("mobile"));
		String address = request.getParameter("address");
		String userRole = request.getParameter("userRole");
		
		User user = new User();
		user.setUserName(username);
		user.setUserPassword(password);
		user.setUserGender(sex);
		user.setUserAge(age);
		user.setUserTel(mobile);
		user.setUserAddress(address);
		user.setUserRole(userRole);
		
		UserOperate uot = new UserOperate();
		if(uot.insertuser(user)){
			out.println("<script>alert('��ӳɹ�');location.href='userAdmin.jsp';</script>");
		}else {
			out.println("<script>alert('���ʧ��');location.href='userAdd.jsp';</script>");
		}
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
