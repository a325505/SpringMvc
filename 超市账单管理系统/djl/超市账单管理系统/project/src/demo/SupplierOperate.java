package demo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Supplier;
import entity.User;

public class SupplierOperate extends BaseDao{
	/*
	 * 查询供应商
	 */
	public List<Supplier> select(int page, int papesup){
		List<Supplier> supplier = new ArrayList<Supplier>();
		con = getConnection();
		/**
		 * 分页查询数据
		 * */
		String sql = "select * from (select rownum as r,t.* from (select * from suplier order by sup_id) t "
			+ "where rownum<= "
			+ page * papesup
			+ ")where r>"
			+ (page - 1) * papesup;
		try {
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			Supplier sup = null;
			while(rs.next()){
				sup = new Supplier();
				sup.setSupId( rs.getInt("sup_id"));
				sup.setSupName( rs.getString("sup_name"));
				sup.setSupMiaoshu( rs.getString("sup_miaoshu"));
				sup.setSupTelname( rs.getString("sup_telname"));
				sup.setSupTel( rs.getInt("sup_tel"));
				sup.setSupAddr( rs.getString("sup_addr"));
				supplier.add(sup);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		return supplier;
	}
	/**
	 * 计算数据总数
	 * */
	public int getCount(){
		int count = 0;
		con = super.getConnection();
		String sql="select count(sup_id) from suplier ";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			shutdown(con,ps,rs);
		}
		return count;
	}
	/**
	 * 添加供应商操作
	 * */
	public boolean insertSup(Supplier sup) {
    boolean isInsertsup = false;
		
		con = super.getConnection();
		String sql = "insert into suplier values(sup_seq.nextVal,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, sup.getSupName());
			ps.setString(2, sup.getSupMiaoshu());
			ps.setString(3, sup.getSupTelname());
			ps.setInt(4, sup.getSupTel());
			ps.setString(5, sup.getSupAddr());
			int rows = ps.executeUpdate();
			isInsertsup = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isInsertsup;
	}
	/**
	 * 查询供应商信息
	 * */
	public Supplier finduser(Supplier s) {
		super.getConnection();
		String sql = "select * from suplier where sup_id=" + s.getSupId();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			s=new Supplier();
			while(rs.next()){
				s.setSupId( rs.getInt("sup_id"));
				s.setSupName( rs.getString("sup_name"));			
				s.setSupMiaoshu( rs.getString("sup_miaoshu"));
				s.setSupTelname( rs.getString("sup_telname"));
				s.setSupTel( rs.getInt("sup_tel"));
				s.setSupAddr( rs.getString("sup_addr"));
				System.out.println(s.getSupAddr());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		return s;
	}
	/**
	 * 删除对用id的供应商操作
	 * */
	public boolean deleteUser(Supplier s) {
boolean isdeleteSup = false;
		
super.getConnection();
		String sql = "delete from suplier where sup_id=?";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, s.getSupId());
			int rows = ps.executeUpdate();
			isdeleteSup = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isdeleteSup;
	}
	/**
	 * 修改对应id的供应商信息
	 * */
	public boolean xiugaiBill(Supplier s) {
boolean isInsertsup = false;
		
		con = getConnection();
		String sql = "update suplier set sup_name=?,sup_miaoshu=?,sup_telname=?,sup_tel=?,sup_addr=? where sup_id=?";
		try {
			ps = con.prepareStatement(sql);	
			ps.setString(1, s.getSupName());
			ps.setString(2, s.getSupMiaoshu());
			ps.setString(3, s.getSupTelname());		
			ps.setInt(4, s.getSupTel());
			ps.setString(5, s.getSupAddr());
			ps.setInt(6, s.getSupId());
			System.out.println(sql);
			int rows = ps.executeUpdate();	
			isInsertsup = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isInsertsup;
	}
}
