package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BillOperate;

import entity.Bill;

public class BillUpdate extends HttpServlet {
	private static final long serialVersionUID = 9107842491088305396L;
	public BillUpdate() {
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
		String bid = request.getParameter("bId");
		int bId = Integer.parseInt(bid);
		Bill b = new Bill();
		b.setBillId(bId);
		BillOperate bo = new BillOperate();
		b = bo.findid(b);
		request.setAttribute("b", b);
		request.getRequestDispatcher("billUpdate.jsp").forward(request, response);
	}
	public void init() throws ServletException {
	}

}
