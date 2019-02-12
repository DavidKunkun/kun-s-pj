<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>

<div style="margin-top:20px;font-size: 5;font-weight: bold;">被召回食品信息</div>

<div>
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
</div>
</body>
</html>