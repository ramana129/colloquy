    <%@page import="ColloQuy.DAO"%>
<%       String user1=request.getParameter("user1");
    DAO dao=new DAO();
         if(dao.dropUser(user1))
          {     response.sendRedirect("DropUser.jsp?status=<h1>User Deleted Successfully</h1>");
           }
         else {   response.sendRedirect("DropUser.jsp?status=<h1>User Deleted Failed</h1>");
           }
%>
