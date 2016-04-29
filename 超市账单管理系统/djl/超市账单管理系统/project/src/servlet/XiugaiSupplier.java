package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BillOperate;
import demo.SupplierOperate;
import entity.Bill;
import entity.Supplier;

public class XiugaiSupplier extends HttpServlet {
	public XiugaiSupplier() {
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
		int supId = Integer.parseInt(request.getParameter("supId"));
		String supName = request.getParameter("supName");
		String supMiaoshu = request.getParameter("supMiaoshu");
		String supTelname = request.getParameter("supTelname");
		int supTel = Integer.parseInt(request.getParameter("supTel"));
		String supAddr = request.getParameter("supAddr");
		
		Supplier s = new Supplier();
		s.setSupId(supId);
		s.setSupName(supName);
		s.setSupMiaoshu(supMiaoshu);
		s.setSupTelname(supTelname);
		s.setSupTel(supTel);
		s.setSupAddr(supAddr);
		SupplierOperate so = new SupplierOperate();
		if(so.xiugaiBill(s)==true){
			out.println("<script>alert('修改成功');location.href='providerAdmin.jsp';</script>");
		}else {
			out.println("<script>alert('修改失败');location.href='supplierUpdate.jsp';</script>");
		}
		
		
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
	}

}
