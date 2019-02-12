<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加食品公司的信息</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function selP(){
	$.post("addOperator_province.do",{},function(provinces){
		var province = eval("("+provinces+")");//得到数组类型的值
		for(var i = 0 ; i<province.length;i++){
			var code = province[i].provinceid;
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
	
	$("#cAddress").val($("#pro option:selected").text()+$("#shi").val()+$("#street").val()); 
	
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
<body onload="selP()">
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
  <div>
   <!-- 第一层，添加公司信息的标题 -->
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">食品公司的信息录入</div>
   <div style="margin-left: 10%;margin-top: 20px;"><!-- onsubmit="return judge()" -->
     <form name="addcompanyform" action="addCompany.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return judge()">
   <!-- 第二层，添加公司信息的表格信息 -->
   <div align="center" style="height:350px;">
      <table border="1px" style="border-collapse: collapse;height:100%;">
         <tr>
             <td><font color="red">*</font>公司名称：</td>
             <td><input id="cName" name="cName" maxlength="20" title="长度不超过20"/></td>
             <td><font color="red">*</font>公司法人代表：</td>
             <td><input id="cEntity" name="cEntity" maxlength="20" title="长度不超过20"/></td>
             <td><font color="red">*</font>公司经营状态：</td>
             <td><select id="cZhuangtai" name="cZhuangtai" style="width:100px;">
                     <option>营业</option>
                     <option>停业</option>
                     <option>关闭</option>
                     <option>其他</option>
                 </select>
             </td>
         </tr>
         <tr>
             <td><font color="red">*</font>公司电话 ：</td>
             <td><input id="cPhone" name="cPhone" maxlength="12" title="请输入标准格式的电话号码或着座机号码"/></td>
             <td>公司注册资金(万)：</td>
             <td><input id="cZhuCeMoney" name="cZhuCeMoney" maxlength="20" title="输入必须是数字"/></td>
             <td><font color="red">*</font>公司创立时间：</td>
             <td><input id="cChuangLiTime" name="cChuangLiTime" maxlength="10" title="请输入标准的日期格式（2018-02-20）"/></td>
         </tr>
         <tr>
             <td>公司地址：</td>
             <td colspan="3"><select id="pro" onchange="partCity()" style="width:100px ;"><!-- 省份 -->
                       <option value="">请选择省份</option>
                 </select>
                 <select id="shi" style="width:100px ;"><!-- 城市 -->
                       <option value="">请选择城市</option>
                 </select>  
                 <input name="street" id="street" type="text" maxlength="20" title="街道信息，长度不超过20">
             <input name="cAddress" id="cAddress" type="hidden" />
             </td>
             
             <td>公司人数 ：</td>
             <td><input id="cPeople" name="cPeople" maxlength="20" title="长度不超过20"/></td>
         </tr>
         <tr>
             <td><font color="red">*</font>公司主要产品 ：</td>
             <td colspan="3"><input id="cMainChanPin" name="cMainChanPin" size="60" maxlength="20" title="" /></td>
          
             <td><font color="red">*</font>公司主要经营方式 ：</td>
             <td><select id="cIndustry" name="cIndustry">
                     <option>批发</option>
                     <option>零售</option>
                     <option>批发兼零售</option>
                 </select>
             </td>
         </tr>
      </table>
   </div>
   <!-- 第三层，提交表单信息按钮-->
   <div style="margin-left: 50%;margin-top: 20px;">
         <input id="submit" type="submit" value="添加"/> 
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <input id="reset" type="reset" value="重置" />
         </div>
   </form>
   </div>
</div>
  <%} %>
</body>
</html>