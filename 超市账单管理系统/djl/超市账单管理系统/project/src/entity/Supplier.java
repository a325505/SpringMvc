package entity;
/**
 * 创建供应商实体类
 * */
public class Supplier {
	private int supId;//供应商编号
	private String supName;//供应商名称
	private String supMiaoshu;//供应商描述
	private String supTelname;//供应商的联系人
	private int supTel;//供应商电话
	private String supAddr;//供应商地址
	public int getSupId() {
		return supId;
	}
	public void setSupId(int supId) {
		this.supId = supId;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getSupMiaoshu() {
		return supMiaoshu;
	}
	public void setSupMiaoshu(String supMiaoshu) {
		this.supMiaoshu = supMiaoshu;
	}
	public String getSupTelname() {
		return supTelname;
	}
	public void setSupTelname(String supTelname) {
		this.supTelname = supTelname;
	}
	public int getSupTel() {
		return supTel;
	}
	public void setSupTel(int supTel) {
		this.supTel = supTel;
	}
	public String getSupAddr() {
		return supAddr;
	}
	public void setSupAddr(String supAddr) {
		this.supAddr = supAddr;
	}
	
}
