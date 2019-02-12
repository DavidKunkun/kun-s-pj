<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>质量检测报告</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<style>
/* input{ 
	border:none; 
} */
    td  
    {  
        text-align:center;  
    }  
</style>
<script type="text/javascript">
function jiaoyan(){
	
	if($("#zjfName").val()==""){
		alert("食品名称不能为空！");
		$("#zjfName").focus();
		return false;
	}else if($("#fId").val()==""){
		alert("食品样品编号不能为空！");
		$("#fId").focus();
		return false;
	}else if($("#cId").val()==""){
		alert("受检单位编号不能为空！");
		$("#cId").focus();
		return false;
	}else if($("#zjEmployeerId").val()==""){
		alert("责任员工工号不能为空！");
		$("#zjEmployeerId").focus();
		return false;
	}
	
	//校验食品样品编号确实存在
	$.post("selAllFood.do",{},function(foods){
		var food = eval("("+foods+")");//得到数组类型的值
		var j=0;
		for(var i = 0 ; i<food.length;i++){
			if(food[i].fId==$("#fId").val()){
				j=1;
			}
		}
		if(j==0){
			alert("您输入的食品样品尚未申请准入市场，请确认后重新输入");
			$("#fId").focus();
			return false;
		}
	});
	//校验员工工号确实存在
	$.post("selAllOperator.do",{},function(operators){
		var operator = eval("("+operators+")");//得到数组类型的值
		var k=0;
		for(var i = 0 ; i<operator.length;i++){
			if(operators[i].oId==$("#zjEmployeerId").val()){
				k=1;
			}
		}
		if(k==0){
			alert("您输入的员工工号不存在，请确认后重新输入");
			$("#zjEmployeerId").focus();
			return false;
		}
	});
	
	if(!confirm("确认提交吗？（质检报告提交后不可修改）")){
		return false;
	}
}

</script>
</head>
<body>
<%if(session.getAttribute("loginor")==null){ %>
  <div>超过5分钟未操作，您的登陆已失效！<br>
       <a href="../houtai/login.jsp" target="_top">返回登陆页面</a>
  </div>
  <%}else{ %>
<div>
   <!-- 标题div -->
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">质量检测报告</div>
   <!-- 表单所在div -->
   <div style="margin-left: 10%;margin-top: 20px;">
    <form name="addZhiJIanForm" action="addZhiJian.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return jiaoyan()">
      <!-- 表格所在div -->
      <div align="center" style="height:350px;">
         <table border="1px" style="border-collapse: collapse;height:100%;">
            <tbody>
               <tr>
                 <td><font color="red">*</font>食品样品编号：</td>
                 <td><input type="text" name="fId" id="fId" maxlength="20" title="请输入正确的食品样品编号"/></td>
                 <td><font color="red">*</font>食品名称：</td>
                 <td colspan="2"><input type="text" name="zjfName" id="zjfName" maxlength="20" title="长度不超过20" style="width:250px" /></td>
               </tr>
               <tr>
                 <td>食品规格：</td>
                 <td><input type="text" name="zjfGuiGe" id="zjfGuiGe" maxlength="50" title="如200g,125ml等"/></td>
                 <td><font color="red">*</font>受检单位编号：</td>
                 <td><input type="text" name="cId" id="cId" maxlength="20" title="请输入正确的食品生产公司编号" style="width:250px"/></td>
                
               </tr>
               <tr>
                 <td>序号</td>
                 <td>检测项目</td>
                 <td>标准要求</td>
                 <td>实测值</td>
                 <td>单项检测结果</td>
               </tr>
               <tr>
                 <td>1</td>
                 <td>感官检测：</td>
                 <td>外观、色泽、口味均好、无肉眼可见杂质</td>
                 <td><input type="text" name="zjGanGuanShi" id="zjGanGuanShi" maxlength="50" title="长度不超过50"/></td>
                 <td><input type="text" name="zjGanGuanResult" id="zjGanGuanResult" maxlength="50" title="长度不超过50"/></td>
               </tr>
               <tr>
                 <td>2</td>
                 <td>营养检测：</td>
                 <td>很营养</td>
                 <td><input type="text" name="zjYIngYangShi" id="zjYIngYangShi" maxlength="50" title="长度不超过50"/></td>
                 <td><input type="text" name="zjYIngYangResult" id="zjYIngYangResult" maxlength="50" title="长度不超过50"/></td>
               </tr>
               <tr>
                 <td>3</td>
                 <td>微量元素检测：</td>
                 <td>达标含量xxx</td>
                 <td><input type="text" name="zjWeiLiangShi" id="zjWeiLiangShi" maxlength="50" title="长度不超过50"/></td>
                 <td><input type="text" name="zjWeiLiangResult" id="zjWeiLiangResult" maxlength="50" title="长度不超过50"/></td>
               </tr>
               <tr>
                 <td>4</td>
                 <td>添加剂检测：</td>
                 <td>达标含量xxx</td>
                 <td><input type="text" name="zjTianJiaJiShi" id="zjTianJiaJiShi" maxlength="50" title="长度不超过50"/></td>
                 <td><input type="text" name="zjTianJiaJiResult" id="zjTianJiaJiResult" maxlength="50" title="长度不超过50"/></td>
               </tr>
               <tr>
                 <td colspan="2"><font color="red">*</font>质检最终结论：</td>
                 <td colspan="3"><select name="zjResult" id="zjResult" style="width:600px">
                                      <option>合格</option>
                                      <option>不合格</option>
                                </select>
                 </td>
               </tr>
               <tr>
                 <td colspan="2">不合格理由（合格则不用填）：</td>
                 <td colspan="3"><input type="text" name="zjRefuseReason" id="zjRefuseReason" maxlength="" title="" style="width:600px"/></td>
               </tr>
               <tr>
                 <td colspan="2">备注：</td>
                 <td colspan="3"><input type="text" name="zjBeiZhu" id="zjBeiZhu" maxlength="" title="" style="width:600px"/></td>
               </tr>
               <tr>
                  <td><font color="red">*</font>质检负责人工号:</td>
                  <td><input type="text" name="zjEmployeerId" id="zjEmployeerId" maxlength="20" title="请输入负责人工号"/></td>
                  <td>检测机构:</td>
                  <td colspan="2"><input type="text" name="zjInstitution" id="zjInstitution" maxlength="30" title="" style="width:250px"/></td>
               </tr>
               <tr>
                  <td colspan="5">注：检测结果不合格时应及时下达消息，禁止推向市场</td>
               </tr>
            </tbody>
         </table>
      </div>
      <!-- 提交按钮所在div -->
      <div style="margin-left: 600px;margin-top: 20px;">
         <input id="submit" type="submit" value="提交"/> 
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
         <input id="reset" type="reset" value="重置" />
      </div>   
    </form>
   </div>

</div>
<%} %>
</body>
</html>