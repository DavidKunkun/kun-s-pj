<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台页面</title>
</head>
<frameset rows="20%,*,15%" border="1px" style="padding: 2px;">
  <frame name="topFrame" src="top.jsp">
  <frameset cols="15%,*">
		
		   <%if(session.getAttribute("right").equals(1)){%>
		     <frame name="leftFrame" src="czy_menu.jsp"/>
		   <%}else if(session.getAttribute("right").equals(2)){%>
			 <frame name="leftFrame" src="gly_menu.jsp"/>
		   <%}else{%>
			 <frame name="leftFrame" src="xcy_menu.jsp"/>
		   <% } %>
		     <frame name="rightFrame" src="right.jsp"/>
  </frameset>
  <frame name="buttomFrame" src="bottom.jsp">
</frameset>
</html>