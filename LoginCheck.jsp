<%@page import="ColloQuy.DAO"%>
<%
String uid=request.getParameter("uid");
String password=request.getParameter("password");
try{
DAO dao=new DAO();
String status=dao.loginCheck(uid,password);
  if(status!=null){
      if(status.equalsIgnoreCase("Active"))
         {    session.setAttribute("uid",uid);
              response.sendRedirect("UserHome.jsp");
         }
      if(status.equalsIgnoreCase("Admin"))
        {   session.setAttribute("uid", uid);
            response.sendRedirect("AdminHome.jsp");
        }          
    }
  else{
       response.sendRedirect("index.jsp?status=<h3>Invalid Userid/Password Try Again</h3>");
      }
    }catch(Exception e){ 
     response.sendRedirect("index.jsp?status=<h3>Database doesn't exist</h3>");
      
    }
%>
