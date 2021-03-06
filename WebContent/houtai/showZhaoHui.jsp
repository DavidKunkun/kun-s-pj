<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>召回食品信息</title>
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
			window.location.href="selZhaoHuiByPage.do?page="+(parseInt("${pageinfo.page }")+1);
		}
	});
	$("#pass").click(function(){
		if("${pageinfo.page }" == 1){   
			alert("已经是第一页了");
		}else{
			window.location.href="selZhaoHuiByPage.do?page="+(parseInt("${pageinfo.page }")-1);
		}
	});
	$("#last").click(function(){
		window.location.href="selZhaoHuiByPage.do?page="+"${pageinfo.countPage }";
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
				window.location.href="selZhaoHuiByPage.do?page="+$("#page").val();
			}
		} 
	});
	
	
});
</script>
</head>
<body>
<div style="position: absolute;z-index: 2;">
 <br/>
 <br/>
</div>
<div align="center">
  <div style="margin-top:20px;font-size: 3;font-weight: bold;">召回食品信息</div>
  <div style="margin-top: 20px;height:25px;">
     <!-- <div style="float:left;width:10px;margin-left: 30%;"><input type="button" id="delete" name="delete" value="删除"></div>
     <div style="float:left;width:10px;margin-left: 35%"><input type="button" id="update" name="update" value="修改"></div> 
 -->  </div>
  <div style="margin-top: 10px;height:300px;">
  <table border="1px" style="border-collapse: collapse;">
     <tr height="27.2px">
        <!-- <td><input type="checkbox" name="qx" id="qx" onchange="quanxuan(this)"/>全选</td> -->
        <td> 序号 </td>
        <td> 被召回食品编号 </td>
        <td> 食品名称 </td>
        <td> 食品生产商编号 </td>
        <td> 食品生产商名称</td>
        <td> 商户编号 </td>
        <td> 商户名称</td>
        <td> 召回理由 </td>
        <td> 召回时间</td>
        <td> 执行人 </td>
     </tr>
     <c:forEach items="${list }" var="zhaohui">
    
         <tr height="27.2px">
           <%--  <td><input type="checkbox" name="ud" value="${zhaohui.xjId }"/></td> --%>
            <td>${zhaohui.zhId }</td>
            <td>${zhaohui.zhfId }</td>
            <td>${zhaohui.zhfName }</td>
            <td>${zhaohui.zhfcId }</td>
            <td>${zhaohui.zhfcName }</td>
            <td>${zhaohui.zhsId }</td>
            <td>${zhaohui.zhsName }</td>
            <td>${zhaohui.zhReason }</td>
            <td>${zhaohui.zhTime }</td>
            <td>${zhaohui.zhOperatorId }</td>
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
</body>
</html>