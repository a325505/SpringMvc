package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BaseDao;
import entity.Bill;

public class BillFind extends HttpServlet {
	private static final long serialVersionUID = -976968888837183017L;
	public Connection con = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	BaseDao bd=new BaseDao();
	public BillFind() {
		super();
	}
	public void destroy() {
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		con= bd.getConnection();
		String sql=null;
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		String productName=request.getParameter("productName");
		String payStatus=request.getParameter("payStatus");
		if(request.getParameter("productName")==""||request.getParameter("productName")==null){
			if(request.getParameter("payStatus")==""||request.getParameter("payStatus")==null){
				sql="select * from bill";
				}else{
					sql = "select * from bill where bill_ispay = "+request.getParameter("payStatus");
				}
		}else{
			if(request.getParameter("payStatus")==""||request.getParameter("payStatus")==null){
				sql = "select * from bill where  bill_name like '%"+productName+"%'";
			}else{
				sql = "select * from bill where  bill_name like '%"+productName+"%' and bill_ispay = "+request.getParameter("payStatus");
			}
		}
		Bill bill = null;
		List<Bill> b=new ArrayList<Bill>();
		try {
			ps = con.prepareStatement(sql);		
			rs = ps.executeQuery();
			while( rs.next()){
				bill = new Bill();
				bill.setBillId( rs.getInt("bill_id"));
				bill.setBillName( rs.getString("bill_name"));
				bill.setBillNumber( rs.getInt("bill_number"));
				bill.setBillMoney( rs.getInt("bill_money"));
				bill.setBillIspay( rs.getInt("bill_ispay"));
				bill.setBillSuplier( rs.getInt("bill_suplier"));
				bill.setBillShopping( rs.getString("bill_shopping"));
				bill.setBillTime( rs.getDate("bill_time"));
				b.add(bill);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			bd.shutdown(con,ps,rs);
			
		}
		request.getSession().setAttribute("Bills", b);
		request.getRequestDispatcher("list_find.jsp").forward(request, response);	
		request.getSession().setAttribute("payStatus", payStatus);
	}
	public void init() throws ServletException {

	}
}
