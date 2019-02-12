<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String str1="${food.fImage }";
    String ss=new String(str1.getBytes("ISO-8859-1"),"utf-8"); //转码UTF8 %>
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
		window.location.href="selFoodByPage.do?page="+1;
	});
	$("#next").click(function(){
		if("${pageinfo.page }" == "${pageinfo.countPage }"){
			alert("已经是最后一页了");
		}else{
			window.location.href="selFoodByPage.do?page="+(parseInt("${pageinfo.page }")+1);
		}
	});
	$("#pass").click(function(){
		if("${pageinfo.page }" == 1){
			alert("已经是第一页了");
		}else{
			window.location.href="selFoodByPage.do?page="+(parseInt("${pageinfo.page }")-1);
		}
	});
	$("#last").click(function(){
		window.location.href="selFoodByPage.do?page="+parseInt("${pageinfo.page }");
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
				window.location.href="selFoodByPage.do?page="+$("#page").val();
			}
		}   
	});
	
	  
	$("#delete").click(function(){
		//alert(1);
		if($("input[name='ud']:checked").length<1){
			alert("请选择要删除的食品");
		}else{
			var str="";
			$("input:[name='ud'][checked]").each(function(){
			str+=$(this).val()+",";
			//alert($(this).val());
			})
			//alert(str);
			if (confirm("确定要删除吗？(删除后无法恢复请谨慎操作)")){ 
				 alert("删除成功");
				 window.location.href="delMoreThanOneFood.do?fIdstr="+str;
			 }else{ 
			  return false; 
			 }   
		}
		
		
	});
	$("#update").click(function(){
		if($("input[name='ud']:checked").length>1){//如果复选框选择个数大于一
			alert("一次只能修改一条信息");
		}else if($("input[name='ud']:checked").length<1){
			alert("请选择要修改的信息");
		}else{
			//alert($("input[name='ud']:checked").val());
			if (confirm("确定要修改吗？")){ 
				//转到修改页面  先去Con中通过id找到对应的操作人的全部信息 带着信息到新的jsp页面
				window.location.href="selOneFoodById.do?fId="+$("input[name='ud']:checked").val();
			 }else{ 
			  return false; 
			 }  
			
		}
	});
	$("#zhunru").click(function(){
		if($("input[name='ud']:checked").length<1){
			alert("请选择要申请的食品");
		}else{
			var str="";
			$("input:[name='ud'][checked]").each(function(){
			str+=$(this).val()+",";
			//alert($(this).val());
			})
			//alert(str);
			if (confirm("确定申请吗？(已经申请过的食品再次申请无效)")){ 
				 window.location.href="oAddCompanyFood.do?fIdstr="+str;
			 }else{ 
			  return false; 
			 }   
		}
		
	});
	
	
});

function yuLan(obj){
	    //alert("houtai/images/"+obj);
	    var image = document.getElementById("fImage");
	    image.src="";image.alt="";
	    //alert(image.src);
	    if(obj==""||obj==null){
	    	image.alt="暂未上传图片";
	    }else{
	    	image.src="http://localhost:8080/food_safety_supervision/houtai/images/"+obj;
	    	//alert(image.src);
			document.getElementById("fimgdiv").style.display="block";
	    }
	    
}
function yincang(){
	document.getElementById("fimgdiv").style.display="none";
}
</script>
</head>
<body>
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
	<div id="fimgdiv" style="position: absolute; z-index: 2; margin-left: 85%; width: 150px; height: 160px; display: none">
		<img name="fImage" id="fImage" width="100px" height="100px" src=""><!--houtai/images/${food.fImage }  -->
	</div>
<div align="center">
  <div style="margin-top:20px;font-size: 5;font-weight: bold;">食品样品信息</div>
  <div style="margin-top: 20px;height:25px;">
  <%if(session.getAttribute("right").equals(2)){ %>
     <div style="float:left;width:10px;margin-left: 30%;"><input type="button" name="delete" id="delete" value="删除"></div>
     
  <%} %>
     <div style="float:left;width:10px;margin-left: 34%;"><input type="button" name="zhunru" id="zhunru" value="申请准入"></div>
      <div style="float:left;width:10px;margin-left: 5%;"><input type="button" name="update" id="update" value="修改基本信息"></div> 
  </div>
  <div style="margin-top: 20px;height:300px;">
  <table border="1px" style="border-collapse: collapse;">
     <tr height="27.2px">
        <th><input type="checkbox" name="ud" name="qx" onchange="quanxuan(this)"/>全选</th>
        <th>食品编号 </th>
        <th>名称 </th>
        <th>类型 </th>
        <th>归属公司编号 </th>
        <th>食品状态 </th>
        <th>许可证编号</th>
        <th>是否准入</th>
        <th>生产日期 </th>
        <th>保质日期 </th>
     </tr>
     <c:forEach items="${list }" var="food">
    
         <tr height="27.2px">
            <td><input type="checkbox" name="ud" value="${food.fId }"/></td>
            <td>${food.fId }</td>
            <td>${food.fName }</td>
            <td>${food.fTypeId }</td>
            <td>${food.fCompanyId }</td>
            <td>${food.fZhuangTai }</td>
            <td>${food.fShengChanPiCiId }</td>
            <td>${food.fZhunRu }</td>
            <td>${food.fBirthtime }</td>
            <td>${food.fEndtime }</td>
            <td><a href="../houtai/images/${food.fImage }" onmouseover="yuLan('${food.fImage }')" onmouseout="yincang()">查看照片</a> </td>
            
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
         <td><input id="page" name="page" value="${pageinfo.page }" style="width:30px;"/>/ ${pageinfo.countPage }</td>
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