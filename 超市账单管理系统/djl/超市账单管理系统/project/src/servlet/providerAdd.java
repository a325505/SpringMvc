package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.SupplierOperate;
import entity.Supplier;

public class providerAdd extends HttpServlet {
	private static final long serialVersionUID = -6461400204873301238L;
	public providerAdd() {
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
		
		String supName = request.getParameter("supName");
		String supMiaoshu = request.getParameter("supMiaoshu");
		String supTelname = request.getParameter("supTelname");
		int supTel = Integer.parseInt(request.getParameter("supTel"));
		String supAddr = request.getParameter("supAddr");
		
		Supplier sup = new Supplier();
		sup.setSupName(supName);
		sup.setSupMiaoshu(supMiaoshu);
		sup.setSupTelname(supTelname);
		sup.setSupTel(supTel);
		sup.setSupAddr(supAddr);
		
		SupplierOperate sot = new SupplierOperate();
		
		if(sot.insertSup(sup)){
			out.println("<script>alert('��ӳɹ�');location.href='providerAdmin.jsp';</script>");
		}else {
			out.println("<script>alert('���ʧ��');location.href='providerAdd.jsp';</script>");
		}
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
