package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.SupplierOperate;
import entity.Supplier;
/**
 * 供应商详细信息页面
 */
public class SupplierUpdate extends HttpServlet {
	private static final long serialVersionUID = 8799505567612124147L;
	public SupplierUpdate() {
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
		
		String supId = request.getParameter("SupId");
		int SupId = Integer.parseInt(supId);
		
		Supplier s = new Supplier();
		s.setSupId(SupId);
		SupplierOperate so = new SupplierOperate();
		s = so.finduser(s);
		request.setAttribute("s",s);
		request.getRequestDispatcher("supplierUpdate.jsp").forward(request, response);
	}
	public void init() throws ServletException {
	}

}
