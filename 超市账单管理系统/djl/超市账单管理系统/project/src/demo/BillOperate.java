package demo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Bill;
import entity.Supplier;

public class BillOperate extends BaseDao {
	/*
	 * 查询账单
	 */
	public List<Bill> select(int page, int papebill){
		List<Bill> bill = new ArrayList<Bill>();
		con = getConnection();
		/**
		 * 分页查询数据
		 * */
		String sql = "select * from (select rownum as r,t.* from (select * from bill  order by bill_id) t "
			+ "where rownum<= "
			+ page * papebill
			+ ")where r>"
			+ (page - 1) * papebill;
		try {
			ps=con.prepareStatement(sql);
			rs = ps.executeQuery();
			Bill su = null;
			while(rs.next()){
				su = new Bill();
				su.setBillId( rs.getInt("bill_id"));
				su.setBillName( rs.getString("bill_name"));
				su.setBillNumber( rs.getInt("bill_number"));
				su.setBillMoney( rs.getInt("bill_money"));
				su.setBillIspay( rs.getInt("bill_ispay"));
				su.setBillSuplier( rs.getInt("bill_suplier"));
				su.setBillShopping( rs.getString("bill_shopping"));
				su.setBillTime( rs.getDate("bill_time"));
				bill.add(su);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		return bill;
	}
	/**
	 * 计算数据总数
	 * */
	public int getCount(){
		
		int count = 0;
		con = getConnection();
		String sql="select count(bill_id) from bill ";
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
	 * 查询账单信息
	 * */
	public Bill findid(Bill b) {
		con=getConnection();
		String sql = "select * from bill where bill_id = " + b.getBillId();
		try {
			 ps =  con.prepareStatement(sql);
			 rs =  ps.executeQuery();
			while( rs.next()){
				b.setBillId( rs.getInt("bill_id"));
				b.setBillMoney( rs.getInt("bill_money"));
				b.setBillNumber( rs.getInt("bill_number"));
				b.setBillName( rs.getString("bill_name"));
				b.setBillShopping( rs.getString("bill_shopping"));
				b.setBillIspay( rs.getInt("bill_ispay"));
				b.setBillSuplier( rs.getInt("bill_suplier"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			 shutdown( con, ps, rs);
		}
		return b;	
	}
	/**
	 * 删除对应id账单的操作*/
	public boolean deleteBill(Bill b) {
boolean isdeleteBill = false;
		
		con=getConnection();
		String sql = "delete from bill where bill_id=?";
		try {
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, b.getBillId());
			int rows = ps.executeUpdate();
			isdeleteBill = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isdeleteBill;
	}
	/**
	 * 修改对应id的账单
	 * */
	public boolean xiugaiBill(Bill b) {
boolean isInsertbill = false;
		
		con = getConnection();
		String sql = "update bill set bill_name=?,bill_number=?,bill_money=?,bill_ispay=?,bill_suplier=?,bill_shopping=? where bill_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, b.getBillName());
			ps.setInt(2, b.getBillNumber());
			ps.setInt(3, b.getBillMoney());
			ps.setInt(4, b.getBillIspay());		
			ps.setInt(5, b.getBillSuplier());
			ps.setString(6, b.getBillShopping());		
			ps.setInt(7, b.getBillId());
			int rows = ps.executeUpdate();
			isInsertbill = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isInsertbill;
	}
	/**
	 * 添加账单操作
	 * */
	public boolean insertbill(Bill bill) {
boolean isInsertbill = false;
//		Date date=new Date();
		con = getConnection();
		String sql = "insert into bill values(bill_seq.nextVal,?,?,?,?,?,?,sysdate)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, bill.getBillName());
			ps.setInt(2, bill.getBillNumber());
			ps.setInt(3, bill.getBillMoney());
			ps.setInt(4, bill.getBillIspay());		
			ps.setInt(5, bill.getBillSuplier());
			ps.setString(6, bill.getBillShopping());			
			int rows = ps.executeUpdate();
			isInsertbill = rows>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			shutdown(con, ps, rs);
		}
		
		return isInsertbill;
	}
	/**
	 * 获取供货商名称
	 */
	public List<Supplier> getSupName(){
		List<Supplier> sup=new ArrayList<Supplier>();
		
		con=getConnection();
		String sql = "select * from suplier";
		try {
			 ps =  con.prepareStatement(sql);
			 rs =  ps.executeQuery();
			 Supplier s = null;
			while( rs.next()){
				s=new Supplier();
				s.setSupId( rs.getInt("sup_id"));
				s.setSupName( rs.getString("sup_name"));
				sup.add(s);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			 shutdown( con, ps, rs);
		}
		return sup;
	}
}
