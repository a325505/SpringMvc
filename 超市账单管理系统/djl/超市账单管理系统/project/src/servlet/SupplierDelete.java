package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.SupplierOperate;
import entity.Supplier;

public class SupplierDelete extends HttpServlet {
	private static final long serialVersionUID = 5664328927349448372L;
	public SupplierDelete() {
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
		Supplier s = new Supplier();
		s.setSupId(supId);
		SupplierOperate so = new SupplierOperate();
		if(so.deleteUser(s)){
			out.println("<script>alert('É¾³ý³É¹¦');location.href='providerAdmin.jsp';</script>");
		}else {
			out.println("<script>alert('É¾³ýÊ§°Ü');location.href='providerAdmin.jsp';</script>");
		}
		
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
