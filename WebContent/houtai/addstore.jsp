<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商户信息</title>
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
	if($("#sName").val()=="" || $("#sName").val()==null){
		alert("商户名称不能为空！");
		$("#sName").focus();
		return false;
	}else if($("#sEntity").val()=="" || $("#sEntity").val()==null){
		alert("法人代表不能为空！");
		$("#sEntity").focus();
		return false;
	}else if($("#sPhone").val()=="" || $("#sPhone").val()==null){
		alert("电话不能为空！");
		$("#sPhone").focus();
		return false;
	}else if ($("#pro").val()=="") {
		alert("省份不能为空！");
		$("#pro").focus();
		return false;
	}else if ($("#shi").val()=="") {
		alert("城市不能为空！");
		$("#shi").focus();
		return false;
	}else if ($("#street").val()=="") {
		alert("街道信息不能为空！");
		$("#street").focus();
		return false;
	}
	
	/* $.post("selAllsName.do",{},function(info){
		if(!info==0){//如果名字存在，换名字
			alert("该名称已存在，请更改商户名称");
		    return false;
		}
	}); */
	
	if(!isMobile.test($("#sPhone").val()) && !isPhone.test($("#sPhone").val())){
        alert("请正确填写电话号码");
        $("#sPhone").focus();
        return false;
    }
	
	$("#sAddress").val($("#pro option:selected").text()+$("#shi").val()+$("#street").val()); 
	
	//处理经营许可的复选框问题
	var str="";
	$("input:[name='JingYingNeiRong'][checked]").each(function(){
	   str+=$(this).val()+",";
	});
	//alert(str); 
	if(str==""){
		alert("经营许可不能为空！");
		return false;
	}else{
		$("#sJingYingNeiRong").val(str);
	}
	//alert($("#sJingYingNeiRong").val());
	return true;
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

   <!-- 第一层，添加公司信息的标题 -->
   <div style="margin-left: 35%;font-size: 4;font-weight: bold;">商户的信息录入</div>
   <div style="margin-left: 10%;margin-top: 20px;">
     <form name="addstoreform" action="addStore.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return judge()">
   <!-- 第二层，添加公司信息的表格信息 -->
   <div align="center" style="height:350px;">
      <table border="0px" style="border-collapse: collapse;height:100%;">
       <tbody>
        <tr>
             <td><font color="red">*</font>商户名称：</td>
             <td><input id="sName" name="sName" maxlength="20" title="长度不超过20"/></td>
         </tr>
         <tr>
             <td><font color="red">*</font>法人代表：</td>
             <td><input id="sEntity" name="sEntity" maxlength="20" title="长度不超过10"/></td>
         </tr>
         <tr>
             <td><font color="red">*</font>电话 ：</td>
             <td><input id="sPhone" name="sPhone" maxlength="12" title="请输入标准格式的电话号码或着座机号码"/></td>
         </tr>
         <tr>
             <td><font color="red">*</font>经营状态 ：</td>
             <td>
                <select id="sZhuangTai" name="sZhuangTai" style="width:100px;">
                     <option>营业</option>
                     <option>停业</option>
                     <option>关闭</option>
                     <option>其他</option>
                 </select>
             </td>
         </tr>
         <tr>
             <td><font color="red">*</font>公司地址：</td>
             <td colspan="3"><select id="pro" onchange="partCity()" style="width:100px ;"><!-- 省份 -->
                       <option value="">请选择省份</option>
                 </select>
                 <select id="shi" style="width:100px ;"><!-- 城市 -->
                       <option value="">请选择城市</option>
                 </select>  
                 <input name="street" id="street" type="text" maxlength="20" title="街道信息，长度不超过20">
             <input name="sAddress" id="sAddress" type="hidden" />
             </td>
         </tr>
         <tr>
           <td><font color="red">*</font>经营许可：</td>
           <td rowspan="4">
              <table border="0" style="border:1px solid #000000;" cellpadding="0"cellspacing="1">
               <tbody>
                 <tr>
                    <td><input type="checkbox" name="JingYingNeiRong" value="01"/>粮食加工品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="02"/>食用油</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="03"/>调味品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="04"/>肉制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="05"/>乳制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="06"/>饮料</td>
                 </tr>
                 <tr>   
                    <td><input type="checkbox" name="JingYingNeiRong" value="07"/>方便食品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="08"/>饼干</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="09"/>罐头</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="10"/>冷冻饮品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="11"/>速冻食品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="12"/>薯类和膨化食品</td>
                 </tr>
                 <tr>  
                    <td><input type="checkbox" name="JingYingNeiRong" value="13"/>糖果制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="14"/>茶叶及相关制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="15"/>酒类</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="16"/>蔬菜制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="17"/>水果制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="18"/>炒货食品及坚果制品</td>
                 </tr>
                 <tr>
                    <td><input type="checkbox" name="JingYingNeiRong" value="19"/>蛋制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="20"/>可可及焙烤咖啡产品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="21"/>食糖</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="22"/>水产制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="23"/>淀粉及淀粉制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="24"/>糕点</td>
                 </tr>
                 <tr>
                    <td><input type="checkbox" name="JingYingNeiRong" value="25"/>豆制品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="26"/>蜂产品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="27"/>保健食品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="28"/>特殊医学用途配方食品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="29"/>婴幼儿配方食品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="30"/>特殊膳食食品</td>
                 </tr>
                 <tr>
                    <td><input type="checkbox" name="JingYingNeiRong" value="31"/>其他食品</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="32"/>食品添加剂</td>
                 </tr>
               </tbody>
              </table>
              <input type="hidden" name="sJingYingNeiRong" id="sJingYingNeiRong"/>
           </td>
         </tr>
         
       </tbody>
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