<%@page import="ColloQuy.DAO"%>
 <%
 String aid=(String)request.getParameter("aid");
 String uid1=(String)session.getAttribute("uid");
  String qid1=(String)session.getAttribute("qid");
 DAO dao1=new DAO();   
 if(dao1.setAlike(qid1,aid,uid1))
 {  if(dao1.setCount(qid1,aid))
//    out.println(qid1+"#"+aid+"#"+uid1);
        response.sendRedirect("ViewPost.jsp");
 }
  %>
