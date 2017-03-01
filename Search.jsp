<%@page import="java.sql.ResultSet"%>
<%@include file="UserHead.jsp" %>
<link rel="stylesheet" type="text/css" href="Styles/autumn05.css">
 <div id="maincol">
     <br><br><br>
  <%
    String search=request.getParameter("search");
     ResultSet rs=dao.getSearch(search);
   rs.afterLast();
   out.println(rs.previous());
           while(rs.previous())
         {
         out.println("<p class=post >"+rs.getString(3)+":<a href='ViewPost.jsp?status="+rs.getString(1)+"' style=\"text-decoration: none; font-size: 16px; font-weight: 600; color:#999\">"+rs.getString(2) +"</a></p>");
//         out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name=\"post\"></textarea>");
        ResultSet rs1=dao.getAns(rs.getString(1));
        if(rs1==null)
        {  out.println("No Answers"); }
         while(rs1.next())
         {    String s=rs.getString(1);
              ResultSet rs2=dao.getCount(s);
//              while(rs2.next())
//                {   out.println(rs2.getString(1));        }
            out.println("<p style=\"text-decoration: none; font-size: 16px; f color:#999\" ><u>Ans</u>:"+rs1.getString(2)+"</a>&nbsp;&nbsp;&nbsp;&nbsp;<a>Likes:</a>"+rs1.getString(5)+"</p>");
          }
        out.println("<hr>");
          }
    %>
  </div>
<%@include file="Footer.jsp"%>
