package entity;

import java.util.Date;

/*
 * ����billʵ����
 */
public class Bill {
	private int billId;//�˵����
	private String billName;//��Ʒ����
	private int billNumber;//��Ʒ����
	private int billMoney;//���׽��
	private int billIspay;//�Ƿ񸶿�
	private int billSuplier;//��Ӧ������
	private String billShopping;//��Ʒ����
	private Date billTime;//�˵�ʱ��
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
