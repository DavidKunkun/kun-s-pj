<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司信息</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
function quanxuan(obj){
	if(obj.checked){
		//选中所有的name为ud的复选框:
		$("input:[name='ud']").prop("checked", true);
	}
}
$(document).ready(function(){
	
	$("#first").click(function(){
		window.location.href="selCompanyFoodByPage.do?page="+1;
	});
	$("#next").click(function(){
		if("${pageinfo.page }" == "${pageinfo.countPage }"){
			alert("已经是最后一页了");
		}else{
			window.location.href="selCompanyFoodByPage.do?page="+(parseInt("${pageinfo.page }")+1);
		}
	});
	$("#pass").click(function(){
		if("${pageinfo.page }" == 1){
			alert("已经是第一页了");
		}else{
			window.location.href="selCompanyFoodByPage.do?page="+(parseInt("${pageinfo.page }")-1);
		}
	});
	$("#last").click(function(){
		window.location.href="selCompanyFoodByPage.do?page="+parseInt("${pageinfo.page }");
	});
	$("#tiaozhuan").click(function(){
		if(isNaN($("#page").val())){
			alert("您的输入不合规范请重新输入");
			$("#page").val("");
			$("#page").focus();
		}else{
			if($("#page").val() > "${pageinfo.countPage }" || $("#page").val()<1){
				alert("页数范围为 1~"+"${pageinfo.countPage }");
			}else{
				window.location.href="selCompanyFoodByPage.do?page="+$("#page").val();
			}
		}   
	});
	
	  
	
	$("#update").click(function(){
		//alert(222);
		if($("input[name='ud']:checked").length>1){//如果复选框选择个数大于一
			alert("一次只能查看一条信息");
		}else if($("input[name='ud']:checked").length<1){
			alert("请选择要查看的信息");
		}else{
			//alert($("input[name='ud']:checked").val());
			if($("input[name='ud']:checked").val().endsWith("检测中")){
				alert("质检尚未完成，系统未录入信息不能查看");
			}else{//如果是有了许可证编号的，或者是检测状态不是检测中的，可以查看详细信息
				window.location.href="selOneZhiJianByfId.do?fId="+$("input[name='ud']:checked").val().split("+")[0];
			}
		}
	});
	
	
	
});
</script>
</head>
<body>
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
  <div style="position: absolute;z-index: 2;">
 <br/>
</div> 
<div align="center">
  <div style="margin-top:20px;font-size: 5;font-weight: bold;">申请质量准入信息表</div>
  <div style="margin-top: 20px;height:25px;">
     <div style="float:left;width:10px;margin-left: 65%"><input type="button" name="update" id="update" value="查看详细质检结果"></div> 
  </div>
  <div style="margin-top: 20px;height:300px;">
  <table border="1px" style="border-collapse: collapse;">
     <tr height="27.2px">
        <th><input type="checkbox" name="qx" onchange="quanxuan(this)"/>全选</th>
        <th>公司编号 </th>
        <th>食品编号 </th>
        <th>申请时间 </th>
        <th>准入时间 </th>
        <th>检测结果 </th>
        <th>许可证编号</th>
        <th>责任质检员工工号 </th>
        <th>备注 </th>
     </tr>
     <c:forEach items="${list }" var="companyfood">
    
         <tr height="27.2px">
            <td><input type="checkbox" name="ud" value="${companyfood.fId }+${companyfood.cfResult }"/></td>
            <td>${companyfood.cId }</td>
            <td>${companyfood.fId }</td>
            <td>${companyfood.cfStarttime }</td>
            <td>${companyfood.cfEndtime }</td>
            <td>${companyfood.cfResult }</td>
            <td>${companyfood.cfXiangXiJianCe }</td>
            <td>${companyfood.cfOperatorId }</td>
            <td width="50px">${companyfood.cfBeiZhu }</td>
         </tr>
         
     </c:forEach>
  </table>
  </div>
  <div style="margin-top: 20px;">
     <table>
       <tr>
         <td><input type="button" id="first" name="first" value="首页"/></td>
         <td><input type="button" id="next" name="next" value="下一页"/></td>
         <td></td>
         <td></td>
         <td>  请输入要跳转的页面:</td>
         <td><input id="page" name="page" value=${pageinfo.page } style="width:30px;"/>/ ${pageinfo.countPage }</td>
         <td>页 </td>
         <td></td>
         <td></td>
         <td><input type="button" id="tiaozhuan" name="tiaozhuan" value="跳转"/>  </td>
         <td><input type="button" id="pass" name="pass" value="上一页"/></td>
         <td><input type="button" id="last" name="last" value="尾页"/></td>
       </tr>
     </table>
     
     
  </div>
  
</div>
  <%} %>

</body>
</html>