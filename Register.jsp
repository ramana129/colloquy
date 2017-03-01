<%@page import="ColloQuy.DAO"%>
<%
String name=request.getParameter("name");
String uid=request.getParameter("uid");
String password=request.getParameter("password");
String gender=request.getParameter("gender");
DAO dao=new DAO();
boolean b=dao.register(name,uid,password,gender);
if(b){
response.sendRedirect("index.jsp?status=<h2>Register Successfully.</h2>");
}else
    response.sendRedirect("index.jsp?status=<h2>Register Failed Already User Existed.</h2>");

%>