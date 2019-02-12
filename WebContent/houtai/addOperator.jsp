<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加操作人</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function selP(){
	$.post("addOperator_province.do",{},function(provinces){
		var province = eval("("+provinces+")");//得到数组类型的值
		
		//alert(province.name)
		for(var i = 0 ; i<province.length;i++){
			
			var code = province[i].provinceid;//这里的属性要和modle的保持一致
			var proname = province[i].province;
			//alert(proname);
			var newOption = document.createElement("option");
			newOption.innerHTML=proname;
			newOption.value=code;
			
			$("#pro").append(newOption);
		}
	});
}
function partCity(){
	//alert("4568");
	var pro = $("#pro");
	var city = $("#shi");
	
	//先清空city下的option
	$("#shi").empty();
	$.post("addOperator_city.do",{pcode:$("#pro").val()},function(citys){
		var city = eval("("+citys+")");//得到数组类型的值
		for(var i = 0 ; i<city.length;i++){
			var cityname = city[i].city;
			var newOption = document.createElement("option");
			newOption.innerHTML=cityname;
			
			$("#shi").append(newOption);
		}
		
	});
}
function age(){
	var z=/^\+?[1-9][0-9]*$/;
	if(!z.test($("#oAge").val())){//不是数字
		alert("年龄必须为整数！");
		$("#oAge").val("");
		$("#oAge").focus();
		return false;
	};
	return true;
}
function phone(){
	var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;   
	var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	 if(!isMobile.test($("#oPhone").val()) && !isPhone.test($("#oPhone").val())){
	            alert("请正确填写电话号码");
	            $("#oPhone").focus();
	            return false;
	        }
	 return true;
}

function mmnk(){
	if(""==$("#oPassword").val()){
		alert("请先输入密码");
		$("#oPassword").focus();
	       return false;
	}
	return true;
}

//确认密码和确认密码保持一致
function conpw(){
	var mm = $("#oPassword").val();
	var cmm = $("#confirmPw").val();
	if(""==cmm && mm!=""){
		alert("确认密码不能为空！");
		$("#confirmPw").focus();
	       return false;
	}else if(mm!=cmm){
		alert("确认密码和密码不一致，请确认后重新输入！");
		$("#confirmPw").val("");
		$("#confirmPw").focus();
	       return false;
	}
	return true;
}

function kong(){
	for (var i=0;i<11;i++)
	{
		if(document.addoperatorform.elements[i].value=="")  
        {  
           alert("输入不能有空项");  
           document.addoperatorform.elements[i].focus();
           //alert(2);
           return false;  
        }
	} 
	return true;
}

function jiaoyan(){
	if ($("#oName").val() == '') {
	       alert("用户名不能为空");
	       $("#oName").focus();
	       return false;
	}else if ($("#oAge").val() == '') {
	       alert("年龄不能为空");
	       $("#oAge").focus();
	       return false;
	}else if(""==$("#oPassword").val()){
		alert("密码不能为空");
		$("#oPassword").focus();
	       return false;
	}else if(""==$("#confirmPw").val()){
		alert("确认密码不能为空");
		$("#confirmPw").focus();
	       return false;
	}else if ($("#pro").val() == '' || $("#pro").val() == "请选择省份") {
	       alert("省份不能为空");
	       return false;
	}else if($("#shi").val() == '' || $("#shi").val() == "请选择城市"){
		   alert("城市不能为空");
	       return false;
	}else if(""==$("#street").val()){
		alert("街道不能为空");
		$("#street").focus();
	       return false;
	}else{
		if(phone()){
			$("#oAddress").val($("#pro option:selected").text()+$("#shi").val()+$("#street").val());
			//alert($("#oAddress").val());
		}else{
			return false;
		}
	}
	
	
}


</script>
</head>
<body onload="selP()">
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
<div>
<form name="addoperatorform" action="addOperator.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return jiaoyan()">
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">操作人信息录入</div>
          <div style="margin-left: 40%;margin-top: 20px;">
            姓  &nbsp;&nbsp;&nbsp;&nbsp; 名  ：<input name="oName" id="oName" type="text" maxlength="20" title="长度不超过20"/></div> 
          <div style="margin-left: 40%;margin-top: 20px;"> 
          年  &nbsp;&nbsp;&nbsp;&nbsp; 龄  ：<input name="oAge" id="oAge" type="text" maxlength="5" title="年龄必须为整数" onkeyup="age()"/></div>
          <div style="margin-left: 40%;margin-top: 20px;">
           性  &nbsp;&nbsp;&nbsp;&nbsp; 别  ：<input name="oSex" type="radio" value="男" checked/>男
                                  <input name="oSex" type="radio" value="女"/>女</div>
          <div style="margin-left: 40%;margin-top: 20px;"> 
          密  &nbsp;&nbsp;&nbsp;&nbsp; 码  ：<input name="oPassword" id="oPassword" type="password" maxlength="20" title="长度不超过20"/></div>
          <div style="margin-left: 40%;margin-top: 20px;">
           确认密码：<input name="confirmPw" id="confirmPw" type="password" maxlength="20" title="请再输入一次密码" onblur="conpw()" onfocus="mmnk()"/></div>    
          <div style="margin-left: 40%;margin-top: 20px;">
           地  &nbsp;&nbsp;&nbsp;&nbsp; 址  ：
   <select id="pro" onchange="partCity()" style="width:100px ;"><!-- 省份 -->
      <option>请选择省份</option>
    </select>
    <select id="shi" style="width:100px ;"><!-- 城市 -->
      <option>请选择城市</option>
   </select>  <input name="street" id="street" type="text" maxlength="20" title="街道信息，长度不超过20">   </div>
        
         <div style="margin-left: 40%;margin-top: 20px;">  
         电话号码：<input name="oPhone" id="oPhone" type="text" maxlength="11" title="请输入标准的电话号码格式" onblur="phone()"/></div>
         <div style="margin-left: 40%;margin-top: 20px;"> 
         权  &nbsp;&nbsp;&nbsp;&nbsp; 限  ：<select name="oRight" id="oRight">
            <option value="1">普通操作员</option>
            <option value="2">管理员</option>
            <option value="3">巡查员</option>
         </select></div>
         <div style="margin-left: 40%;margin-top: 20px;"> 
         归属部门  ：<select name="oBuMen" id="oBuMen">
            <option>管理部</option>
            <option>联络部</option>
            <option>巡查部</option>
            <option>活动部</option>
            <option>组织部</option>
            <option>监督处</option>
            
         </select></div>
         
         <div style="margin-left: 600px;margin-top: 20px;">
         <input id="submit" type="submit" value="添加"/> 
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <input id="reset" type="reset" value="重置" />
         </div>
         
     <input name="oAddress" id="oAddress" type="hidden" maxlength="30" title="地址内容长度不超过30"/>     
</form>
</div>
<%} %>
</body>
</html>