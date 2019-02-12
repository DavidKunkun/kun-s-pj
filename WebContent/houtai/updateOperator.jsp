<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改操作人信息</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">

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
	}else if(!phone()){
			return false;
		
	}
	
	
}
$(document).ready(function(){
	if("${operator.oSex }"=="男"){
		$("#nan").attr('checked','checked');
	}else{
		$("#nv").attr('checked','checked');
	}
	$("#oRight").val("${operator.oRight }");
	
	$("#oBuMen").val("${operator.oBuMen }");
	
	$("#fanhui").click(function(){
		window.location.href="selOperatorByPage.do";
	});
});

</script>
</head>
<body><!-- onload="selP()" -->
<div>
<form name="updateoperatorform" action="updateOperator.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return jiaoyan()">
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">修改工号为  ${operator.oId } 的操作人信息</div>
          <div style="margin-left: 40%;margin-top: 20px;">
          <input name="oId" type="hidden" value="${operator.oId }">
            姓  &nbsp;&nbsp;&nbsp;&nbsp; 名  ：<input name="oName" id="oName" type="text" maxlength="20" title="长度不超过20" value="${operator.oName }"/></div> 
          <div style="margin-left: 40%;margin-top: 20px;"> 
          年  &nbsp;&nbsp;&nbsp;&nbsp; 龄  ：<input name="oAge" id="oAge" type="text" maxlength="5" title="年龄必须为整数" onkeyup="age()" value="${operator.oAge }"/></div>
          <div style="margin-left: 40%;margin-top: 20px;">
           性  &nbsp;&nbsp;&nbsp;&nbsp; 别  ：<input name="oSex" id="nan" type="radio" value="男" />男
                                  <input name="oSex" id="nv" type="radio" value="女"/>女</div>
          <div style="margin-left: 40%;margin-top: 20px;"> 
          密  &nbsp;&nbsp;&nbsp;&nbsp; 码  ：<input name="oPassword" id="oPassword" type="password" maxlength="20" title="长度不超过20" value="${operator.oPassword }"/></div>
          <div style="margin-left: 40%;margin-top: 20px;">
           确认密码：<input name="confirmPw" id="confirmPw" type="password" maxlength="20" title="请再输入一次密码" onblur="conpw()" onfocus="mmnk()" value="${operator.oPassword }"/></div>    
          <div style="margin-left: 40%;margin-top: 20px;">
           地  &nbsp;&nbsp;&nbsp;&nbsp; 址  ：
   <input name="oAddress" id="oAddress" type="text" maxlength="30" title="地址内容长度不超过30" size="50" value="${operator.oAddress }"/>        </div>
        
         <div style="margin-left: 40%;margin-top: 20px;">  
         电话号码：<input name="oPhone" id="oPhone" type="text" maxlength="11" title="请输入标准的电话号码格式" onblur="phone()" value="${operator.oPhone }"/></div>
         <div style="margin-left: 40%;margin-top: 20px;"> 
          职  &nbsp;&nbsp;&nbsp;&nbsp; 位  ：<select name="oRight" id="oRight" style="width:150px">
            <option value="1">1-普通操作员</option>
            <option value="2">2-管理员</option>
            <option value="3">3-巡查员</option>
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
         <input type="button" value="返回" id="fanhui" name="fanhui"/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         
         <input id="submit" type="submit" value="修改"/> 
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <input id="reset" type="reset" value="重置" />
         </div>
         
     
</form>
</div>
</body>
</html>