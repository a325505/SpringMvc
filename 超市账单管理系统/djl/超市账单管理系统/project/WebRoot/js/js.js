/*
	�˳����й���ϵͳ����
*/
function exit_confirm()
{
var r=confirm("ȷ��Ҫ�˳���");
if (r==true)  
	{
		window.parent.location="login.jsp";
	//window.parent.close();
	}
}
/*��֤�û�����*/
function usersname(){
	var user_name = document.getElementById("username").value;
	if(user_name==null||user_name==""){
		document.getElementById("yhmc").innerHTML="�û�������Ϊ��!";
		return false;
	}else {
		document.getElementById("yhmc").innerHTML="<img src='images/icon.png' />";
		return true;
	}
}
/*�ж�����*/
function userpassword(){
	var user_password = document.getElementById("password").value;
	if(user_password==null||user_password==""){
		document.getElementById("yhmm").innerHTML="���벻��Ϊ�գ�";
		return false;
	}else {
		document.getElementById("yhmm").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}

/*�ٴ��ж�����*/
function userpassword1(){
	var user_password = document.getElementById("password").value;
	var user_password1 = document.getElementById("password1").value;
	if(user_password1==null||user_password1==""){
		document.getElementById("yhmm1").innerHTML="���벻��Ϊ�գ�";
		return false;
	}else if(user_password != user_password1){
		document.getElementById("yhmm1").innerHTML="���벻һ�£�";
		return false;
	}else {
		document.getElementById("yhmm1").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}

/*����*/
function userage(){
	var user_age = document.getElementById("age").value;
    var reg =/^200$|^((1[0-1]|[1-9])?\d)$/;
	if(reg.test(user_age)){
    document.getElementById("yhnl").innerHTML="<img src='images/icon.png' />";
      return true;
    }else{
    document.getElementById("yhnl").innerHTML="����������䲻����Ҫ�󣡲��ܳ���200�꣡";
    return false;
    }
}

/*�绰*/
function usermobile(){                                                                                                
	var user_mobile=document.getElementById("mobile").value;
	 var reg = /\d/;
	if(reg.test(user_mobile)){
    document.getElementById("yhdh").innerHTML="<img src='images/icon.png' />";
    return true;
    }else{
    document.getElementById("yhdh").innerHTML="������ĵ绰�Ų�����Ҫ��";
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
/*ɾ����Ӧid�û��Ĳ���*/
function deleteuser(){
	var id = document.getElementById("userId").value;
	location.href="UserDelete?userId="+id;
}


/*
	��ӹ�Ӧ�̲���
*/
function supNames(){
	var sup_name = document.getElementById("supName").value;
	if(sup_name==null||sup_name==""){
		document.getElementById("gysmc").innerHTML="�û�������Ϊ��!";
		return false;
	}else {
		document.getElementById("gysmc").innerHTML="<img src='images/icon.png' />";
		return true;
	}
}
/*ɾ����Ӧid��Ӧ�̵Ĳ���*/
function deletesupplier(){
	var id = document.getElementById("supId").value;
	location.href="SupplierDelete?supId="+id;
}
/*
	ɾ����Ӧid�˵��Ĳ���
*/
function deletebill(){
	var id = document.getElementById("billId").value;
	location.href="BillDelete?bId="+id;
}
/*
	����˵�����ҳ��
*/
//��֤�˵����
function billId(){
	var bill_Id = document.getElementById("billId").value;
	if(bill_Id==null||bill_Id==""){
		document.getElementById("zdbh").innerHTML="�˵���Ų���Ϊ�գ�";
		return false;
	}else {
		document.getElementById("zdbh").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}
/*
	�޸��û�����
*/
function xiugaipassword(){
	var userId = document.getElementById("userId").value;
	var userPassword = document.getElementById("userPassword").value;
	location.href="xiugaipassword.jsp?userId="+userId+"&userPassword="+userPassword;
}
/*
	��֤���׽��
*/
function bill_Money(){
	var bill_money=document.getElementById("bill_Money3").value;
	 var reg = /\d/;
	if(reg.test(bill_money)){
    document.getElementById("jyje").innerHTML="<img src='images/icon.png' />";
    return true;
    }else{
    document.getElementById("jyje").innerHTML="������Ľ�����Ҫ��";
    return false;
    }  
}
/*
	��֤��Ʒ����
*/
function billNumber1(){
	var bill_number=document.getElementById("billNumber4").value;
	 var reg = /\d/;
	if(reg.test(bill_number)){
    document.getElementById("spsl").innerHTML="<img src='images/icon.png' />";
    return true;
    }else{
    document.getElementById("spsl").innerHTML="���������Ʒ����������Ҫ��";
    return false;
    }  
}

function bill(){
	if(bill_Money() && billNumber1() ){
		return true;
	}
	return false;
}
/*�ж����õ�������*/
function setpassword1(){
	var set_password = document.getElementById("setPassword").value;
	if(set_password==null||set_password==""){
		document.getElementById("szmm").innerHTML="���벻��Ϊ�գ�";
		return false;
	}else {
		document.getElementById("szmm").innerHTML="<img src='images/icon.png' />";
		return true;	
	}
}
/*�����ж����õ�����*/
function setpassword2(){
	var set_password1 = document.getElementById("setPassword1").value;
	if(set_password1==null||set_password1==""){
		document.getElementById("szmm1").innerHTML="���벻��Ϊ�գ�";
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