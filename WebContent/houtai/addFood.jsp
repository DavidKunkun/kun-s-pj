<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kun.foodsafety.model.Loginor" %> 
<%Loginor loginor = (Loginor)session.getAttribute("loginor"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加食品基本信息</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function foodtype(){
	$.post("selAllFoodType.do",{},function(foodTypes){
		//alert("foodtype()");
		var foodType = eval("("+foodTypes+")");//得到数组类型的值
		//alert(foodType.length);
		for(var i = 0 ; i<foodType.length;i++){
			var code = foodType[i].ftId;
			var ftname = foodType[i].ftName;
			var ftmingxi = foodType[i].ftMingXi;
			//alert(code+ftname);
			//alert();
			var newOption = document.createElement("option");
			newOption.innerHTML=code+"-"+ftname+"("+ftmingxi+")";
			newOption.value=code;
			
			$("#fTypeId").append(newOption);
		}
	});
}

function companyowner(){
	$.post("selAllCompany.do",{},function(companys){
		var company = eval("("+companys+")");//得到数组类型的值
		for(var i = 0 ; i<company.length;i++){
			var code = company[i].cId;
			var cname = company[i].cName;
			//alert(cname);
			var newOption = document.createElement("option");
			newOption.innerHTML=code+"-"+cname;
			newOption.value=code;
			
			$("#fCompanyId").append(newOption);
		}
	});
}

function yuLan(file){
	var a = file.files[0];//得到上传的文件
	if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file.value)) {
		alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
		file.value="";
		document.getElementById("img").src="";
		return false;
	} 
	if(a.size>1024*1024*2){
		alert("您上传的照片大小为"+a.size/(1024*1024)+"M！请选择上传大小小于2M的图片");
		file.value="";
		return false;
	}else{
		var url = window.URL.createObjectURL(a);   
		//blob路径
		//alert(url);
		//$("#img").show();
		//$("#img").src=url;
		document.getElementById("img").src=url;
		document.getElementById("img").style.display="block";
	}
}

function jiaoyan(){
	
	if($("#fName").val()==""){
		alert("食品名称不能为空！");
		$("#fName").focus();
		return false;
	}else if($("#fTypeId").val()==""){
		alert("食品类别不能为空！");
		$("#fTypeId").focus();
		return false;
	}else if($("#fCompanyId").val()==""){
		alert("归属公司不能为空！");
		$("#fCompanyId").focus();
		return false;
	}
	
	/* if(!$("#fShengChanPiCiId")==""){
		//判断输入是否是整数，int型
		var z=/^\+?[1-9][0-9]*$/;
		if(!z.test($("#fShengChanPiCiId").val())){
			alert("食品生产许可证编号必须为整数");
			$("#fShengChanPiCiId").focus();
			return false;
		}
	}else{
		alert("食品生产许可证编号不能为空！");
		$("#fShengChanPiCiId").focus();
		return false;
	} */
	
	if(!$("#fBirthtime").val()==""){
		/*判断是否是日期 yyyy-mm-dd  */
		var regex = /^\d{4}\-\d{2}\-\d{2}$/; /*  /^(19|20)\d{2}((0\d{1})|10|11|12)$/ */
		if(!regex.test($("#fBirthtime").val())){
			alert("请输入标准的日期格式！");
			$("#fBirthtime").focus();
	       return false;
	   }else{
	   	var myDate = new Date();//获取系统当前时间
	   	var now = myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
	   	var btime = new Date($("#fBirthtime").val());
	   	/* alert(Date.parse(btime));
	   	alert(Date.parse(now)); */
	   	if(Date.parse(btime) > Date.parse(now)){
	   		alert("您输入的日期已超过当前日期，请确认后重新输入！");
	   		$("#cChuangLiTime").focus();
	   		return false;
	   	}
	   }
	}else{
		alert("生产日期不能为空");
		$("#fBirthtime").focus();
   		return false;
	}
	
	if(!$("#fEndtime").val()==""){
		/*判断是否是日期 yyyy-mm-dd  */
		var regex = /^\d{4}\-\d{2}\-\d{2}$/; /*  /^(19|20)\d{2}((0\d{1})|10|11|12)$/ */
		if(!regex.test($("#fEndtime").val())){
			alert("请输入标准的日期格式！");
			$("#fEndtime").focus();
	       return false;
	   }else{
	   	var myDate = new Date();//获取系统当前时间
	   	var now = myDate.getFullYear()+"-"+(myDate.getMonth()+1)+"-"+myDate.getDate();
	   	var btime = new Date($("#fEndtime").val());
	   	/* alert(Date.parse(btime));
	   	alert(Date.parse(now)); */
	   	if(Date.parse(btime) < Date.parse(now)){
	   		if (!confirm("您输入的日期已经过期，确认输入吗？")){ 
	   			return false; 
	   	   }
	   	}
	   }
	}else{
		alert("保质日期不能为空");
		$("#fEndtime").focus();
   		return false;
	}
}

$(document).ready(function(){
	
	 foodtype();
	
	companyowner(); 
	//alert($("#fInfoEmployeeId").val());
});          
</script>
</head>
<body>
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
  <div>
   <!-- 第一层，添加公司信息的标题 -->
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">食品样本基本信息录入</div>
   <div style="margin-left: 10%;margin-top: 20px;">
     <form action="addFood.do" method="post" enctype="multipart/form-data" onsubmit="return jiaoyan()">
        <!-- 第二层，添加公司信息的表格信息 -->
        <div align="center" style="height:350px;">
           <table border="1px" style="border-collapse: collapse;height:100%;">
             <tr style="height:80px;">
               <td><font color="red">*</font>食品名称：</td>
               <td><input id="fName" name="fName" maxlength="20" title="长度不超过20"/></td>
               <td><font color="red">*</font>食品生产日期：</td>
               <td><input id="fBirthtime" name="fBirthtime" maxlength="10" title="请输入标准的日期格式（2018-02-20）"/></td>
               <td><font color="red">*</font>食品保质日期：</td>
               <td><input id="fEndtime" name="fEndtime" maxlength="10" title="请输入标准的日期格式（2018-02-20）"/></td>
             </tr>
             <tr style="height:80px;">
               <td><font color="red">*</font>食品类型：</td>
               <td colspan="5">
                 <select id="fTypeId" name="fTypeId" style="width:600px ;">
                       <option value="">请选择食品类型</option>
                 </select>
               </td>
             </tr>
             <tr style="height:100px;">
               <td>食品生产许可证：</td>
               <td><input type="text" name="fShengChanPiCiId" id="fShengChanPiCiId" maxlength="10" title="暂时不填" disabled="disabled"/></td>
               <td><font color="red">*</font>食品状态：</td>
               <td><select name="fZhuangTai" id="fZhuangTai">
                       <option>可食用</option>
                       <option>不可食用</option>
                   </select>
               </td>
               <td rowspan="2"> 相关照片:</td>
               <td rowspan="2">
                   <img src="" id="img" width="100px" height="120px" style="display:none"><br/>
	               <!-- file的name值不能和实体类一样 -->
	               <!-- file的name值和控制器里的（MultipartFile）对象名一致 -->
	               <input type="file" name="file" onchange="yuLan(this)"/>
	           </td>
             </tr>
             <tr style="height:80px;">
               <td><font color="red">*</font>归属公司编号：</td>
               <td><select id="fCompanyId" name="fCompanyId">
                         <option value="">请选择归属公司</option>
                   </select>
               </td>
               <td>录入信息员工工号： </td>
               <td><input type="text" id="fInfoEmployeeId" name="fInfoEmployeeId" value="<%=loginor.getuEmployeeId() %>" readonly="readonly" title="不可填"/> </td>
             </tr>
           </table>
        </div>
        <!-- 第三层，提交表单信息按钮-->
        <div style="margin-left: 600px;margin-top: 20px;">
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