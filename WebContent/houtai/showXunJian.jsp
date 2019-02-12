<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巡检查处</title>
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
		window.location.href="selStoreByPage.do?page="+1;
	});
	$("#next").click(function(){
		if("${pageinfo.page }" == "${pageinfo.countPage }"){
			alert("已经是最后一页了");
		}else{
			window.location.href="selXunJianByPage.do?page="+(parseInt("${pageinfo.page }")+1);
		}
	});
	$("#pass").click(function(){
		if("${pageinfo.page }" == 1){   
			alert("已经是第一页了");
		}else{
			window.location.href="selXunJianByPage.do?page="+(parseInt("${pageinfo.page }")-1);
		}
	});
	$("#last").click(function(){
		window.location.href="selXunJianByPage.do?page="+"${pageinfo.countPage }";
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
				window.location.href="selXunJianByPage.do?page="+$("#page").val();
			}
		} 
	});
	
	  
	$("#delete").click(function(){
		//alert(1);
		var str="";
		$("input:[name='ud'][checked]").each(function(){
		str+=$(this).val()+",";
		//alert($(this).val());
		})
		alert(str); 
		if (confirm("确定要删除吗？(删除后无法恢复请谨慎操作)")){ 
			 alert("删除成功");
			 window.location.href="delMoreThanOneXunJian.do?xjIdstr="+str;
		 }else{ 
		  return false; 
		 }   
		
	});
	
	$("#update").click(function(){
		if($("input[name='ud']:checked").length>1){//如果复选框选择个数大于一
			alert("一次只能修改一条信息");
		}else if($("input[name='ud']:checked").length<1){
			alert("请选择要修改的信息");
		}else{
			alert($("input[name='ud']:checked").val());
			if (confirm("确定要修改吗？")){ 
				//转到修改页面  先去Con中通过id找到对应的操作人的全部信息 带着信息到新的jsp页面
				window.location.href="selOneXunJianByxjId.do?sId="+$("input[name='ud']:checked").val();
			 }else{ 
			  return false; 
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
<br/>
</div>
<div align="center">
  <div style="margin-top:20px;font-size: 3;font-weight: bold;">巡检详细信息查看</div>
  <div style="margin-top: 20px;height:25px;">
    <!--  <div style="float:left;width:10px;margin-left: 30%;"><input type="button" id="delete" name="delete" value="删除"></div>
     <div style="float:left;width:10px;margin-left: 35%"><input type="button" id="update" name="update" value="修改"></div> 
  --> 
  </div>
  <div style="margin-top: 10px;height:300px;">
  <table border="1px" style="border-collapse: collapse;">
     <tr height="27.2px">
        <td><input type="checkbox" name="qx" id="qx" onchange="quanxuan(this)"/>全选</td>
        <td> 编号 </td>
        <td> 受检商户编号 </td>
        <td> 受检商户名称 </td>
        <td> 受检食品编号 </td>
        <td> 食品生产许可证 </td>
        <td> 巡检最终结果</td>
        <td> 巡检负责人</td>
        <td> 巡检开始时间 </td>
        <td> 巡检结束时间</td>
     </tr>
     <c:forEach items="${list }" var="xunjian">
    
         <tr height="27.2px">
            <td><input type="checkbox" name="ud" value="${xunjian.xjId }"/></td>
            <td>${xunjian.xjId }</td>
            <td>${xunjian.sId }</td>
            <td>${xunjian.xjsName }</td>
            <td>${xunjian.fId }</td>
            <td>${xunjian.xjfShengChanPiCi }</td>
            <td>${xunjian.xjResult }</td>
            <td>${xunjian.xjOperatorId }</td>
            <td>${xunjian.xcStartTime }</td>
            <td>${xunjian.xjEndTime }</td>
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