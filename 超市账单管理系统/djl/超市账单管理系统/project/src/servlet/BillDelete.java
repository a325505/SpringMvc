package servlet;
/**
 * 删除对应id账单的操作
 * */
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BillOperate;
import entity.Bill;

public class BillDelete extends HttpServlet {
	private static final long serialVersionUID = -6282535269052346025L;

	public BillDelete() {
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
		int billId = Integer.parseInt(request.getParameter("bId"));
		Bill b = new Bill();
		b.setBillId(billId);
		BillOperate bo = new BillOperate();
		if(bo.deleteBill(b)){
			out.println("<script>alert('删除成功');location.href='admin_bill_list.jsp';</script>");
		}else {
			out.println("<script>alert('删除失败');location.href='admin_bill_list.jsp';</script>");
		}
		
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
