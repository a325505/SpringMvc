/*
	退出超市管理系统操作
*/
function exit_confirm()
{
var r=confirm("确定要退出吗？");
if (r==true)  
	{
		window.parent.location="login.jsp";
	//window.parent.close();
	}
}
/*验证用户名称*/
function usersname(){
	var user_name = document.getElementById("username").value;
	if(user_name==null||user_name==""){
		document.getElementById("yhmc").innerHTML="用户名不能为空!";
		return false;
	}else {
		document.getElementById("yhmc").innerHTML="<img src='images/icon.png' />";
		return true;
	}
}
/*判断密码*/
function userpassword(){
	var user_password = document.getElementById("password").value;
	if(user_password==null||user_password==""){
		document.getElementById("yhmm").innerHTML="密码不能为空！";
		return false;
	}else {
		document.getElementById("yhmm").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}

/*再次判断密码*/
function userpassword1(){
	var user_password = document.getElementById("password").value;
	var user_password1 = document.getElementById("password1").value;
	if(user_password1==null||user_password1==""){
		document.getElementById("yhmm1").innerHTML="密码不能为空！";
		return false;
	}else if(user_password != user_password1){
		document.getElementById("yhmm1").innerHTML="密码不一致！";
		return false;
	}else {
		document.getElementById("yhmm1").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}

/*年龄*/
function userage(){
	var user_age = document.getElementById("age").value;
    var reg =/^200$|^((1[0-1]|[1-9])?\d)$/;
	if(reg.test(user_age)){
    document.getElementById("yhnl").innerHTML="<img src='images/icon.png' />";
      return true;
    }else{
    document.getElementById("yhnl").innerHTML="您输入的年龄不符合要求！不能超过200岁！";
    return false;
    }
}

/*电话*/
function usermobile(){                                                                                                
	var user_mobile=document.getElementById("mobile").value;
	 var reg = /\d/;
	if(reg.test(user_mobile)){
    document.getElementById("yhdh").innerHTML="<img src='images/icon.png' />";
    return true;
    }else{
    document.getElementById("yhdh").innerHTML="您输入的电话号不符合要求！";
    return false;
    }  
}
function checkuser(){
	if(username()&&userpassword()&&userpassword1()&&userage()&&usermobile()){
		return true;
	}else {
		return false;
	}
}
/*删除对应id用户的操作*/
function deleteuser(){
	var id = document.getElementById("userId").value;
	location.href="UserDelete?userId="+id;
}


/*
	添加供应商操作
*/
function supNames(){
	var sup_name = document.getElementById("supName").value;
	if(sup_name==null||sup_name==""){
		document.getElementById("gysmc").innerHTML="用户名不能为空!";
		return false;
	}else {
		document.getElementById("gysmc").innerHTML="<img src='images/icon.png' />";
		return true;
	}
}
/*删除对应id供应商的操作*/
function deletesupplier(){
	var id = document.getElementById("supId").value;
	location.href="SupplierDelete?supId="+id;
}
/*
	删除对应id账单的操作
*/
function deletebill(){
	var id = document.getElementById("billId").value;
	location.href="BillDelete?bId="+id;
}
/*
	添加账单操作页面
*/
//验证账单编号
function billId(){
	var bill_Id = document.getElementById("billId").value;
	if(bill_Id==null||bill_Id==""){
		document.getElementById("zdbh").innerHTML="账单编号不能为空！";
		return false;
	}else {
		document.getElementById("zdbh").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}
/*
	修改用户密码
*/
function xiugaipassword(){
	var userId = document.getElementById("userId").value;
	var userPassword = document.getElementById("userPassword").value;
	location.href="xiugaipassword.jsp?userId="+userId+"&userPassword="+userPassword;
}
/*
	验证交易金额
*/
function bill_Money(){
	var bill_money=document.getElementById("bill_Money3").value;
	 var reg = /\d/;
	if(reg.test(bill_money)){
    document.getElementById("jyje").innerHTML="<img src='images/icon.png' />";
    return true;
    }else{
    document.getElementById("jyje").innerHTML="您输入的金额不符合要求！";
    return false;
    }  
}
/*
	验证商品数量
*/
function billNumber1(){
	var bill_number=document.getElementById("billNumber4").value;
	 var reg = /\d/;
	if(reg.test(bill_number)){
    document.getElementById("spsl").innerHTML="<img src='images/icon.png' />";
    return true;
    }else{
    document.getElementById("spsl").innerHTML="您输入的商品数量不符合要求！";
    return false;
    }  
}

function bill(){
	if(bill_Money() && billNumber1() ){
		return true;
	}
	return false;
}
/*判断设置的新密码*/
function setpassword1(){
	var set_password = document.getElementById("setPassword").value;
	if(set_password==null||set_password==""){
		document.getElementById("szmm").innerHTML="密码不能为空！";
		return false;
	}else {
		document.getElementById("szmm").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}
/*重新判断设置的密码*/
function setpassword2(){
	var set_password1 = document.getElementById("setPassword1").value;
	if(set_password1==null||set_password1==""){
		document.getElementById("szmm1").innerHTML="密码不能为空！";
		return false;
	}else {
		document.getElementById("szmm1").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}
function szpassword(){
	if(setpassword1() && setpassword2() ){
		return true;
	}
	return false;
}