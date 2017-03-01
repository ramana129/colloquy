<%@page import="java.sql.ResultSet"%>
<%@include file="AminHeader.jsp" %>
<link rel="stylesheet" type="text/css" href="Styles/autumn05.css">
 <div id="maincol">
     <br><br>
<div class="mid">
<%
        String status=request.getParameter("status");
     if(status!=null)
         out.println(status);
%>
<%
    ResultSet rs=dao.getUser();
    out.println("<table>");
    out.println("<tr><th>User Name</th><th>&nbsp;</th><th>User-ID</th><th></th><th>Delete</th><tr>");
        while(rs.next())
        {
            out.println("<tr><td>"+ rs.getString(1) +"&nbsp;&nbsp;</td><td>&nbsp;</td><td>"+ rs.getString(2) +"&nbsp;&nbsp;&nbsp;</td><td>&nbsp;</td><td><a href='DropUser1.jsp?user1="+rs.getString(2)+"'><img src=\"Images/DUser.png\"></a></td><tr>");
        }
  out.println("</table>"); 

%>
</div></div>
<%@include file="Footer.jsp"%>
