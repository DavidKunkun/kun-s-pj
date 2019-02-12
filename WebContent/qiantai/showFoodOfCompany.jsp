<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前台查询公司信息</title>
<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#hideshow").hide();
	$("#chaxun").click(function(){
		if($("#cId").val()!="" && $("#cId").val()!="0"){
			//校验是否是数字
			regNonzeroInteger=/^\+?[1-9][0-9]*$/;
			if(!regNonzeroInteger.test($("#cId").val())){
				alert("生产公司编号均为数字，请确认后再输入");
				$("#cId").val("");
			}
		}else{
			$("#cId").val("0");
		}
		
		
		$.post("selCompanyDuoTiaoJian.do",{cId:$("#cId").val(),cName:$("#cName").val()},function(companys){
			var company = eval("("+companys+")");//得到数组类型的值
			//alert(food.length);
			$("#tb").empty();
			if(company.length==0){//如果长度为0
				$("#hideshow").show();
				$("#tb").empty();
				$("#thd").hide();
			}else{
				$("#hideshow").hide();
				$("#thd").show();
				//alert("dddddd");
				for(var i = 0 ; i<company.length;i++){
					var f = [];
					 f[0] = i+1;
					 f[1] = company[i].cId;
					 f[2] = company[i].cName;
					 f[3] = company[i].cEntity;
					 f[4] = company[i].cPhone;
					 f[5] = company[i].cZhuangtai;
					 f[6] = company[i].cAddress;
					 f[7] = company[i].cChuangLiTime;
					 f[8] = company[i].cPeople; 
				    //alert(food[i].fId);
					var newTr = document.createElement("tr");
					for(var j=0;j<9;j++){
						var newTd = document.createElement("td");
						newTd.innerHTML=f[j];
						newTr.appendChild(newTd);
					}
					
					$("#tb").append(newTr);
					//alert("jjj");
				}
			}
			
			
		});
		
		
	});
	
});
</script>
</head>
<body>
<div>
   
   <!--  -->
   <div style="height: 60%;">
      <div>
          <div >
          <form id="selNameAndXKZform" action="selFoodDuoTiaoJian.do" method="post" enctype="application/x-www-form-urlencoded">
            <table style="border: solid thin black;align-content: center;">
               <tr>
                 <td>请输入想要查询的食品生产公司名称：</td>
                 <td>或者输入想要查询的食品生产公司编号：</td>
               </tr>
               <tr>
                 <td><input id="cName" name="cName" maxlength="20" title="长度不超过20"/>
                 </td>
                 <td><input id="cId" name="cId" maxlength="20" title="长度不超过20且只能是整数"/>
                 </td>
                 <td>
                 <input type="button" id="chaxun" name="chaxun" value="查询"/></td>
               </tr>
               
            </table>
         </form> 
         </div>
         <div style="margin-top: 20px;height:300px;">
         <input id="hideshow" value="暂无信息记录！"/>
  <table border="1px" style="border-collapse: collapse;">
    <thead id="thd" style="display:none;">
     <tr height="30px">
        <th>序号 </th>
        <th>公司编号 </th>
        <th>名称 </th>
        <th>公司法人代表 </th>
        <th>公司电话 </th>
        <th>公司经营状态 </th>
        <th>公司地址</th>
        <th>公司创立时间</th>
        <th>公司人数 </th>
      </tr>
    </thead>
    <tbody id="tb">
    
    </tbody>
     
  </table>
  </div>
      
      </div>
   </div>
   
</div>
</body>
</html>