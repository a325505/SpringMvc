package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BillOperate;
import entity.Bill;

public class XiugaiBill extends HttpServlet {
	private static final long serialVersionUID = -2186632376753732070L;
	public XiugaiBill() {
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
		int billId = Integer.parseInt(request.getParameter("billId"));
		int billMoney = Integer.parseInt(request.getParameter("billMoney"));
		int billNumber = Integer.parseInt(request.getParameter("billNumber"));
		String billName = request.getParameter("billName");
		int billSuplier = Integer.parseInt(request.getParameter("billSuplier"));
		String billShopping = request.getParameter("billShopping");
		int billIspay = Integer.parseInt(request.getParameter("billIspay"));
		
		Bill b = new Bill();
		b.setBillId(billId);
		b.setBillMoney(billMoney);
		b.setBillNumber(billNumber);
		b.setBillName(billName);
		b.setBillSuplier(billSuplier);
		b.setBillShopping(billShopping);
		b.setBillIspay(billIspay);
		BillOperate bo = new BillOperate();
		if(bo.xiugaiBill(b)){
			out.println("<script>alert('修改成功');location.href='admin_bill_list.jsp';</script>");
		}else {
			out.println("<script>alert('修改失败');location.href='billUpdate.jsp';</script>");
		}
		
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
