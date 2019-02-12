<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新商户信息</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">

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
	}
	
	if(!isMobile.test($("#sPhone").val()) && !isPhone.test($("#sPhone").val())){
        alert("请正确填写电话号码");
        $("#sPhone").focus();
        return false;
    }
	
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

$(document).ready(function(){
	
	
	$("#sZhuangTai").val("${store.sZhuangTai }");
	
	var sjynrs = "${store.sJingYingNeiRong }".split(",");
	for(var i=0;i<sjynrs.length;i++){
		$("input[value='"+sjynrs[i]+"']").attr("checked","checked");
	}
	
	
	$("#fanhui").click(function(){
		window.location.href="selStoreByPage.do";
	});
}); 
</script>
</head>
<body>
<div>

   <!-- 第一层，添加公司信息的标题 -->
   <div style="margin-left: 35%;font-size: 4;font-weight: bold;">修改${store.sId }号商户信息</div>
   <div style="margin-left: 10%;margin-top: 20px;">
     <form name="updatestoreform" action="updateStore.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return judge()">
       <input type="hidden" id="sId" name="sId" maxlength="20" title="长度不超过20" value="${store.sId }"/>
     
   <!-- 第二层，添加公司信息的表格信息 -->
   <div align="center" style="height:350px;">
      <table border="0px" style="border-collapse: collapse;height:100%;">
       <tbody>
        <tr>
             <td><font color="red">*</font>商户名称：</td>
             <td><input id="sName" name="sName" maxlength="20" title="长度不超过20" value="${store.sName }"/></td>
         </tr>
         <tr>
             <td><font color="red">*</font>法人代表：</td>
             <td><input id="sEntity" name="sEntity" maxlength="20" title="长度不超过10" value="${store.sEntity }"/></td>
         </tr>
         <tr>
             <td><font color="red">*</font>电话 ：</td>
             <td><input id="sPhone" name="sPhone" maxlength="12" title="请输入标准格式的电话号码或着座机号码" value="${store.sPhone }"/></td>
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
             <td><input name="sAddress" id="sAddress" type="text" value="${store.sAddress }" title="长度不超过20"/></td>
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
                    <td><input type="checkbox" name="JingYingNeiRong" value="32"/>食品添加剂</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="32"/>食品添加剂</td>
                    <td><input type="checkbox" name="JingYingNeiRong" value="32"/>食品添加剂</td>
                 </tr>
               </tbody>
              </table>
              
           </td>
         </tr>
         
       </tbody>
      </table>
   </div>
   <!-- 第三层，提交表单信息按钮-->
   <div style="margin-left: 50%;margin-top: 20px;">
   <input type="hidden" name="sJingYingNeiRong" id="sJingYingNeiRong" value="${store.sJingYingNeiRong }"/>
         <input type="button" value="返回" id="fanhui" name="fanhui"/>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         
         <input id="submit" type="submit" value="确认修改"/> 
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <input id="reset" type="reset" value="重置" />
         </div>
   </form>
   </div>
</div>
</body>
</html>