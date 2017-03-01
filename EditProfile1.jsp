<%@include file="UserHead.jsp"%>
<%
String password=request.getParameter("password");
if(dao.setPW(uid,password))
{ response.sendRedirect("EditProfile.jsp?message=Password Updated Successfully");
}else{  response.sendRedirect("EditProfile.jsp?message=Password Updated Failed"); }

%>
<%@include file="Footer.jsp" %>