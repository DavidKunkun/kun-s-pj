<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    input{ 
	border:none; 
    } 
    td  
    {  
        text-align:center;  
    }  
</style>
</head>
<body>
<div>
   <!-- 标题div -->
   <div style="margin-left: 45%;font-size: 4;font-weight: bold;">质量检测详情报告</div>
   <!-- 表单所在div -->
   <div style="margin-left: 10%;margin-top: 20px;">
      <!-- 表格所在div -->
      <div align="center" style="height:350px;">
         <table border="1px" style="border-collapse: collapse;height:100%;">
            <tbody>
               <tr>
                 <td><font color="red">*</font>食品样品编号：</td>
                 <td>${zhiJian.fId }</td>
                 <td><font color="red">*</font>食品名称：</td>
                 <td colspan="2">${zhiJian.zjfName }</td>
               </tr>
               <tr>
                 <td>食品规格：</td>
                 <td>${zhiJian.zjfGuiGe }</td>
                 <td><font color="red">*</font>受检单位编号：</td>
                 <td>${zhiJian.cId }</td>
                
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
                 <td>${zhiJian.zjGanGuanShi }</td>
                 <td>${zhiJian.zjGanGuanResult }</td>
               </tr>
               <tr>
                 <td>2</td>
                 <td>营养检测：</td>
                 <td>很营养</td>
                 <td>${zhiJian.zjYIngYangShi }</td>
                 <td>${zhiJian.zjYIngYangResult }</td>
               </tr>
               <tr>
                 <td>3</td>
                 <td>微量元素检测：</td>
                 <td>达标含量xxx</td>
                 <td>${zhiJian.zjWeiLiangShi }<input type="text" name="zjWeiLiangShi" id="zjWeiLiangShi" maxlength="50" title="长度不超过50"/></td>
                 <td>${zhiJian.zjWeiLiangResult }<input type="text" name="zjWeiLiangResult" id="zjWeiLiangResult" maxlength="50" title="长度不超过50"/></td>
               </tr>
               <tr>
                 <td>4</td>
                 <td>添加剂检测：</td>
                 <td>达标含量xxx</td>
                 <td>${zhiJian.zjTianJiaJiShi }<input type="text" name="zjTianJiaJiShi" id="zjTianJiaJiShi" maxlength="50" title="长度不超过50"/></td>
                 <td>${zhiJian.zjTianJiaJiResult }<input type="text" name="zjTianJiaJiResult" id="zjTianJiaJiResult" maxlength="50" title="长度不超过50"/></td>
               </tr>
               <tr>
                 <td colspan="2"><font color="red">*</font>质检最终结论：</td>
                 <td colspan="3">${zhiJian.zjResult }
                 </td>
               </tr>
               <tr>
                 <td colspan="2">不合格理由（合格则不用填）：</td>
                 <td colspan="3">${zhiJian.zjRefuseReason }</td>
               </tr>
               <tr>
                 <td colspan="2">备注：</td>
                 <td colspan="3">${zhiJian.zjBeiZhu }</td>
               </tr>
               <tr>
                  <td><font color="red">*</font>质检负责人工号:</td>
                  <td>${zhiJian.zjEmployeerId }</td>
                  <td>检测机构:</td>
                  <td colspan="2">${zhiJian.zjInstitution }</td>
               </tr>
               <tr>
                  <td colspan="5">注：检测结果不合格时应及时下达消息，禁止推向市场</td>
               </tr>
            </tbody>
         </table>
      </div>
      <!-- 提交按钮所在div -->
      <div style="margin-left: 600px;margin-top: 20px;">
         <input type="button" value="返回" onclick="window.location.href='selCompanyFoodByPage.do'"/>
      </div> 
   </div>

</div>
</body>
</html>