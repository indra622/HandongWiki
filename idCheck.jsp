<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="user.*" %>


<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("input_id").toString();
out.print(id+"Used");
UserController idCheck = new UserController();
boolean check = idCheck.isUser(id);

if(check){
	out.print(id+"Used");
	out.print("Used");
}else{
	out.print("Use!");
}

%>