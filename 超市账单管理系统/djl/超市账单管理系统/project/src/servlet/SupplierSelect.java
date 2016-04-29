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
import demo.SupplierOperate;
import entity.Supplier;

public class SupplierSelect extends HttpServlet {
	private static final long serialVersionUID = -6077489064313912873L;
	public Connection con = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	BaseDao bd=new BaseDao();
	Supplier s=new Supplier();
	public SupplierSelect() {
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
		SupplierOperate so = new SupplierOperate();
		so.getConnection();
			String sql="selest * from suplier";
			try {
				ps=con.prepareStatement(sql);
				rs =  ps.executeQuery();
				while(rs.next()){
					s.setSupId( rs.getInt("sup_id"));
					s.setSupName( rs.getString("sup_name"));
					s.setSupMiaoshu( rs.getString("sup_miaoshu"));
					s.setSupTelname( rs.getString("sup_telname"));
					s.setSupTel( rs.getInt("sup_tel"));
					s.setSupAddr( rs.getString("sup_addr"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				bd.shutdown(con, ps, rs);
			}
	}
}
