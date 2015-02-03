 <%@ page language="java" contentType="text/html;charset=KSC5601" %>
 <%@ page import="user.*" %>
 <%@ page import="java.util.*" %>
 <HTML> 
 <link rel ="stylesheet" type="text/css" href="css/Wikicss.css">
 <BODY>
 
 <CENTER> 

<% String name = request.getParameter("input_name"); %>
<% String id = request.getParameter("input_id"); %>
<% String pw = request.getParameter("input_pw"); %>
<% UserController user = new UserController();
	boolean bool;
	if(user.setUserId(id,pw))
		response.sendRedirect("http://teamlion.cloudapp.net/");
	else{
		response.sendRedirect("http://teamlion.cloudapp.net/wikiRegister.jsp?duplicate=1");
		return;
	}
	 %>
	
 </CENTER>

 </BODY>
 </HTML>