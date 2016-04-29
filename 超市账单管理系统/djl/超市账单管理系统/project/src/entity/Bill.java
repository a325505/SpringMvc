package entity;

import java.util.Date;

/*
 * 创建bill实体类
 */
public class Bill {
	private int billId;//账单编号
	private String billName;//商品名称
	private int billNumber;//商品数量
	private int billMoney;//交易金额
	private int billIspay;//是否付款
	private int billSuplier;//供应商名称
	private String billShopping;//商品描述
	private Date billTime;//账单时间
	public int getBillId() {
		return billId;
	}
	public void setBillId(int billId) {
		this.billId = billId;
	}
	public String getBillName() {
		return billName;
	}
	public void setBillName(String billName) {
		this.billName = billName;
	}
	public int getBillNumber() {
		return billNumber;
	}
	public void setBillNumber(int billNumber) {
		this.billNumber = billNumber;
	}
	public int getBillMoney() {
		return billMoney;
	}
	public void setBillMoney(int billMoney) {
		this.billMoney = billMoney;
	}
	public int getBillIspay() {
		return billIspay;
	}
	public void setBillIspay(int billIspay) {
		this.billIspay = billIspay;
	}
	public int getBillSuplier() {
		return billSuplier;
	}
	public void setBillSuplier(int billSuplier) {
		this.billSuplier = billSuplier;
	}
	public String getBillShopping() {
		return billShopping;
	}
	public void setBillShopping(String billShopping) {
		this.billShopping = billShopping;
	}
	public Date getBillTime() {
		return billTime;
	}
	public void setBillTime(Date billTime) {
		this.billTime = billTime;
	}

}
