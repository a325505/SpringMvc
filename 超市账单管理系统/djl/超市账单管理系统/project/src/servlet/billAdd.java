package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BillOperate;
import entity.Bill;
/**
 * ����˵�����
 * */
public class billAdd extends HttpServlet {
	private static final long serialVersionUID = -1709342835761314735L;
	public billAdd() {
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
		int billMoney = Integer.parseInt(request.getParameter("billMoney"));
		int billNumber = Integer.parseInt(request.getParameter("billNumber"));
		String billName = request.getParameter("billName");
		int billSuplier = Integer.parseInt(request.getParameter("billSuplier"));
		String billShopping = request.getParameter("billShopping");
		int billIspay = Integer.parseInt(request.getParameter("billIspay"));
//		Date billTime=new Date();
			
		Bill bill = new Bill();
		bill.setBillMoney(billMoney);
		bill.setBillNumber(billNumber);
		bill.setBillName(billName);
		bill.setBillSuplier(billSuplier);
		bill.setBillShopping(billShopping);
		bill.setBillIspay(billIspay);
//		bill.setBillTime(billTime);
		BillOperate bot = new BillOperate();
		if(bot.insertbill(bill)){
			out.println("<script>alert('��ӳɹ�');location.href='admin_bill_list.jsp';</script>");
		}else {
			out.println("<script>alert('���ʧ��');location.href='modify.jsp';</script>");
		}
		
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}

}
