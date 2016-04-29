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

import entity.Supplier;

public class SupplierFind extends HttpServlet {
	private static final long serialVersionUID = 3315899224346140153L;
	public Connection con = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	BaseDao bd=new BaseDao();
	public SupplierFind() {
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
		String providerName=request.getParameter("providerName");
		String providerDesc=request.getParameter("providerDesc");
		if(providerName==""||providerName==null){
			if(providerDesc==""||providerDesc==null){
				sql="select * from suplier";
				}else{
					sql = "select * from suplier where sup_miaoshu like '%"+providerDesc+"%'";
				}
		}else{
			if(providerDesc==""||providerDesc==null){
				sql = "select * from suplier where  sup_name like '%"+providerName+"%'";
			}else{
				sql = "select * from suplier where  sup_name like '%"+providerName+"%' and sup_miaoshu like '%"+providerDesc+"%'";
			}
		}
		Supplier sup = null;
		List<Supplier> s=new ArrayList<Supplier>();
		try {
			ps = con.prepareStatement(sql);		
			rs = ps.executeQuery();
			while( rs.next()){
				sup = new Supplier();
				sup.setSupId( rs.getInt("sup_id"));
				sup.setSupName( rs.getString("sup_name"));
				sup.setSupMiaoshu( rs.getString("sup_miaoshu"));
				sup.setSupTelname( rs.getString("sup_telname"));
				sup.setSupTel( rs.getInt("sup_tel"));
				sup.setSupAddr( rs.getString("sup_addr"));
				s.add(sup);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			bd.shutdown(con,ps,rs);
			request.getSession().setAttribute("Sups", s);
			request.getRequestDispatcher("provider_find.jsp").forward(request, response);	
		}

	}
	public void init() throws ServletException {

	}
}
