package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.BaseDao;
import demo.BillOperate;
import entity.Bill;

public class BillSelect extends HttpServlet{
	private static final long serialVersionUID = -3610002870998812411L;
	public Connection con = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	BaseDao bd=new BaseDao();
	Bill b=new Bill();
	public BillSelect() {
		super();
	}
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException{
		doPost(request, response);
	}
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		//String billName = request.getParameter("");
		BillOperate bo = new BillOperate();
			bo.getConnection();
			String sql="selest * from bill";
			try {
				ps=con.prepareStatement(sql);
				rs =  ps.executeQuery();
				while(rs.next()){
					b.setBillId( rs.getInt("bill_id"));
					b.setBillName( rs.getString("bill_name"));
					b.setBillNumber( rs.getInt("bill_number"));
					b.setBillMoney( rs.getInt("bill_money"));
					b.setBillIspay( rs.getInt("bill_ispay"));
					b.setBillSuplier( rs.getInt("bill_suplier"));
					b.setBillShopping( rs.getString("bill_shopping"));
					b.setBillTime( rs.getDate("bill_time"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				bd.shutdown(con, ps, rs);
			}
	}
}
