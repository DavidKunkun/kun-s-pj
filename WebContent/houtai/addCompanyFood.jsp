<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请食品经营许可证</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">

function judge(){
    var isMobile=/^(?:13\d|15\d|18\d)\d{5}(\d{3}|\*{3})$/;   
    //座机带区号  区号+电话号码 如0901-1234567,0901-12345678,010-1234567,010-12345678;	
	var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
	/*phone = /^0\d{2,3}-?\d{7,8}$/; 020-12345678 */
	if($("#cName").val()=="" || $("#cName").val()==null){
		alert("公司名称不能为空！");
		$("#cName").focus();
		return false;
	}else if($("#cEntity").val()=="" || $("#cEntity").val()==null){
		alert("法人代表不能为空！");
		$("#cEntity").focus();
		return false;
	}else if($("#cZhuangtai").val()=="" || $("#cZhuangtai").val()==null){
		alert("公司经营状态不能为空！");
		$("#cZhuangtai").focus();
		return false;
	}else if($("#cPhone").val()=="" || $("#cPhone").val()==null){
		alert("电话不能为空！");
		$("#cPhone").focus();
		return false;
	}if($("#cMainChanPin").val()=="" || $("#cMainChanPin").val()==null){
		alert("主要经营产品不能为空！");
		$("#cMainChanPin").focus();
		return false;
	}else if(!isMobile.test($("#cPhone").val()) && !isPhone.test($("#cPhone").val())){
        alert("请正确填写电话号码");
        $("#cPhone").focus();
        return false;
    }
	if(!$("#cPeople").val()==""){
		var z=/^\+?[1-9][0-9]*$/;
		if(!z.test($("#cPeople").val())){
			alert("人数必须为整数");
			$("#cPeople").focus();
			return false;
		}
	}else{
		$("#cPeople").val("0");
	}
	if(!$("#cZhuCeMoney").val()==""){
		if(isNaN($("#cZhuCeMoney").val())){
			alert("资金必须为数字");
			$("#cZhuCeMoney").focus();
			return false;
		}
	}
	
	if(!$("#cChuangLiTime").val()==""){
		/*判断是否是日期 yyyy-mm-dd  */
		var regex = /^\d{4}\-\d{2}\-\d{2}$/; /*  /^(19|20)\d{2}((0\d{1})|10|11|12)$/ */
		if(!regex.test($("#cChuangLiTime").val())){
			alert("请输入标准的日期格式！");
			$("#cChuangLiTime").focus();
	       return false;
	   }else{
	   	var myDate = new Date();//获取系统当前时间
	   	var now = myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
	   	var btime = new Date($("#cChuangLiTime").val());
	   	/* alert(Date.parse(btime));
	   	alert(Date.parse(now)); */
	   	if(Date.parse(btime) > Date.parse(now)){
	   		alert("您输入的日期已超过当前时间，请确认后重新输入！");
	   		$("#cChuangLiTime").focus();
	   		return false;
	   	}
	   }
	}else{
		alert("创立时间不能为空");
		$("#cChuangLiTime").focus();
   		return false;
	}
	
	if ($("#pro").val()=="") {
		$("#pro option:selected").text("");
		
	}
	
	
	
	return true;
}

/* $(document).ready(function(){
	selP();
	$("#tijiao").click(function(){
		if(judge()){
			if ($("#pro").val()=="") {
				$("#pro option:selected").text("");
				
			}
			$("#cAddress").val($("#pro option:selected").text()+$("#shi").val()+$("#street").val());
			
			alert($("#cAddress").val());
			alert($(document).form);
			alert($(document).addcompanyform);
			$(document).addcompanyform.submit();
		}
		
	});
	
});  */
</script>
</head>
<body> 
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
<div>
<form name="addoperatorform" action="addOperator.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return jiaoyan()">
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">申请食品经营许可证</div>
          <div style="margin-left: 40%;margin-top: 20px;">
            公司编号 ：<input name="cId" id="cId" type="text" maxlength="20" title="必须是本系统给出的公司编号"/></div> 
          <div style="margin-left: 40%;margin-top: 20px;"> 
           经营内容(食品名称)：<input name="fName" id="fName" type="text" maxlength="20" title="长度不超过20"/>
          </div>
          <div style="margin-left: 40%;margin-top: 20px;"> 
          包装方式：<select name="cfBaoZhuang" id="cfNumber"> 
              <option>散装</option>
              <option>袋装</option>
          </select>
          </div>
          <div style="margin-left: 40%;margin-top: 20px;"> 
           食品类型：<input name="cfNumber" id="cfNumber" type="text" maxlength="20" title="必须是数字"/> 
          </div>
          <div style="margin-left: 40%;margin-top: 20px;"> 
           生产数量：<input name="cfNumber" id="cfNumber" type="text" maxlength="20" title="必须是数字"/> 
          </div>
          
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