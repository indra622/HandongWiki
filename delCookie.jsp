<%@ page contentType="text/html; charset=UTF-8" %>
<%
	Cookie cookie = new Cookie("hguwiki_login","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	response.sendRedirect("http://teamlion.cloudapp.net/");
%>