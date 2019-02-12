<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	if($("#xjsName").val()==""){
		alert("受检商户名称不能为空！");
		$("#xjsName").focus();
		return false;
	}else if($("#fId").val()==""){
		alert("食品样品编号不能为空！");
		$("#fId").focus();
		return false;
	}else if($("#cId").val()==""){
		alert("受检单位编号不能为空！");
		$("#cId").focus();
		return false;
	}else if($("#xjEmployeerId").val()==""){
		alert("责任员工工号不能为空！");
		$("#xjEmployeerId").focus();
		return false;
	}
	
	if(!$("#xcStartTime")==""){//如果输入了时间对时间格式进行校验
		/*判断是否是日期 yyyy-mm-dd  */
		var regex = /^\d{4}\-\d{2}\-\d{2}$/; /*  /^(19|20)\d{2}((0\d{1})|10|11|12)$/ */
		if(!regex.test($("#xcStartTime").val())){
			alert("请输入标准的日期格式！");
			$("#xcStartTime").focus();
	       return false;
	   }
	}
    if(!$("#xjEndTime")==""){//如果输入了时间对时间格式进行校验
    	/*判断是否是日期 yyyy-mm-dd  */
		var regex = /^\d{4}\-\d{2}\-\d{2}$/; /*  /^(19|20)\d{2}((0\d{1})|10|11|12)$/ */
		if(!regex.test($("#xcStartTime").val())){
			alert("请输入标准的日期格式！");
			$("#xcStartTime").focus();
	       return false;
	   }
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
			alert("您输入的食品样品编号不存在，请确认后重新输入");
			$("#fId").focus();
			return false;
		}
	});
	/* //校验员工工号确实存在
	$.post("selAllOperator.do",{},function(operators){
		var operator = eval("("+operators+")");//得到数组类型的值
		var k=0;
		for(var i = 0 ; i<operator.length;i++){
			if(operators[i].oId==$("#xjOperatorId").val()){
				k=1;
			}
		}
		if(k==0){
			alert("您输入的员工工号不存在，请确认后重新输入");
			$("#xjOperatorId").focus();
			return false;
		}
	});
	 */
	if(!confirm("确认提交吗？（巡检报告提交后不可修改）")){
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
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">巡检详情查处报告</div>
   <!-- 表单所在div -->
   <div style="margin-left: 10%;margin-top: 20px;">
    <form name="addXunJIanForm" action="addXunJian.do" method="post" enctype="application/x-www-form-urlencoded" onsubmit="return jiaoyan()">
      <!-- 表格所在div -->
      <div align="center" style="height:350px;">
         <table border="1px" style="border-collapse: collapse;height:100%;">
            <tbody>
             <tr>
            	<td rowspan="2"><font color="red">*</font>受检商户</td>
             	<td>编号：</td>
             	<td><input name="sId" id="sId" maxlength="20" title="请正确输入商户编号"/></td>
             	<td rowspan="2"><font color="red">*</font>受检食品</td>
                <td>编号：</td>
                <td><input name="fId" id="fId" maxlength="20" title="请正确输入食品编号"/></td>
             </tr>
         	 <tr>
                <td>名称：</td>
                <td><input name="xjsName" id="xjsName" maxlength="20" title="请正确输入商户编号"/></td>
                <td>食品许可证编号：</td>
                <td><input name="xjfShengChanPiCi" id="xjfShengChanPiCi" maxlength="20" title="请正确输入许可证编号"/></td>
             </tr>
             <tr>
                <td>序号</td>
                <td>巡查内容</td>
                <td>巡查结果</td>
                <td>序号</td>
                <td>巡查内容</td>
                <td>巡查结果</td>
             </tr>
             <tr>
                <td>1</td>
                <td>合法经营：</td>
                <td><input id="xjJingYing" name="xjJingYing" maxlength="20" title="输入长度不能超过20"/></td>
                <td>2</td>
                <td>卫生：</td>
                <td><input id="xjWeiSheng" name="xjWeiSheng" maxlength="20" title="输入长度不能超过20"/></td>
             </tr>
             <tr>
                <td>3</td>
                <td>食品包装：</td>
                <td><input id="xjBaoZhuang" name="xjBaoZhuang" maxlength="20" title="输入长度不能超过20"/></td>
                <td>4</td>
                <td>食品品质：</td>
                <td><input id="xjOverTime" name="xjOverTime" maxlength="20" title="输入长度不能超过20"/></td>
             </tr>
             <tr>
                <td>5</td>
                <td>真品：</td>
                <td><input id="xjFalse" name="xjFalse" maxlength="20" title="输入长度不能超过20"/></td>
                <td>6</td>
                <td>备注：</td>
                <td><input type="text" name="xjBeiZhu" id="xjBeiZhu" maxlength="100" title="输入长度不能超过100" /></td>
             </tr>
             <tr>
                  <td colspan="2"><font color="red">*</font>巡检最终结果:</td>
                  <td colspan="4"><select name="xjResult" id="xjResult" style="width:600px">
                                      <option>合格</option>
                                      <option>不合格</option>
                                </select></td>
             </tr>
             <tr>
                  <td colspan="2">原因描述:</td>
                  <td colspan="4"><input type="text" name="xjBuHeGeReason" id="xjBuHeGeReason" maxlength="100" title="输入长度不能超过100" size="80px"/></td>
             </tr>
             <tr>
                  <td colspan="2"><font color="red">*</font>巡检负责人工号:</td>
                  <td><input type="text" name="xjOperatorId" id="xjOperatorId" maxlength="20" title="请输入负责人工号"/></td>
                  <td>检测机构:</td>
                  <td colspan="2"><input type="text" name="xjInstitution" id="xjInstitution" maxlength="30" title="" style="width:250px"/></td>
            </tr>
            <tr>
                  <td colspan="2">巡查时间:</td>
                  <td><input type="text" name="xcStartTime" id="xcStartTime" maxlength="10" title="请输入标准时间格式"/></td>
                  <td colspan="2">检测时间:</td>
                  <td colspan="2"><input type="text" name="xjEndTime" id="xjEndTime" maxlength="10" title="请输入标准时间格式"/></td>
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