<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="wiki.*" %>


<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
String content = request.getParameter("content");

System.out.println("keyword:"+ keyword);
System.out.println("content:"+ content);
WikiController wiki = new WikiController();

wiki.setWiki(keyword, content);

%>

<script type="text/javascript">
	window.opener.location.reload();
	window.close();
</script>