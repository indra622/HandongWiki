<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<%

 request.setCharacterEncoding("EUC-KR");

 Cookie[] cookies = request.getCookies();

 if(cookies!=null){

  for(int i=0;i<cookies.length;i++){

   if(cookies[i].getName().equals("hguwiki_login")){

    %>

    Cookie Name  : <%= cookies[i].getName() %><br/>

    Cookie Value : <%= cookies[i].getValue() %><br/>    

    <% 

   }

  }

 }

%> 

